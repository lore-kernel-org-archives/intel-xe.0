Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8C6C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 18:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A39A10E83D;
	Wed, 14 Feb 2024 18:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+rBgZN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CA510E83D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 18:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707936690; x=1739472690;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RL95xFBD/8kO8QomskC/LUMjscsJhmK0Ss6pwMgQicY=;
 b=m+rBgZN9F84/jd/GrJ6EWLNCROHuoT4BYILyX4j9TdatEiXpza6xX0EY
 I/VPCambTCbI5LzwgUzfa8sjVy31jUpd7x1XLzzKBTzhJNrSHOLRv5bZt
 CMnjhFtABLPv9MO1FOeG2jGbEdIT1PvtSVbycSgvPEHWlF+siQA1cTyIr
 3e/E+xaTz3ohUPGrqjRPiEcUf6Z0tN2XAr1jRAu2IurfB9x3waJTH6M/b
 EtJLrJuSAfDqNXdyVBy1EtEh6bWcsaskAptDndKjreo6foT9JIBihZJvz
 Z8670MmYnclVG1czaHQAoI7/ufclo17PAdKHu31RSQ495IcpnoKa64GPz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1873433"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="1873433"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="7902757"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 10:51:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:51:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 10:51:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 10:51:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQAuQaE5nMpyMauv2dzvQ2Ti3YuY+m16CZlPfI9e6gW5zaWlcBh9xIMleObRm1+VBkEMOsTHd038+QWxXedtTiUujwtOBLznYW+EYaQcvfzKN5Ak08zd3Q39eSzg7HvoP8FWbca4QJWJDEi1CUv4BSeLSp2NfxxrojxzOHkR8pSEihZ9cKfAwpbPc3hju7Vo1+WJP7ZugBeQNDDm6WaaWfMzvRI8ZiYk430m1/3/KRthd2MyoYj7ZF0wv82ozLcmFHFNi5Qw+QlqJZdcWy8GRMRXNLmGmvFAa0+ItpvOLHQaGPQUh4vQfXGRlxum2ayOMi5JwN+NEakXoMBONJUrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghB1afyE4ERPalhBJlYkG6qayp99+F5zugn6MakPAeg=;
 b=HYm3PSJecWPb+5H6mxPlh5NFiUQh/IKZ6/Ugaaz6IPIxU/d2MHrBvQj60L+hmVO+moS8A4UPs1WPjaO2Q7cL4+zDEGKXX10syG+JO82YaXmN1o2FJalf6UPJLdEwZRzL+cazD8UMz6DeKLaEdkUXBvgXeLCrs18g3W9CUeNtMRz7vUhh4wxPOv6ojYseA5oRWbUSS1cBfvu99nbDD+CDxuG5a33aMv5ulgEwayCKotoBypf+uLhzFZxkuNIBIs6TFh16YG4KmqLiNr7rMpd5HW8PQKQ1PbhMGdqDvW26AGfcc4G4t4P4bYEd0/GM9z4C4mlcDHMoVMO4wlZ7MzqjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5597.namprd11.prod.outlook.com (2603:10b6:a03:300::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 18:51:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 18:51:26 +0000
Date: Wed, 14 Feb 2024 13:51:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 12/34] drm/xe: Ensure device is awake before removing it
Message-ID: <Zc0LqxYcBobjkRnW@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-13-rodrigo.vivi@intel.com>
 <df663ea7-5d81-4e6c-8ce3-9cd53fe72ea3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <df663ea7-5d81-4e6c-8ce3-9cd53fe72ea3@intel.com>
