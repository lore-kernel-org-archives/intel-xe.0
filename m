Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F7BC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 01:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098A310E4E1;
	Thu, 18 May 2023 01:52:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C7310E4D7
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 01:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684374719; x=1715910719;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mTHXkaA1pRt16bf00dNDyETB+ZpFJre2LIMp0EHznN0=;
 b=Ui410FJWb5Cv7q1GaAv+8k2UUcs4/9vvYQtVXwocoebNUttul3lKOCLX
 D77yAyEORCcAet8rSBmr+D1GXoB+xz9QaT4Imdu06SD+N7Fn8k6pGiPso
 wM0rw6Di8r82ab1BeF+njxM61bcd7Hl0NlHNlSK0OS8UvrXz4ymF3xx22
 UkgTD43i8HMoH6JsPKDF6VGuGcVgk180qfSwwdO09srk48kjEmz7GNiAn
 /TBzDwR/th6/ooi6lSb10igp3cFJesTme+laA4DgOZ1RbXlXe/Ne5cV+b
 X0znUuMl70l5Yduy/7zKGrFcBQ8CgEiLcGfVicJm5PFe1zhawlX3qe8xk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="332298935"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="332298935"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 18:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791763472"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="791763472"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 17 May 2023 18:51:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 18:51:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 18:51:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 18:51:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0+RMlVnew2iFZl9iK4c7GbzQ83funh8kcV1f8S8kWBdF3nmjONlbl14I5WLwzbjgKH+DXM/z8J6gj8aMHvxCPyvFWt2aOORmbdkOqvc5nLHrHxTxF/7gEvThRNziO8E5Cev61huyKY9/CMf+sQfLmEAVBZBaUKokCrTGvtqy1w2i9rljuN5FDxsNPl/lLvXxOifgsuTPdd0k1yAlq0KVbQ4T0m82LYWth+dryX8axTAXyA8u2A/+AM0s6zNNpFjKuY7UnQ98Spkb1nTvOIxeHO7fRNHb2ao766Li2XyIkGDywz0cv6qImdxNmqeBt7mVnk2LyGaEb0XvxPIpCRE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWaOmqay6FcIX9DsLUrMSuViGiNuDhVUoeFh1iDvCb4=;
 b=mrvXj9RLl46deIRwkDZ4Ol3RE4csUxk7YeoDNLq42p5bRObfTNgsX06TEKlKeqGsLeY5NL5mQg5Zq+3fuedOweKRjuxMVP3wmC6r3Q2cXSx/yCqc8F9v68nsoUrfK2n0x/HRY8p/sd00H9k2s2U56YwIV4WmGn3V9YatDq9avnhioxpYLcE5s+NDCLSoAEuTxThnCSs1DvaHo0kaf+Xjrg5v8bciKMrKMAnvTZK/6agUZXoqQc9E+nlFSRGO8Vx1GUi0UkYHTrya1SgAJXospkV0g7t0Rd2lJ+GN5vu8yE8MDRROhOUPpHRyJ5GwUtedT0zpmJ6TUcOuTibmtjVRQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 01:51:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 01:51:42 +0000
