Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FD7C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 21:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DD610EA99;
	Fri, 15 Dec 2023 21:50:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7071710EA99
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 21:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702677013; x=1734213013;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CC36ttXmNEEOk02dMHxPpd9cznfWuYxg+ziul3a0Ca0=;
 b=Q0BD2uj0PcJ79zAgXr7jEXVDLLCnjFmxOFHc5lZFxxhF8jpXQQ/Fouc0
 gdQ1wb8VB5J0IVhoBY9qZScu3rs0y9VAaCPNLEMnnJw9QFFG3oSh8jqK5
 YgmtRXoWBAh3BEj3mBWd7DNw0DjbjC/ugDUEtPzxs1LI/DCnJg4SqSSZD
 vTmMGSa+Arc9VFM3ylpJ1yiBjgCBUu4kaLsnWock0qquRSPKsUdFFkqcb
 zIeYPWfU5ABYGTlCyS9XJqyNEA5M2LbWCMNIE5GlWTB6uiI8b3ePKxaCH
 JWdF1qE2M6rfzCAcUnFTzz8MU/Uz9mNwOwU5WS4kwGmZ2FPridE0bb6+j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="426460235"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="426460235"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 13:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="809114356"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="809114356"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 13:50:12 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 13:50:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 13:50:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 13:50:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4YcN1+4Sda7Mws0xjVX1EFzRvpCvqV+/g2az1jI+PgH27I624ONX22RKYR1wfQvkexJZ/0vQwVVOMdz7IDROIeZiLAFEfyTXzvOBG1Y0cR+XJHbU3H43JEoGzRIJpDHidBvBzTVsu54RcEdJ5vGPNbr2OS0oWw9tDBwXeSiR+sd+kMPN02b8uIhf1QtH4BBjLyGzXQeVwZMLQLpSPKzUY7YY0bqkg3cVPaIcfpps3MZRFVbtSALmt7+R3/t3DI9U2uPEgknVXxojRmzgcU/FhCKutzHWw64+nDrjDi9x4ocZA5AT/OWudSRiQevkcMWSbO3yDjgTwju/nIUphiOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CC36ttXmNEEOk02dMHxPpd9cznfWuYxg+ziul3a0Ca0=;
 b=V59D9UESNKdx+w8taSKeBxH1TyXl3jxMso1cyuU8KgKCmYmOqb/v7mYgEX+J1QKgNQ/+B4FWee0SVBfC6KJ4FhLUMA7jLtbN2gyqDmtBvTH8yaVF3ipHXbBMfVBQn22cs8Y1FFX3fJGeAE9JmSUK6N3DgRAHmgFG3NyTk3kGuaT/9VMwtOG1Wt+v0oLNkSHLaTPdeyLYZOUDDStuy2V9WbvzuTsxRplli8qoDdIEWTPAFjJoZTHvloQpUU6t0NK1ahi7NKWEgsftHgKOkvDgJYzSTBM2iGn6Zq+5Nfb0D44a+mLFbX8brV5BMB3mIW75liYJNUTJm3ZGnXZ3k+rgZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 21:50:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 21:50:09 +0000
Date: Fri, 15 Dec 2023 15:50:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 02/10] drm/xe: Report TLB timeout using GT oriented
 functions
