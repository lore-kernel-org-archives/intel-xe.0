Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377BCC2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 19:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A7210E0C5;
	Mon, 20 Nov 2023 19:43:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D01B10E0C5
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 19:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700509421; x=1732045421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H5ieZb0rMqZKGNiJVRBB0k4n2hO8ywC7FcpMGtLt7O4=;
 b=irqs791mwLNkeRcnd0Z2GQNd+pXryiUJh7jFI1JXXdyCNFP6CpleHECs
 2AxP4UVCmNbkxEF678Eiyu22rRHmvFTIk5Xn3TV/YkFMxTD1AH7iG81Nd
 boC3x77jN9SUTO4yILdejXm1O+DpyZKDPsLAAhNvVK08y/KcQy4YKnJMp
 VkAgovPNl9819ly6iAEwZj9ryS09+b5mZNHp/Z6Qe7G/e1pkEvcwu3mqh
 FazIOSTq1grhrVO0jI4w9jQ/UOsHtAAJH6hBwgzY9abrKd3FEwFYZs/fz
 zoBpr5DgUds4f/InLGd0JQpeE09982MokgTOPuzvTuxJWJu+OU+EQEnVY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394535988"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="394535988"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 11:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="742813322"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="742813322"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 11:43:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:43:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 11:43:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 11:43:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtnGDc6DfxkJH+0xP9QoYPj2lrWwEVeB+Xv5LyOUvPm2wqXuA8u6/kYQfWgRiRzt81wt2RMW7SZCwDw4OAF1Aa1p41j6HNlutImiS/wgs+DpkPVGrgyX48zXZzPXArldLCxFbwzg40jPh1af+hI0YmLXpC/VtNOIpJvkYOHvGiZodQixgwWWTioBUIayi97MjmXGcwIaLnhi0vrqJwrj5nLln2ORTt6gTdouK45q4Z0jyi0q6DOX51vGbEbR3wjNO4HAggS0P8etB1G0iAqBDCCt2956ZkbCdlRzAa387DPpNcxa0dusrPnsxOJvJM0qVTzEiohnbV833D0x6Npprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM3+x10dy1z+ka68Q9uq1/KU665rkWKdIw5x7sDxAVY=;
 b=j7dgzJAb1SpGqQvKNO0VchS5ROg9uc+S8A9EHzEuaUWjiRPgLJiL9uFibstkxtyhKBhmqOdeWRaj8v2qftvEulISaowQTdps01K+kcJUAw3VSjP/ix51Q/bebAKA5Yt+HMFoBpE7cX2d6UWLC62S2lPE6ntHoDoNrTy393HVu7m4HIp/NWPZdnq/oBCdNDYV37Ra2cAhHri/64SQVZbWynmW5L9pxxxmbKVmDmMloeUYkRhpdH0SIDtiMOzT525pHchykK+hKRxCmimjSYvL8OgOORTj+AIyxqf16i2+lIZDjI+AacBthXIwyI90TouyjYYX1oqnD3bPtuNvNt/3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 19:43:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 19:43:38 +0000
