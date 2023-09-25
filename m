Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C632ECE7AA5
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 16:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772F010E2A8;
	Mon, 25 Sep 2023 16:55:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A096710E2A8
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695660932; x=1727196932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XOqQxWk/kUUL4jMn+pwrcn4CRozVKzwJ3wMi1L7/lh4=;
 b=Qld+K27Eco7inxQWVfxDPt5YMmCodhb8HFAkAnaOJh5EujgerWzBZE4t
 Vxm9UFlSP301iKH0rJMvnfvC8e43SGZvqzxfvC9TnMJd9OrdQUdGC9GyR
 Fnq/q3IBMdQ8fkyaMAhdNEX+TfAo1BlLfdl0u32y+Kc0G9wykt5A+MvSq
 OedxVR3qab3ckNcDwFZZ0FPin1SOqkQGVukA50yCZDXRjhL3yB1xlV4Ge
 Oqw2fKchlYPgiLj1/oOmwW47RSqaotx21Fu5jAoRBV3hXP0L4ocA7o9Fw
 0PdTd2ate3OcWtSGZG563MoQjhaV0ITfks2JLZrdUKJBgearpeb01T3bC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445411762"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="445411762"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 09:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748401182"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="748401182"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 09:55:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 09:55:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 09:55:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 09:55:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 09:55:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ID9c7WudyxxNlMoX4zbXT8y1TF8bsT0AU/++LTcVHxAArXm+a9Jr46deFM5XRyvlVLB1blZPkIKTVxWBc7+KvECZ+k5GQkmsmQ4q6JMH0CobctGtAkN9ginswrJSo/yWAELnjBxniIAw/2O0hZgEyJ+zaLzXQHY1a81UPKkUqR3MbMpFzxB0TW7h3h731tp7a10DNZqgR9UaA+KfscgLvnWnjtazbAx/+naYfCpHln1tpH16E/kE8m2+qe210JsQd//8wJpOiN9ZY1EDjrrWaeec05O5EteCYB7v2EoWRdEl4sxmXAQtY/LHcqvwkl1aYXcuA4k5F2QAO2SeYkZmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KasaU+nlMBZvqnc3Z12A+VWMoZLTPwOmSxLHq2em+Gc=;
 b=UjDg6cEwuowzHwElWDkAUcyCZ6mi54WGeGEb209QsON0kjho5riIoIQBFAjOyfy0QRQIs6QA35DHHasjbVtjwO1xjxb/wl0OHOHnQirHRDqNtZzL/YDWFpAwF5VTxgsCKJ2ZcoRk84kDkhwPGKl/ufLZktMjdvqMKB+iLC15vO4t/7v+wYCO2ceRX7+YJ5Dv7seb8XlBigoqvdelmeMC0O20G7SgNU+qq8KGMTx8b9/TQW+aSTFsUMpObzO0ZNBc0iuCUegimUjE7J5zekOpHYwipSQn2gPWmqYpmnIwz/8HArUfu17ZfMnO6iC3Vu3+clElLOGQ5AS8/OyN24l1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5252.namprd11.prod.outlook.com (2603:10b6:610:e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 16:55:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 16:55:02 +0000
Date: Mon, 25 Sep 2023 11:54:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
Message-ID: <5g5cmnsvxmxum7gaft2frkocsvclbg2qtw36ikdayoustbdziu@g6rx3grhddmc>
References: <20230920213259.3458968-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230920213259.3458968-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: BYAPR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e187508-53ae-4482-3868-08dbbde828c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wqnhLNfXK8CFxamujUbeE9l/ssYF/S99+jIi34KgsSr1v0hR5nnaBNq+PUAnxf8lkpFmyUcUguRNz5qaBty9encxAOdOLJmBjHXJwMHD/9mJx7D2Z16H2RV1TFe/QN8YNJBkMZe4iY79pizZYv0Z4/qB28ZDEi1HPvI2m8tlhqnHEAHpR+6V90U4Y/+GPCLV24lpHq5H38zmIiuReS75Dz4Hbw0nj5l6BSwURGowF1wTXnlfDW0I2HQLHAzcEicJfgJx9gp1poDj7jJjjkbzWqIuH6axEF8CbtXcL03Ph56AgcH+rYWEP9Z4bMKtvokiwKno6UDtAAy/e0MG4oY/PcrVqX/hoGZvGcrcEbBeYzAOdGdbRkglsAu03h4otfFLxTYjFA02iK6SUaxcr8D9kPlq4w11bhJOa3biw2JddncbY4FMtRpUlMkv5hY04Y16LN7MOWJxJsI/9V8lHtSdk0bsBlZCTN+pZfikYHS4Lh8m30GooeT6NEND1XHLVSdaSffqUU/zVqQ3jhrxkqDLFRLXW1lBP7ID9LxlaBPKFgy5eBP7TswRCrD8uzwTnyPT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(1800799009)(186009)(451199024)(83380400001)(6862004)(316002)(41300700001)(66946007)(4326008)(38100700002)(66476007)(8936002)(66556008)(6636002)(2906002)(8676002)(82960400001)(86362001)(478600001)(107886003)(4744005)(5660300002)(9686003)(26005)(6666004)(6512007)(6486002)(33716001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7PKKoM21nuzSLfMcUuhLCVYxrV9WGUT62Nk5KD7pfdOF15Ig5dkVmiIZCFel?=
 =?us-ascii?Q?twKmadTkTqzmjgijcxG0qpuCMl1uwugu/dNpxpgvLArxGO6e50neY5UrjwIa?=
 =?us-ascii?Q?ReAoPumQMgTW890mlB79j4M+d/qHgqBYC+X7DWIepIlD9+73aQnJ8Zt51p1P?=
 =?us-ascii?Q?o0GnrNQysJhhxMfUeN63u9CIIU01sLwPRLH/BaSD6NE2rZyXOlNlR+Ydn57p?=
 =?us-ascii?Q?rGxdEJMOZrGOHWqTIswpmuelaEKRUbC473jeLxEoBYLCH3SbiEyFRmoFqfYa?=
 =?us-ascii?Q?1Ok6DNHkq8QQZLG+0JWxbtYBePd9UeoCmOnIEZYkOpig/0cJxLZR6BNhof89?=
 =?us-ascii?Q?6DawInXrjR/+2fIGv3M4G6BEGZpR9xTx1Pe6eYJADl3mqDE3f2ZwAr8zu8bz?=
 =?us-ascii?Q?HX4C1z8Xf9cJQXQCntSl4bhSEb32X9U8dbHTqOldancgYCRJJ1KE7OdPg9tX?=
 =?us-ascii?Q?cSbcbxPauWi/2r+rbPSJe6p7EEd28eu9ra3pe7SOs6QPs/Ob1lL+uLjsASzQ?=
 =?us-ascii?Q?I5aonKB0fPPHJ+8dyo9P23cqpVVygoRbTzmNxdbXSB4MMseVtuHsaZMcOo5u?=
 =?us-ascii?Q?s8diNim681NooWj0O0x8euduuq9sLWnbcB/WKhdctTD81hh191mOl0R1fTmJ?=
 =?us-ascii?Q?5SdGNKjIDF9eJc7FEN2DzsMIBVDf1NQHhA+1eaaJrAKyBroczsYtAIa0odFd?=
 =?us-ascii?Q?IQ41qdD7M6ZB2lT6I4dHECo4JNVp+z5WV3FSRMv/PVzNsPBoBvmtnfPXbQfx?=
 =?us-ascii?Q?oAJMrJq1LpVHSQmLsDRPHdVmhVaxqvSC/8Yi+g0jNvukj4EKAmKbur+mYS2Z?=
 =?us-ascii?Q?KRBRThD14pWHTgHKkLnpiEWKfbpzJxIGgbambJWCAPaM3LHjSGxnqR+POaQo?=
 =?us-ascii?Q?5zV6UFthS91I484r+d1PInJXYROFg8MM5o7tK4wiyivjK66oQXyG+EXH5G4N?=
 =?us-ascii?Q?WeJnHfnhGSoAuuUeQ9OKjIS1e2L7HQp9zqm3f408KM3xRMc2qlLe2Bmuo7Mv?=
 =?us-ascii?Q?60fWNnpURyJXxb2+3jiR7vHrVS+vjecCw8Sxu7/1YGYPhBOReddMqSsZ8C2P?=
 =?us-ascii?Q?L1KKvsZ+m3+AJdZ4emy9dXwSJoGBlmNn3sKFVod0uyakL3hd8+oytFrQsPfa?=
 =?us-ascii?Q?/B46pYiOR6X6a29Y64Zis044HKFsXXvHV5gXppRgMwBB01WYnv/oLya+Ke0O?=
 =?us-ascii?Q?oxAY/hsIzYotdDiZ+tE1bdMWAUii/UgBOkY/qnOiggq54J6gkVS6kUN5DEe1?=
 =?us-ascii?Q?Gt1QQszxMJJZbxUEmYtMy5Mba2eNf0AkoiG0U9CeyMNO7mlxD6e6DiWKIJuX?=
 =?us-ascii?Q?/IyvBzYs3UqfJe0+UbYlXI/MFufOSAAx05C1jLZJtZ6adeMefMd0GNmB7Q5v?=
 =?us-ascii?Q?+pytVeuzrULNCU4v9acfHukPNdHu7kOS+YFdT9UzSPBen0ikXyesBZBMjKBx?=
 =?us-ascii?Q?/NTlOvGFufIa/RpbBA8HUISjh5QAmPzVXu3DSgwaPmgGVsgEzZGWg7nac3i0?=
 =?us-ascii?Q?U80Ki2LIhXVOQoRWqnkXbcbk6ORxuRtEpZvwCplFihQPkjN3jxLZHjY2wxzu?=
 =?us-ascii?Q?NXZUn3cI9kHHj5pCbCyrjngyKRF65dqhnXUC+kMAyGFtzNIT9ozY9AGmZl8t?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e187508-53ae-4482-3868-08dbbde828c8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 16:55:01.9618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQppEmZb6ieW0VS6qUplaq69/eaQL3ttiye1YFEBmWhvWOS9F6CcYTNYs1XIen4HTAnQ5k31J1RqO0ymXExVYHHun4xYUodj1Gy/CwaaSO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5252
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Align size to PAGE_SIZE
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 03:02:59AM +0530, Pallavi Mishra wrote:
>Ensure alignment with PAGE_SIZE for the size parameter
>passed to __xe_bo_create_locked()
>
>v2: move size alignment under else condition (Lucas)
>
>Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_bo.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index c5e4d04c4d58..59c57430918b 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1218,6 +1218,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> 		flags |= XE_BO_INTERNAL_64K;
> 		alignment = SZ_64K >> PAGE_SHIFT;
> 	} else {
>+		size = ALIGN(size, PAGE_SIZE);
> 		alignment = SZ_4K >> PAGE_SHIFT;
> 	}
>
>-- 
>2.25.1
>