Message-ID: <ohnyi7zxa5acpucwxonpwalrmgf7n2d2ip3d3ogxrnhqjvuslm@b63lqodsbn2v>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
 <20231215162502.1879-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215162502.1879-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 1865b07d-cdcc-4be6-c084-08dbfdb7cf0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCXx/vjrQ/jzlVzYqUMOqOgM2RzvBfjvn+DahhxdRr48/0aLrfHQiV0OaZ2rGpz+oWsaxnbVlOeo0iF5brGRHVwA2nEV4VFYGgZ7TDE0qDJPfN2rNbuuvNxZCOZNfM/7exXsaxZ592wDF1IlEYEqwXoRhMEzGIq4SNJmwuga8xAT37nigHioUdsi1Am8uJNqi6qetQrBT5EL2W0ynwZb5Zu7WuCj1PfWw/j7o5w5yP6rMSRsv8KRBnrreuKQAVLe9uSmkrb39ogUWcswcAjkDWRTsqOilro57bVYhd9GlyZX0B3mxrH8TOwUI2UThu87bq4G3gH3NT1q6IgUP5O5V+hGrfSqyoJkQ3bHpQ+eaLR9PPC7I4MyP5KtpDTriO4k2ndUYcdtNlIdEjqYS+CAsujryky9cd/xokvbdZASyM1J3CLYm0BBsxfUUcPCcrnPOJDXDJouK2wFwxbqx78kpOxP6QY1WFbyGVH+xkXoH7zB+ISGalCW5NbqG2Jp+HoWhbU0Q1ewvjnZRu5WEaaCKqi500+cGSwa6Xv3EeYCJilU3PaS9WPLJvxI5xopf7Nz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66476007)(66556008)(66946007)(4326008)(8936002)(6862004)(8676002)(316002)(6636002)(478600001)(6486002)(41300700001)(5660300002)(4744005)(33716001)(2906002)(86362001)(107886003)(38100700002)(83380400001)(26005)(82960400001)(6512007)(9686003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NgN/LFjTFjYMg/wlP3JoAPxVoLyHASgsalqvTqFZ1iEMquXwSQSCZ3r7D///?=
 =?us-ascii?Q?Xfs5YhiHtMkopuDr79nlpi4MJe1pQVe4Dw1nNDa90RAV9X3oRdtyq8yqMgfl?=
 =?us-ascii?Q?YbWxBHWcs0fgRES1TMN66B5A9X8aUYPUVVGZbtnPIdnJhNtkKF4ZLkc/5dDC?=
 =?us-ascii?Q?ayKg3TVYCet/VML4Ha11mRkS2GLDmwdsJZJQfqQqEqB6wZX6MSMuNVp+9dWC?=
 =?us-ascii?Q?oxNPl9ekdzmWe5FfrfCtVipGamNSFRv8odbbb8MynR/ZAwicv+FHoiJ9SgbH?=
 =?us-ascii?Q?cXnSbbgr8ea+gDUbfgguuL9vRQcKONDnq0CEaJqcSXbCOQbDCcBnGOlz+O4n?=
 =?us-ascii?Q?t4nfJdtZ2QGgjT/4bkI9y/uo5Gc0hIiQKYEf4mMHxb6PazxGgAG7Je/Kp5sl?=
 =?us-ascii?Q?VbIOEN7tggqeKQ3Sef9rqzN3mdxZh6xqvW/gm302GLQ29fUcelWIkZ1hKde0?=
 =?us-ascii?Q?ekoowFMLNCja2/j4Rbb5RMVuv1Ccqxo+W1/22fh3iE9y74kXiXhpi4g1qtL8?=
 =?us-ascii?Q?VBX1NbLGaFkpTrGlfGSSeQXvOqojoTZliBMphfX5eL432a8YIei1UJmfxgsE?=
 =?us-ascii?Q?D44egY0OtDi5J58USxKxoVAz/hoN7g9o/hch4bxFUcg1B5tqt5rR/f/oz1j9?=
 =?us-ascii?Q?/QCDUUgFiSiQavFvXu7yLLyvGZb6pq++cF8hesGxAlE8+H2wX0BfRvdwgMbj?=
 =?us-ascii?Q?/qSEVDvuBDfD5wCo2Oq5KMP0Z/ara5TpIsXWTrwGnTWuVOCFUjbEnbDHhcAQ?=
 =?us-ascii?Q?6KsTVFUOwWdqugcnMxGy+6lMGpB8aoVUJNbKbrxNCvDGrq1xMgc/DHU4Dh6C?=
 =?us-ascii?Q?S8suIXFqG5aSuY4lhMd5SSnXhbhPc1CqDSl+lrUbO1vx+/dmjZECdh+/Til2?=
 =?us-ascii?Q?VVJi0+5VyNv0vjd3M4jx2hVBti+1UBnubTXdJznZ+H/UP+wa8zMv9ff3oz4u?=
 =?us-ascii?Q?bQ6Qz18zTSWfjDgdPlikMftwc6K7TeTOBlXLW8Is2tVrRqQn/pPTJactukgw?=
 =?us-ascii?Q?YZKP3aZfAFi9097ZVn34FgOILN24kdUFh0yV6tW822y9hIOuaSHEZdeiVs5H?=
 =?us-ascii?Q?8lv9ZTBJsBAiO5FU6hI+6Rend8UesKRe++7Hq/Ufc3gcyG2ZhGHSPE3nJGX0?=
 =?us-ascii?Q?FY7FdSSGqmT2ui8IpEJxuZt1QLp2nN7YDy80FW1EcOfY1kw4thKU6Zru8WOr?=
 =?us-ascii?Q?qMwrhUciN3czU8h17c/GFnIEBhdykk9CaSikWr+qGXAU6OemgnWVvom1pgy0?=
 =?us-ascii?Q?gP8+WdTGYoNzf89y2ysm4j7XEDcQ2p7Q6cSVoyApZm1FmrMXGfBweQXdubHj?=
 =?us-ascii?Q?JCgvhd3Ac+kNwTaZL+3i5kNm21boVcedyL1kScIfTL0J7VuAsViEqdTkgIoH?=
 =?us-ascii?Q?xJFyCEnOWNxjx2tSwL0cGxEqQgjNvD0v7m1UIgTpfCWNzwnDwZoMuyMRDB67?=
 =?us-ascii?Q?BHvufc4jPDPdRXEoyyNND9nkEumEYYwd/FdP09MKj81hqGHTx0LDhV+Njl3I?=
 =?us-ascii?Q?WEHa3KkGGMFy/KWcH7v7JDS3By+uShDwJf9LDzhAVATvh+dql8QfRcqt2Ufc?=
 =?us-ascii?Q?mO8cvDkS0L0fADiXCAFZ0nxOLcgTuhWHX+SYMjgQmsjdghZA/s9js1PwgKA3?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1865b07d-cdcc-4be6-c084-08dbfdb7cf0c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 21:50:09.8734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi2BQno16mH/zkPH7LA9bsrPWC0piIBnQvOB66DeY5l8Ps5pBsFXKuonqmmjTpg9zl9kOr0yUdMR9OIkXXGPyFgw73WyTEJMyb4XmziiaaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
X-OriginatorOrg: intel.com
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 05:24:54PM +0100, Michal Wajdeczko wrote:
>We track TLB invalidation seqno per GT and we have GT oriented
>message helpers, so it's better to use GT oriented log functions.
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