Date: Mon, 20 Nov 2023 13:43:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <m6xyws4ypkntcp75e526xmb6j3jk4g7qmzkyznymuc4runmncz@d44fjgd6qxiy>
References: <20231120185712.80150-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120185712.80150-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cc3007-dc25-460e-c500-08dbea00fdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAjSQS7BBDgyMZilEF9lbvvJ8c2zaUvefWrBQnJnHxibmlPZwPgm1SXVmv2GR/MlxBBLKiaPco0CS9W/3EMpjDJZr5rO12kaLFuFkQua1SC5R82Gv/hHxjHfbkZuqih8eM9ZcXVY8BJuaofBkBjtOsFzxcR097AsISieUsxn7akFrGiexs5Og8aKYFWFS/3xNKA7C0Z5SdNhkLXGva82mrFuC2PdiOHMQbviWXRGXFgw+Y9dp9iY3rK1dMJv39fI7cOC3ncUEbJulXI+RbzyTXWpq2XoQg+qcWpH0d4WAKqW1H2pUUye1DyLpoZd6gtRaXEHB69AwHLSGxduOOEJNK7T7l/wv/PyeQ10UX5u6haKK2aqw4vR4VjPW+Jo83VeYLqtirjI9LAoDQhdiBoTauG2/JT8pGJcbxGAiNbpf5pEP6A1LAaBpapvZYbf5uxf+XNgtmCrGbwQownFPW8rPbXbGAQF5f2l4xYX1x9h2AnyRLZhjwfjRrGVbbCBhwQQSXD01X8DuWvTFK3drnmX8y/gGN0vs0euXsGA1M6VykUjNjuEA3xA7vAVWh+jrKwX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(8676002)(4326008)(6862004)(41300700001)(8936002)(4744005)(2906002)(6636002)(316002)(66946007)(66556008)(66476007)(86362001)(26005)(6486002)(478600001)(6512007)(9686003)(6506007)(83380400001)(38100700002)(33716001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?X8SOjpUoC146QeSe0ozgv9yAgVa4tSBCYlajvtyjNhC3mpxMBOJWgROS2A?=
 =?iso-8859-1?Q?Clz7wOL6SCJqKYaLjl+HYm0YMYB3+isFgv8Iqg/CQvDKdUB3r4nkCRzlVq?=
 =?iso-8859-1?Q?g/Lki8wr3ktAnZSJUDmYZeZ7YsnwnEe56jgRLIKpJr9Lc20bak5gnMX0Ry?=
 =?iso-8859-1?Q?wc5GFuOmtc7KOXZlXpyTf5yn2ACAqFvwDVp7R+o4dKuPOLJuKKPrJfGPB2?=
 =?iso-8859-1?Q?ntJUy/p4/NYkTxnFVhib3XQT0ArsIXRJhQr3Al6dMvWYmipcGNhIWRtOE6?=
 =?iso-8859-1?Q?bsox+DFfGirBefpilXl6mhbRW/SRUlIspWVA7mdNEg8DbSRxv0iBegH8bn?=
 =?iso-8859-1?Q?n3G3dpqqfQFcQVOWd1JbddzECUPxnwJ7ji/7P5e+2RxFbf5a+cUfxm2qlK?=
 =?iso-8859-1?Q?iOetsWdr0qRJ7+8LeInWLxpGS2jsNxVfIUjs85Im9SHLfe5tJR987aN0mp?=
 =?iso-8859-1?Q?FD6PkpMTxTTy8usVFFGqsytFXgWR4razsSkLUZSNS9YuAMzz1GJxuj6+XW?=
 =?iso-8859-1?Q?kQnXhCHtUCjLh0+M+z+YyoT4t3SeVl2xtuVfIc0HZtW2E882aOOXLyGXZw?=
 =?iso-8859-1?Q?S2hT5YAYxr4KkH9jWXoKzY1f2x5u7GykJXUTK6rHxz6p7Kpi5YVsGi+LbP?=
 =?iso-8859-1?Q?hr3PgipDb2lbsMNxdc7mBBjhM8czcd4JQQfZg9y/u5883dEx4wEPKetQCW?=
 =?iso-8859-1?Q?GOEmbEqcHfPtLCYsWR6+UJFsETGO8UtaI8rNo7xW+hbfSXggt8S/5L/LVe?=
 =?iso-8859-1?Q?CU/2n43IuR93Yv1WvDU4+T00UPbW6+hOYm+PxYgCpKmVw6L19Ub161lN71?=
 =?iso-8859-1?Q?qTVbSYQSqnguJqJH0V4lHsYNALg8ot5KTkJjOvs+fefwANCUoEBOLjqv0Z?=
 =?iso-8859-1?Q?TWderYwqmTFkG+CRnBCKkUkdx+cdsQzwhMUEW8X+epqVbSbD6hns+OpIej?=
 =?iso-8859-1?Q?0wCYmWEysITQmUbYJvItSmV8NWoY1ujxaVDksR2tIbgdUyQEyBMY57D02p?=
 =?iso-8859-1?Q?R4lkLNxtV1sCFFH5tjwbkp5EL3gRsk/MWIeOM+dk3QGj7hBTrGtNZYfBIh?=
 =?iso-8859-1?Q?ergQWXkOYmo0eLZFWq4TSjuN9kGoB7wnM263olfT6m0m2tvoA9giqr7bz4?=
 =?iso-8859-1?Q?vlby4TMj/TkPftPK7FLvhVrd72hr+A0ciaC3HBSMA8XU7GoB2/vSsa2vp4?=
 =?iso-8859-1?Q?pveLByIm44GyJKWTJgj8ymLZRc+Gwfr3L0TszS4DAOXemv6hW3Tdv9I7Td?=
 =?iso-8859-1?Q?hnhOr3IEQl01QgBRpPHfIzluR8h2cb+nvZXmLJlnoihhbZTDrpvAHUDD62?=
 =?iso-8859-1?Q?WzCB7QlC8L7AZfh/7Ct8I6o3um9MA8Oj7VzG0owr2kxPVd8mtv841wMmMO?=
 =?iso-8859-1?Q?ld+CEdHa65Cf1jc4DAAftRCPkLYA7RtLpeK7WfuzgYsjg1oLjRbrM1FnFY?=
 =?iso-8859-1?Q?sNZXAmxxnJ2piV8tmE9UtBZoXzwUKWiJH+Q5glwzrWJQjz1sYS+h6mW2Hk?=
 =?iso-8859-1?Q?rNtsz6Rp7R26Ak1zC1Cw85mKBA9Noly47nMFYQN1ntiZrMoAnrVYi3zjrF?=
 =?iso-8859-1?Q?egavEGpbuFfdDywQTty/euavhaktXilstNjxmMr+KhWNNpuMSEPchWC4kP?=
 =?iso-8859-1?Q?6Trexj+mmPphGw6Hn3B6sdi2/X8gbIuKrzDKDd5DqW7FRUxaa2VDU0WA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cc3007-dc25-460e-c500-08dbea00fdad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 19:43:38.0851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ekn/v/bUQO+AHE2EpLhuNOfbIRNJqOB8DpUKuR/kH2Y9LLsVx4jyExJvopR8yke5jPq27NEV4pRtq0DJi9Yw8R4Qu7EHqQmulSW8pn/NMpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Include RPL-U to pciidlist
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 10:57:11AM -0800, Jose Souza wrote:
>RPL-U is defined as a subplatform but those PCI ids were
>not included in pciidlist so Xe KMD would never probe device with
>those ids.
>This is following what i915 does to include RPL-U to PCI ids
>probe list.
>
>v2:
>- change order to match i915
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> include/drm/xe_pciids.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 68fbab161feb0..058a68de3bb57 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -117,6 +117,7 @@
>
> /* RPL-P */
> #define XE_RPLP_IDS(MACRO__, ...)		\
>+	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
> 	MACRO__(0xA720, ## __VA_ARGS__),	\
> 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
> 	MACRO__(0xA7A8, ## __VA_ARGS__)
>-- 
>2.42.1
>
