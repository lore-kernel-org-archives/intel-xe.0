Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD455C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 18:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CC310E1FB;
	Mon, 12 Jun 2023 18:34:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AD310E1FB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 18:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686594893; x=1718130893;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KIyUP1dOUdcvIq0fAlLehIPLh4eBNk2NGDJCdOuufHc=;
 b=QO1s5GLqsetwPtreJgwbxlvzO3zqXtqgdYTD57ll2JVyg7ydFhEC3brp
 Grp4rtk8lYkp2/lzsrMTaEhYPLiExG1G2/QS3KbObuIj5j4Lko1LTXW09
 ipjwJtPGiJuXzPeOdNul7D/4tVu6RMdB4hKEbMjGmM2e67KnxSGC9TmxO
 MK2i/tlN5naRoyV+FA8pXLF3HbWpnGywf8vdSh6AVyQWJ2adAsqUKqBU1
 0VuijkIQUPFawg+KKiCZLYkHmMvPS2HJVXFNmE3T+gPvozGZ6kRHmoQxI
 Ps8etxYQECjlAQsoZH4KNYNF4aaGKn02en1Sev1CTKcZiWc6sqxfg/gyu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358126944"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="358126944"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 11:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="885549466"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="885549466"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 12 Jun 2023 11:34:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:34:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 11:34:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 11:34:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V410MYwn01pV+b0Pss2Sycrfef1qjbUt0+1BudFzDfS0jxkXeVpLMBd7iKF8fbgjskuOYWdqS+mcjo/XCfxHMUP9WGlebQ4dNsSQ4lonsq4ERKt0TuboQrj5S3Qezv7rxH4M/sFH832sp6CVk4L9ja0pam31Cau4eOsPYajtwdA9H5IgCHZeCQB/yVAh+O8+ieIFicctgBTfMYk51bs8151DJOaFFd5xSxmfqYXR4uii6XEUiy/aVs1KoCXt6XRDUfBHJVmLY3ai9eOe2TsCV+zvXvDxW93xX7CuRH5X/mUZRlqWUkniAih8KR2C7dCgbMJTgqHIsZ0PfOIwZBxbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AE37rOeTY+6BtzGQjbsaIIaTCaiDhc/oP+iGG/haiw=;
 b=XZClNLh4Bg44Uj7Cdu/pDRJyLwJGmj/HCMLPuT0t27SQOLYcvaoNOL3Jfz8Clq8hNfrNuMF75vc2v/UUoz3wqvOZFHejUmFHai0ymSpSPPCRoH49qKrBT1vjO0MG4yLCZwgDo9pVkvCcLvYYSNA5v9G6geoE7XCRihPCqKoOWsM9TpJPAm8DP3L44AqhJa/Cc/VEx9Myha9Z9JAo2VmVCBT4aiU9d6MMA/qELPEPXP2AlUqQSgCRf9VXMxXUgmncJQf8V6Ygatdt94OU7ASFkgR07+k4j4oSlJ0mS4MnMkIPIaZQl3cLpKL05orZeuCr+aTSCahJefF5UGibFVgybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM8PR11MB5639.namprd11.prod.outlook.com (2603:10b6:8:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 18:34:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:34:48 +0000
Date: Mon, 12 Jun 2023 18:34:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZIdlHPHBvPQpNKwg@DUT025-TGLU.fm.intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
 <20230612171225.88689-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230612171225.88689-7-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM8PR11MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: f294c431-fc31-49fb-4229-08db6b73b3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OHe6AALxnr9BZrG1NUlG76URrsm/PRCC/yp7dLovqsVWD4GGuJ+J6Ba0i9YRn4umdcheWp9TwYkCrijnNYWNfPMC5sAJNAoUi2d7pNzA/7O0HPUn23ww66TOwsmrI2e6cY4wrheWByfjshv7kNxn0UZyjLw2MIIZnlYmziyaiCEdoNKmA/+K1nSPtwEi1Z5w0qauCJMtpPXjHSsmvoYoSy1h3WS5xUTZ04sibvBBeBhF+3qMKi/Iv9Z9iXAnC4OqWzXW2aq4C1VIzYCUsTgC3sfA36Ox0h2JRSP/2E5A194AqMW+EcMDw86r1IPOmOAjcNtLdu1Idq7TPrKwRCO87srTXrcGJDCNolGwxLIp7zlh7XcCFBDaHXXS1cRoIoJWsbc2Kigcwx+so1o3AB2Q06tlq5FNs2n0/Xq0PZKlLV7FadtGTQZVFasb4H3FN/BF+EP+eXg7auodSqBdqEuLxalSbkERNqYxLbIGqVjmIgk+J7TxSzTg0NzoRrjA0eAt7/QQWcHICmM1idGjT2NZOAq/fa9FTn33OCZITGYDubS/3XDgcIStyl8SAy7UNfqD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(86362001)(107886003)(6486002)(6862004)(316002)(8676002)(41300700001)(82960400001)(83380400001)(5660300002)(26005)(6512007)(38100700002)(6506007)(6666004)(8936002)(44832011)(66476007)(66556008)(4326008)(66946007)(478600001)(6636002)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jn+R519HW41haiUMeOT4hPP4wvFh9x71I1bgNDib6JZ7i2m9jHK1X/qO6RLf?=
 =?us-ascii?Q?AJ6gQiZDjv8wBS9ALi6Yr1ig+d0rSRjIceCHceeFBmbrXgGQrQmgoFDA2ddf?=
 =?us-ascii?Q?tBV7WQyIjZzsZCO/dFxz1ocRM+KDuAGDlDv/utmVF/iilI8EvcEL2WD3fXkv?=
 =?us-ascii?Q?QcieVEoMjTn9d5RLDmgBCShAHr0OJxwSOWb4aTYVyZS6IkQVl9+mVEKQHh8t?=
 =?us-ascii?Q?VW7X/9kvxSeRSA/5nquOK/IowNcQKxeZZQt02ZKTab25c4Vu+8kD9hOJy3SS?=
 =?us-ascii?Q?8KeFCp8evWrJY6VGKx3NHG2P5U/d79v1p7gsV8zsULpHw7SQqbsC9X802LKl?=
 =?us-ascii?Q?5FT+muigJcuY6xsEV2MX6jp0GMfX5H3n0d10vwPJfThXq4Ok+2XCScV96k23?=
 =?us-ascii?Q?+2id+mrf5QRXNqJa3Cdy4yTgtt+UkNFSrQKlxh6HaygpBC3Fu3fTePnke2J2?=
 =?us-ascii?Q?X8w/VHEWRH2O+0gS0PJ4IpBOliLeQ2Pkc9z02j3Z7Pf/ztR3NdRf+WybGjSl?=
 =?us-ascii?Q?z1IlU+c5J4mNlm3xmScM9B1JqMkttx2B+5yefcgiIapK007/Y3tgCzaW5NH5?=
 =?us-ascii?Q?9WSmhGztbVCl7Exu3ntoWe14qZC+5Skss7a95t6I+TdNqAb1U/jSpAN9SOk7?=
 =?us-ascii?Q?oyMjJzNzq3Cwi1nnwQymJosqtI2dbqcUCc5kDN8vRt4xStkFg6GUaMKUUQaA?=
 =?us-ascii?Q?k5TUXzSfm+Rq4J0CB+Aqe30CloWhpJGxj1BK1aHEFqAVK2PaqelLogEqj1TB?=
 =?us-ascii?Q?+5pSdrB3jlSDp2KPG5McxinIBfE/+2GWNqJLHMYaktAZM8fcJjL+9/zCtJ1y?=
 =?us-ascii?Q?02/Bkirl3DdHPvdWBHa1RQuyIhoB7LVfoySxHUQ5hP1o8sLaJK9WO7+3hReV?=
 =?us-ascii?Q?vyUJbGJcKPeHIGT0NpgtOcfzzkLrqCbctHCB0YRSaWvqB4TF0Ds/XLtKQDAp?=
 =?us-ascii?Q?YJZMqH0EdMQ0rC125013mp6hxliH/WNhCX55CaPWsu1Js/TZ3eyzOWCq49BS?=
 =?us-ascii?Q?zaPCQcUtfF8Az5cFwS8Mey8lmLCb7X1m9yYNcM7b0x0YWHHUEWxX1mEGUt8i?=
 =?us-ascii?Q?Q2oV5IbwdMCdkycSS/ud31wQGhxI5HM+8B8MdkyYWXM4ZP6kMZAjecFY9xlg?=
 =?us-ascii?Q?Ih5LMpMZn4aKjrRJw/B0d/G9Jq64WyGARBddhzoxCxf8bt2+4x5jH0Ns3QqC?=
 =?us-ascii?Q?0a2Sq9mohc+kCllF2Mhv8Sj5zDK7ViudzselD2qvZCP0Tl9b9GRsZwLb4PVK?=
 =?us-ascii?Q?lOUT3w2pixooZY3wNsgjbjjdR/r4M5+pugYLkWLVZDXV0DDxPvH0vTs66GHH?=
 =?us-ascii?Q?wkP7j2bDEJJjMr96gT0AkHk8EAgnqoFP/p5FYW2B7sFpz7VeQ9XZ5EHUeJSN?=
 =?us-ascii?Q?OW0iDrRcaDbmppKy3RFgGiH+4yHpwe8LxO61FD61+RvVkKKc/CjDbGt5EOy3?=
 =?us-ascii?Q?jvpOcx/RtAdxHjU8wXefJ0FafSaEBxHiCiDXD97Vm+z4QGDe0z4cvJSjjL8g?=
 =?us-ascii?Q?QtNNB4MjZ9EfLIksDQf9fnrknw7//WqJjYBYT8a8TiBi0Z4RkKEhKhPG2b1W?=
 =?us-ascii?Q?w16gNYoCD7WDXyu2Wee4nOvRnEHK/eGccGmQZVm5Bk/UW8Zi45DcmvDdZDmL?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f294c431-fc31-49fb-4229-08db6b73b3a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:34:48.3652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sntdIcK00nQ2MwPAR1KHa3+d8SZ34Lb7n6yK6AxwKw2h7BUSkUIq01UUNfcz5oTvEE8myJryQ7lyIukJ/KEQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5639
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v11 06/12] drm/xe/pci: wrap probe with
 mem_access
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 06:12:19PM +0100, Matthew Auld wrote:
> Various display init stuff is missing mem_access.ref, so just wrap the
> entire probe sequence with xe_device_mem_access_get(). It's impossible
> for the device to actually be runtime suspened during probe, so this is
> purely just to stop the xe_device_assert_mem_access() from incorrectly
> firing. In a later patch we want to add xe_device_assert_mem_access()
> for all mmio accesses.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index bd1f59b49928..e1143a6c071d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -680,7 +680,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (pci_enable_msi(pdev) < 0)
>  		drm_dbg(&xe->drm, "can't enable MSI");
>  
> +	xe_device_mem_access_get(xe);
>  	err = xe_device_probe(xe);
> +	xe_device_mem_access_put(xe);
>  	if (err)
>  		goto err_pci_disable;
>  
> -- 
> 2.40.1
> 