Date: Thu, 18 May 2023 01:50:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZGWEg9WSSQqT7+kt@DUT025-TGLU.fm.intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
 <20230516145416.1851984-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516145416.1851984-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: aced71b1-e843-489b-80b9-08db57426d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ovpy9NDuq3kzx0GTEfDVxMIGSfv801GzHYcf0tpHRIK3OX6IDkv4nN19Qw+D2gNBKCT8s7xmYhaP8wey8bjPefKLoRnbZr048Qs0sNq+3JIGPxN5BxDfCwnfUeDzLZc1fsyThBOtqcpar1jsba6HDNjT5Z/erKgloVCgzAdla9Hu3wWcR1KuySzaIJPae2STf2J+cI/IZ/pNiG/oISnNPXq/fYMlJpYDiS2gpyvToW1s9FBoTrc/oezaaEcXywpiZO+2JRXWwlfatECAQBUgPkZ2pQsDEp1OhLAzhbDBiClIc6q33h2yQIDxWrDD+9lFJ8frWAz1pr6w9BINta5OIHJ+/1ub3HZ/YPsrCSgAs6fIDdHxziwZ/xfo1Uib4vBDsYhr722zoekX5fTIqG8ilpwC5JtiuLUPYCA7L83XiYS7UksawE/mNcUlzwLoN0ygzQd6qZHHy0+1K9L75uBMrngh0gmViCn5khykF+Ha987QDsafVlW0/Cm9ZcmUrizKaRhTLGbyae9xTdcgSASAuSVYtzvRXufoRGPucXCDueNWQuualHQ/IMTAfNaMtdNw4OFU3wVlQv9u28ZbKyt9U3aPsZSqYnppj0wF/YCydwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(5660300002)(6862004)(86362001)(8936002)(66556008)(8676002)(44832011)(26005)(107886003)(6512007)(6506007)(83380400001)(82960400001)(38100700002)(186003)(41300700001)(6666004)(6486002)(478600001)(316002)(66476007)(66946007)(6636002)(4326008)(2906002)(30864003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JpEWx6yWsNcypXmn0xwrplIH+Jn4g8yRFLMCDY4AP2PagEln85CfjpUtDKAj?=
 =?us-ascii?Q?14ohTjTXn5cYkRQZZpMbJ25pmBiqROA4j5PRTHdh0r/481erWYYkP76wdpXI?=
 =?us-ascii?Q?st2p5jNZ4lsHHCFyjH6PBKFkUXKkYiB7O88blymESVyPRfU7zrgjZXs9Gqmz?=
 =?us-ascii?Q?sm2r0hTklR/767B3QIF7z6Ctafe0TI+97jBH+jV5XTXk5YZrS5vsT2gO1N/O?=
 =?us-ascii?Q?c2FeCbpsc7ioA/Syr5WERg67OoiFG+K1rY3TwOYy9QxXPdTXwXiySbus5Yn7?=
 =?us-ascii?Q?3RyuBfIXL7Ep3xlt7h48wKln/k1pclQslNPZZ03Zy4B9M2IFZRur4rPhbliT?=
 =?us-ascii?Q?v26IZkBEbMwRP1G1IGmKX0PRtGqObECeAIFbhnL4GkXusAZiOerZzDMMs0dP?=
 =?us-ascii?Q?/coWo8ROY1Iux9yLZybedOMF9/fQeI1DnrrXW9hWadh8TRoO0RtVzmfpx3o5?=
 =?us-ascii?Q?DGA+fjhFPRnFzAssWtTs3xbCX5oKK+bElMhadhnk2ISmRq9H+IHBcX+L2Ymo?=
 =?us-ascii?Q?hmsANh6+xw+IZKoxiqe0eskZVJvT9Vj9JHzg42WnpACg7H8FBlfV9lk+a+zW?=
 =?us-ascii?Q?lwDPYYuNL1Yjc+12jsWnPA+R+rOAIKR4yymCNbusUBSvKw59B10cUV5E6mO1?=
 =?us-ascii?Q?2mTHDGW8JGP/imFium7/Gzs5/h0afRn9BrJzN+Rj0jFvD3wOvCqIZrucgc/t?=
 =?us-ascii?Q?amgqtL0aqg+Q5jwVJA9zlBDh+Q/b0qKgWlIne8BT4LOxMG5CAY2oOYLGGd00?=
 =?us-ascii?Q?qAfcwoR5gw+VFWbmbFdO7705l45r9HjWDnJM6NCvYNwbzEW4S56LFQY0i1kP?=
 =?us-ascii?Q?7wnGFI02o+GXQhCJb9G9+X41E7UKz1DziCxtQvZkC5Hd5fSUUF0NSTY4UkZL?=
 =?us-ascii?Q?m1igRNJyH5uwKlq1YkSF4JOXkcrULEFpQyFg/SKmZBUsBT4kjS6VIlBfW8D0?=
 =?us-ascii?Q?CICuCa0VdqPsLzjSp1V7pXUasnSyCS6AJUpdMayi8V0foiB+pKL5p0xNlTi9?=
 =?us-ascii?Q?86dJusjrLgOSFbOocmZIVVToM/SaAFp13rEkSb/D22u/JBfJ77dRKyVuqmQE?=
 =?us-ascii?Q?zphp2ORI8JKlHcEc+2EoUsVCkjB/eplco+x9BgLe3AU5Y/1/fnC5XimCbgxQ?=
 =?us-ascii?Q?HbluUzJ3lTdLG7ryd9f0GFRo111palFDGxzUnJ2nKPcRcgRjphoJNvZUT6SR?=
 =?us-ascii?Q?4hoAFzPIGW4rVXGDkMh+Ci5uo1rKCW4mL7/Ma9jIyrHHjtnNdHUHTQOfm+VM?=
 =?us-ascii?Q?efbZIlh3zWLnLWuDVdJtOIQSsoYrxXTndb9C5enw43R4ei/ZcV4XO2fjEBsG?=
 =?us-ascii?Q?qvNVSshncCtRL8OeQRjgE4gA+6EBEqTI55459eE7roeTVEGaytpQX8Nt98Ib?=
 =?us-ascii?Q?VIM2T4nU7KZRtD4ScFVU+++zG4RyFZrPsLN82x1PYdULtoEFTyvOwgCvRx6M?=
 =?us-ascii?Q?v3y2NNM6ALcobcfu0+mphM4GRXKGCCCJMSfCVqFz5kk1ABpb/UXuXErk02/t?=
 =?us-ascii?Q?mQNeeaf+sLoYeHrmHYMA7yC0cisYBHxVbzCMCsQifARgGcbL0XLGcef8AFzB?=
 =?us-ascii?Q?a8cuRwuTf6hDzTqkkXNi/GwQWaEnZrzZXeKhzP+IXy2lfqw/i0aXqVMGVu0a?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aced71b1-e843-489b-80b9-08db57426d28
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 01:51:41.6989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RW40fH5lgzEKpXILoT6j+rrC1DjH2hhg5Tc0CKqTz68Jtp4z/hKo68+eGaCs4ci9o26TVAjCJ+E38Kh0XDl0mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 04/11] drm/xe: Convert GuC CT print to
 snapshot capture and print.
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