X-ClientProxiedBy: BYAPR08CA0049.namprd08.prod.outlook.com
 (2603:10b6:a03:117::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c332576-8a42-4ce5-1c0d-08dc2d8df283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTg1OJGyQinCwpKPd1jYxSPVxrzJx2KkSDkKB86RylcNLgzjPw4xh0SWae30cYvwwR6K3urWJfGcBO6p6EEI/S76dbu2evK+5v30GgeOQBkq0UM+I1Vm8WWPw3QF62gHoMSJeFEDqjnlSwa+JSdFY39jh+msUt+BMKMsYj51rf+FI9IOjKI5pngrZ9/KhuGMJG+9eLmVGrRkf6Rk3mV3hTCNwHJA1heqg6y8MBY609yDrfPTqqlHa8NLwantqLfqzrBbhqNJoYJ5vOOA8+F0E+vIb0pF3eIJUTOQ7qjyI1iPUsZOjPwtLSNVu3spIgVOOQXXS+FhCyT/Ez09lxO9JgjKxVMA07JNTcFqAd6hNw5mj7Yej7t6/jKAbW9os2r3yXLOOL3V3zE+fmLqMWEjvf882OzbBbvRRGSp9UkHh2xyAuw/f07YQGZNaoPyPrCv4wU82FkJMNnqFIWWO/8P1iLwXLdWUK4ngQdHjHBNNq+Vdv9iOhri9sI5j5eXQj586J1+zLlqko8Zh3VvErPDvLiJ9bo5CT3cpsUlAwbDR9IWRXLl6dN4NqL4hVLngGv9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6862004)(83380400001)(2906002)(4326008)(8936002)(8676002)(44832011)(66556008)(5660300002)(66946007)(66476007)(41300700001)(26005)(2616005)(6636002)(6666004)(6512007)(6486002)(6506007)(316002)(37006003)(478600001)(53546011)(38100700002)(86362001)(36756003)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dUnOMEDGHPtrHyzDDHuB5NcRU6u+cUXalXIqv3AfRFdxLpd8mFO2yA4D2EYv?=
 =?us-ascii?Q?UxJPnBiubS276XtL+yAo18FpJbFz2SNjcC9zJ0wb3ZCjgyTaJOWGojbhiXck?=
 =?us-ascii?Q?5XFDMSOcRzVDJNZSx/0s0rz5+X7/LOZeQyqOuFDPlmPYRCLuzLK/1oPyD6N8?=
 =?us-ascii?Q?AitEVIs243/cZksPbHyluGoT9fWkYAPnVy78cFM3HiCdgi3Xgty96DL9aE7T?=
 =?us-ascii?Q?ZavV1BHEPPFJylDp4zpTmYUlaLFNwlppkaoAzirTcpmNW0UgJoSo6fgsDs+9?=
 =?us-ascii?Q?UiFoVKiuFsK8MYCgO5uC55E8rsOKJ2o0aMfvcCrHEfcEez5SEo3pE0k3BwdD?=
 =?us-ascii?Q?bnaGBr6TmkgaKPiBKXEpgB+Woo9aZgU3/xWHghqK/TXSjtGeszgOy7yVPi9Q?=
 =?us-ascii?Q?+77IppeEnee/1DxMv03tthRWgFaGg0uWuSveOtAZrdrTB52pknOZZ4gaFfqj?=
 =?us-ascii?Q?nv3n83Ln7uCWwwPoThRs3elLdJcAKwxbNjMiu25J5J4Bapugq0rU/Wp/A79Q?=
 =?us-ascii?Q?Ikwp2hlJjO5iu/zqHQPjp7CTVVRdruNFJwBetxtWKXmyUZbxmgM5HazYXn1I?=
 =?us-ascii?Q?jR9vpyPeZ7mQ0N/aML8wJXNHYbC0ZiwXTmj7WQ04aWtjY5+f0LPrV2qJbXjo?=
 =?us-ascii?Q?NBBq/DKCSIVJaIm5KxAdIQHH5qEQnBkOdq3SW8QusR/FEkK61utgDrY9MJjo?=
 =?us-ascii?Q?dDc12PBdSAJyQqYVPKzX07obRG+ld5XafLFkXD+qiOGwbO4HyoSwjeGyjcGT?=
 =?us-ascii?Q?IDp8xdFvEHKLeDnPu9u/KkVxGhP91RKTlvx2XcF4wZgbDWXIHwBq646OXpeB?=
 =?us-ascii?Q?j1Zcu2dMW47FkKijIhGzj2TNyUH9yJvXxrQdEkREt0Iv3ib+GQRZBRrgyq6O?=
 =?us-ascii?Q?3qNTvTtpMBwDvLLQQ95RfnlBloWVuiMbAu53wl8gyT+hhR53OQ4+7rlWzRq5?=
 =?us-ascii?Q?k9KcRrXIlPrbxymw/gHcNhW0GtyOlD818eaHyFkJCfIuLPhpy3mXo6KroKxo?=
 =?us-ascii?Q?GJpUkJRbP0jST8RjX5XM7V55EuzIIhV0BcrJuTR0ySspPENDyf2lOHboRO3k?=
 =?us-ascii?Q?HtzMITlqdBYm4Xet1P1nNPvDQ0Q1H1gXT/UI031xh+Ua7Bsn02WTuIKDZzWO?=
 =?us-ascii?Q?RIcqKBAG3KmxUN95KzxIPmHGBRRV/4w2Jy3iodbXsSWiGyQPhJY2JGsCEFr/?=
 =?us-ascii?Q?E3BpufthmvCDEeO0ZnEfabcIvo5owcuIKBbIgI01lB6bkWbtxWnrR//1cIXa?=
 =?us-ascii?Q?Rrr7yPPOK1BkAsUCVdQTsdGx4ovPz/T+09TyzNrTlhGviz+5xeiWuFSIHjKN?=
 =?us-ascii?Q?/beOUUE/4aqFqbCiC3h6rVjRSIlL05dA5aGy+jmhZOa7tz5KO/HHHxNgq391?=
 =?us-ascii?Q?V5pKv88xhcIcTeqaV+ZeVecNeiuq1hIW3q95Lf29YKdJwtJfm1RzVEaxYDFw?=
 =?us-ascii?Q?hV7/EWzLLYZC9R1X+Vph0h3iC2LbXZIuEaUdfeXXGMQJIDb9vXih020TOIsd?=
 =?us-ascii?Q?pRcPW1iwl2F5MIXacjebqy1rFXT6GqjtTpK3N8L4eFyHw/uqT6J+4fXoV+GF?=
 =?us-ascii?Q?+/XdPShSl0nWV5BQcREBzkNOV0hFaAoB5bOFPbtoVrjf2B3sLUopqdVNx6DE?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c332576-8a42-4ce5-1c0d-08dc2d8df283
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 18:51:26.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaD50SdlHpTQzVci8bK2+Yb8tQWPrLqrdqAL3mXVjthAI25Jg+PM5kEerdQLgTSejM0apFEAzHO/hv0N7KOQXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5597
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Feb 05, 2024 at 11:05:54AM +0000, Matthew Auld wrote:
> On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > If device is suspended, the module unload might face challenges.
> > So, let's ensure that the very first thing of the "unprobe" (remove)
> > is to wake the device.
> 
> Core kernel already ensures device is called with pm_runtime_get_sync()
> before calling probe/remove. Do we still need this?

hmmm indeed. let me try to remove this.
I believe the issue that I was facing is another display related issue
that I'm facing once in a while even without any of my patches.

> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pci.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index df6b3b31f419..0f296df729c4 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -686,8 +686,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >   	if (!xe) /* driver load aborted, nothing to cleanup */
> >   		return;
> > -	xe_device_remove(xe);
> >   	xe_pm_runtime_fini(xe);
> > +	xe_device_remove(xe);
> >   	pci_set_drvdata(pdev, NULL);
> >   }