On Tue, May 16, 2023 at 10:54:09AM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> v2: Handle memory allocation failures. (Matthew)
>     Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
> v3: checkpatch fixes
> v4: Do not use atomic in the g2h_worker_func (Matthew)
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c          |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 166 +++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_ct.h       |   8 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  26 +++++
>  drivers/gpu/drm/xe/xe_guc_submit.c   |   2 +-
>  5 files changed, 179 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index eb4af4c71124..b72407e24d09 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -857,6 +857,6 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  
> -	xe_guc_ct_print(&guc->ct, p);
> +	xe_guc_ct_print(&guc->ct, p, false);
>  	xe_guc_submit_print(guc, p);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e16e5fe37ed4..e8c2edb1359d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -595,7 +595,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  broken:
>  	drm_err(drm, "No forward process on H2G, reset required");
> -	xe_guc_ct_print(ct, &p);
> +	xe_guc_ct_print(ct, &p, true);
>  	ct->ctbs.h2g.info.broken = true;
>  
>  	return -EDEADLK;
> @@ -1088,38 +1088,40 @@ static void g2h_worker_func(struct work_struct *w)
>  			struct drm_device *drm = &ct_to_xe(ct)->drm;
>  			struct drm_printer p = drm_info_printer(drm->dev);
>  
> -			xe_guc_ct_print(ct, &p);
> +			xe_guc_ct_print(ct, &p, false);
>  			kick_reset(ct);
>  		}
>  	} while (ret == 1);
>  	xe_device_mem_access_put(ct_to_xe(ct));
>  }
>  
> -static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
> -			     struct drm_printer *p)
> +static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
> +				     struct guc_ctb_snapshot *snapshot,
> +				     bool atomic)
>  {
>  	u32 head, tail;
>  
> -	drm_printf(p, "\tsize: %d\n", ctb->info.size);
> -	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
> -	drm_printf(p, "\thead: %d\n", ctb->info.head);
> -	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
> -	drm_printf(p, "\tspace: %d\n", ctb->info.space);
> -	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
> +	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
> +			   sizeof(struct guc_ct_buffer_desc));
> +	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
>  
> -	head = desc_read(xe, ctb, head);
> -	tail = desc_read(xe, ctb, tail);
> -	drm_printf(p, "\thead (memory): %d\n", head);
> -	drm_printf(p, "\ttail (memory): %d\n", tail);
> -	drm_printf(p, "\tstatus (memory): 0x%x\n", desc_read(xe, ctb, status));
> +	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
> +				       atomic ? GFP_ATOMIC : GFP_KERNEL);
> +
> +	if (!snapshot->cmds) {
> +		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CTB info will be available.\n");
> +		return;
> +	}
> +
> +	head = snapshot->desc.head;
> +	tail = snapshot->desc.tail;
>  
>  	if (head != tail) {
>  		struct iosys_map map =
>  			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
>  
>  		while (head != tail) {
> -			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
> -				   xe_map_rd(xe, &map, 0, u32));
> +			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
>  			++head;
>  			if (head == ctb->info.size) {
>  				head = 0;
> @@ -1131,20 +1133,140 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
>  	}
>  }
>  
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
> +static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
> +				   struct drm_printer *p)
> +{
> +	u32 head, tail;
> +
> +	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
> +	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
> +	drm_printf(p, "\thead: %d\n", snapshot->info.head);
> +	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
> +	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
> +	drm_printf(p, "\tbroken: %d\n", snapshot->info.broken);
> +	drm_printf(p, "\thead (memory): %d\n", snapshot->desc.head);
> +	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
> +	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
> +
> +	if (!snapshot->cmds)
> +		return;
> +
> +	head = snapshot->desc.head;
> +	tail = snapshot->desc.tail;
> +
> +	while (head != tail) {
> +		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
> +			   snapshot->cmds[head]);
> +		++head;
> +		if (head == snapshot->info.size)
> +			head = 0;
> +	}
> +}
> +
> +static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
>  {
> +	kfree(snapshot->cmds);
> +}
> +
> +/**
> + * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
> + * @ct: GuC CT object.
> + * @atomic: Boolean to indicate if this is called from atomic context like
> + * reset or CTB handler or from some regular path like debugfs.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a GuC CT snapshot object that must be freed by the caller
> + * by using `xe_guc_ct_snapshot_free`.
> + */
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> +						      bool atomic)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_guc_ct_snapshot *snapshot;
> +
> +	snapshot = kzalloc(sizeof(*snapshot),
> +			   atomic ? GFP_ATOMIC : GFP_KERNEL);
> +
> +	if (!snapshot) {
> +		drm_err(&xe->drm, "Skipping CTB snapshot entirely.\n");
> +		return NULL;
> +	}
> +
>  	if (ct->enabled) {
> +		snapshot->ct_enabled = true;
> +		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> +					 &snapshot->h2g, atomic);
> +		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
> +					 &snapshot->g2h, atomic);
> +	}
> +
> +	return snapshot;
> +}
> +
> +/**
> + * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
> + * @snapshot: GuC CT snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given GuC CT snapshot object.
> + */
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> +			      struct drm_printer *p)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	if (snapshot->ct_enabled) {
>  		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
> -		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.h2g, p);
> +		guc_ctb_snapshot_print(&snapshot->h2g, p);
>  
>  		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> -		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.g2h, p);
> -		drm_printf(p, "\tg2h outstanding: %d\n", ct->g2h_outstanding);
> +		guc_ctb_snapshot_print(&snapshot->g2h, p);
> +
> +		drm_printf(p, "\tg2h outstanding: %d\n",
> +			   snapshot->g2h_outstanding);
>  	} else {
>  		drm_puts(p, "\nCT disabled\n");
>  	}
>  }
>  
> +/**
> + * xe_guc_ct_snapshot_free - Free all allocated objects for a given snapshot.
> + * @snapshot: GuC CT snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	guc_ctb_snapshot_free(&snapshot->h2g);
> +	guc_ctb_snapshot_free(&snapshot->g2h);
> +	kfree(snapshot);
> +}
> +
> +/**
> + * xe_guc_ct_print - GuC CT Print.
> + * @ct: GuC CT.
> + * @p: drm_printer where it will be printed out.
> + * @atomic: Boolean to indicate if this is called from atomic context like
> + * reset or CTB handler or from some regular path like debugfs.
> + *
> + * This function quickly capture a snapshot and immediately print it out.
> + */
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
> +{
> +	struct xe_guc_ct_snapshot *snapshot;
> +
> +	snapshot = xe_guc_ct_snapshot_capture(ct, atomic);
> +	xe_guc_ct_snapshot_print(snapshot, p);
> +	xe_guc_ct_snapshot_free(snapshot);
> +}
> +
>  #ifdef XE_GUC_CT_SELFTEST
>  /*
>   * Disable G2H processing in IRQ handler to force xe_guc_ct_send to enter flow
> @@ -1166,7 +1288,7 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
>  		ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 4, 1);
>  		if (ret) {
>  			drm_printf(p, "Aborted pass %d, ret %d\n", i, ret);
> -			xe_guc_ct_print(ct, p);
> +			xe_guc_ct_print(ct, p, true);
>  			break;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 49fb74f91e4d..3e04ee64652c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,9 +13,15 @@ struct drm_printer;
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> +struct xe_guc_ct_snapshot *
> +xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> +			      struct drm_printer *p);
> +void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> +
>  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>  {
>  	wake_up_all(&ct->wq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 64e3dd14d4b2..93046d95b009 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -48,6 +48,32 @@ struct guc_ctb {
>  	struct guc_ctb_info info;
>  };
>  
> +/**
> + * struct guc_ctb_snapshot - GuC command transport buffer (CTB) snapshot
> + */
> +struct guc_ctb_snapshot {
> +	/** @desc: snapshot of the CTB descriptor */
> +	struct guc_ct_buffer_desc desc;
> +	/** @cmds: snapshot of the CTB commands */
> +	u32 *cmds;
> +	/** @info: snapshot of the CTB info */
> +	struct guc_ctb_info info;
> +};
> +
> +/**
> + * struct xe_guc_ct_snapshot - GuC command transport (CT) snapshot
> + */
> +struct xe_guc_ct_snapshot {
> +	/** @ct_enabled: CT enabled info at capture time. */
> +	bool ct_enabled;
> +	/** @g2h_outstanding: G2H outstanding info at the capture time */
> +	u32 g2h_outstanding;
> +	/** @g2h: G2H CTB snapshot */
> +	struct guc_ctb_snapshot g2h;
> +	/** @h2g: H2G CTB snapshot */
> +	struct guc_ctb_snapshot h2g;
> +};
> +
>  /**
>   * struct xe_guc_ct - GuC command transport (CT) layer
>   *
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 231fb4145297..9e2950f1fd0d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -764,7 +764,7 @@ static void simple_error_capture(struct xe_engine *e)
>  		}
>  
>  		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> -		xe_guc_ct_print(&guc->ct, &p);
> +		xe_guc_ct_print(&guc->ct, &p, true);
>  		guc_engine_print(e, &p);
>  		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
>  			if (hwe->class != e->hwe->class ||
> -- 
> 2.39.2
> 
