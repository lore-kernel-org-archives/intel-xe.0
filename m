Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13D7F532C3
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 02:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720DA10E089;
	Tue, 24 Mar 2026 02:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tq1LKU2R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86A210E089
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 02:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774318895; x=1805854895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XBVyvEoupV1XlN30Hwkg0ZNL8fQzWjlOAxBoEg/zeFg=;
 b=Tq1LKU2RxKpMjROyaVbv4o95bMTdzrbhuXYaKYK80k0GaTvjlSVET2Gx
 zG8Dak+O42NHhHonCWeTGxSKSgrni97YkuvvjVCvr+a2o/MwV8pCat0sA
 ZDO+oaSI5OG7Oz380ojnAgmgv+PIp05MD7u7t0WPOeLHE4y5EqW4aV25C
 UoD8ubXlunvNgnJGLjC9c2PdXwi8lfhLZvelXN2DCG8Fes5a7KPLnHxc8
 GZsOL5D5PCUokQNIKkEE4UMlxeNPlIdq+LcVY8KOf42sN7U7AZPzYtzh6
 gwbNiAhvgTum1gaBR4JPWNNEwcQRDQxGf74fxy6oVhUfu09xFXFuOI8up Q==;
X-CSE-ConnectionGUID: gIDRHKn6T4K1+xrs+9XePw==
X-CSE-MsgGUID: i56hCEa/Rf+FQOM0FhAKtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75039478"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75039478"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 19:21:35 -0700
X-CSE-ConnectionGUID: pi4cnFGkRVOP0NDXrFbD+Q==
X-CSE-MsgGUID: qL00EjyERJ2rjd03X32+6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229143071"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 19:21:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 19:21:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 19:21:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 19:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0ZFCGe7wSHBixcEIwbZgZ/0zXSfDw7aEee0ZtiFD3wralSf64wEaiF90eS+kC/AwWh2tHvPBlIxQh2Ng46t5auWLO8vKTRPZdqiiV66n7hPZnquxttEpbCQ7Knfe9WHg2ezITbpTyIha4V2LY2miaDaYh0Bp3K+mlP44WnnmFutaUIn1QZDZhStvHtZhSsSCq/d3/Cy2KS+8s8cRhWP/ldShtAKQg85iHBcpBpMTi0/KKbaKr1YHG1UV2ADhCYJ76xU27ejqyfU6ZIfK+ZW2U7BrGIV+sNC73a/gPuZwNrcqYrhv6CDYMSdWZQGRYQZ930mYmLVGU7KoBfLJE4NhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHylxqR/Va3eaVaz0BGTC0ue+2pCJvjcZnt7bbcCtMA=;
 b=ZU6KR837c1wYGaD8pI1MvI9mqhvTyIxvUZEQvKtntdA9OhlPMljT9S7vs6L8xBtnK7Cp2eVt1y4dRnxIdiCOVCYq0hSP7yc0QGqXRKTY115RCW+btJE/N/UPWvb3+Om2grSoYYaeW8Elw10a7uRlI8ltNfFZankPng+dq7bKl2M3brSgfZYvsxwEPkqEoX1bc/ytKgjg5kHWSbHYXHU3yCJfat5iCeIrUT3x7yaQ7YUjwV3rB6mnHwmHssoSLthLjYR6rddOTiwWxmTc9Me3UXgvHDJM5Wbf0UGuKyafFquDaFoPAGCbJbI+DSwz/UZdDMi1kSJHvpJbBJCLflM7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ5PPF867D7FF5E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Tue, 24 Mar
 2026 02:21:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 02:21:25 +0000
Date: Mon, 23 Mar 2026 19:21:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Always invalidate TLBs on userptr invalidation
Message-ID: <acH1IT6MBYvSf2GH@lstrano-desk.jf.intel.com>
References: <20260323211743.285064-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260323211743.285064-1-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0368.namprd04.prod.outlook.com
 (2603:10b6:303:81::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ5PPF867D7FF5E:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb7b662-42dd-4d8a-a320-08de894c0c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: lONxnKJ8gspGBkjoJVCXFJJADsG0QrXZtXUQQTByLZFtvbj8W10q0jszlrLZ9JoM3gsb7KJJfe/8sBmPnaJ5voXbwWjEnsyeTcMJmiCTEMmkXdiEbtUto7vI97wrvufryL42yTqLcWN+Et2UWcdwfgpW0S/P3n3PG/8SKLdjnGU6N6MU03S6ccCoW6HvuyBuk7U8T02YpMiLaMtkd48bf2QZ8qDUywkpXW3GmRqXoYxDO0E3tRL2YRIzFJ9GCE+6G/BuE407v9ykN+g213CJVO91ZfhoPBgFOZ2DycdWu+rwsrAve3hCotmB9onDlg1geSYxmC8py0efZTihNBD2kMz/K7SgfWLis4MUgInqKq6/6IwkaDGW3whNTLZZIdnM4G5zQmYLcHQdPOkM4kJK1fEOaOKx1N7yuDcTDhtxwiD+FDeQ6HsqSzbiJux6gtiS4yWAYmvfz8ZczDM9aa0JkIRQnUq7FlZcmr3cR0Nzl0E00Q/Ct5hl+887hd8X3dyJcV5rzXV3MIvDbQH+HKouUX8cu1nRM7WHF75W+NlQT6BEb63D+3Il97YC2AeT2Q/hK/c+0EFdSe+93HnisJwg6QqvJwkHDuRiCgdodaRDiki1eaaNQNozxxdr1VrXMetvSe/+VfVgeZhsX6c/YPYsFcJcAGI6SaJg4lLLS3bWJgVVgAzirUbyJuVZHJjQgDjnAHPtteePfachPtKzqDiE3iuPeAMOMbk7xRGJlHqXNho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRCzmsPOolYomrs2sJtdY9DSkQlch+dWjznxyLNNdObRM9hTelnTBUEZ+UQo?=
 =?us-ascii?Q?vhysGefB8Au3ZZQIwYjkgWJdjy3yRdEgZuT0x62PQQfZIasEvly6zXsMoKkr?=
 =?us-ascii?Q?t2/w+vG/+QsB9/0p39GaZmDdK5UH1sYXj4fvMf3JS1MJ/tBBvDati4EnfHoi?=
 =?us-ascii?Q?KfF8qAGicQ/ROtdCncjcn4VKjLdprckq9nToUmWESQlCgLgQ9PP562/ubprK?=
 =?us-ascii?Q?h+irw/PZGGg2EIC/GiH2b5LKrtaMRGihuxZdz9PKG/v2hwqBCWDm9hDljF06?=
 =?us-ascii?Q?4BSnfK2wt8g1+s0qbU4jWPhr62b+55rLdiRFBr/fXMAlRUAOnCj+x2sUa3Z1?=
 =?us-ascii?Q?dN0ObvxUP0jBvK/ABIG6zZHX3xtBdHl6WYfva2ip6sU1TWBOePGnjsRVAmzt?=
 =?us-ascii?Q?HyybXr8EFXffFe4hYf2xtG87dWMyyzLxWY2cuoLf3xz1HyDRFDBeC8rgz2Uc?=
 =?us-ascii?Q?h8cBC17MfA0u7rvYcm9zPdnaKf2YQfId7ylWvL9IL8BqzsW6ROP+ubOB7g3L?=
 =?us-ascii?Q?sXkdeNMWFHnuSVwN2kJ557eia36YnhOulhGWLAm+pDUUcpQh/IhMUAPWUJ2x?=
 =?us-ascii?Q?YSl6uxAGW3A0V2luIgDPRUM9bt9K5lXpAZh69CICugPeGDbJlFX7ZXhNl5F5?=
 =?us-ascii?Q?MEotWsSEU587p1jk5kH5aXQla8AUqhUosWk0fyvyoXm3jFTby3eyOSsPMFBE?=
 =?us-ascii?Q?ldbggejSLzgzQpb3uRWInk7jSXC6T4/9vDvbZPIkFwXpx2ON6q7XhvaV1Enj?=
 =?us-ascii?Q?K66xrS4Q8anzxpB9fkC5SMOPLqyQZUX39Ustf1LWCVs1uACfCLU6QAHM//lm?=
 =?us-ascii?Q?OehnpSVVtkX+fbpwhVvkpNkVxCBkAqoyGu9/tbAmoU8aTw1KwhPcwT0fHKYP?=
 =?us-ascii?Q?l9SE83UnTY3ATeg0JFZ962VY1fo6nST7+aWmVal17d3FvBCPu1VYS0T/LqxG?=
 =?us-ascii?Q?7lyS7jXCSPPjcBW/K76acGMf361Io9rMLowjspv18Q0ugaHoxxk4CarWl38m?=
 =?us-ascii?Q?Opc9U2TerI7OesnvQxQlU//97tt1x4pwTXFLGw+eMRhp3ZaY4rQgMCOlVih2?=
 =?us-ascii?Q?0a5WfNsHPtgQZLGeKBwmbGVrSnC+GNU5mlesqqMHCoxUl3uOUWlLYTQy8IuY?=
 =?us-ascii?Q?sdwhOMldJDSk+5/j5uIJHVSsaGEi8QPxd6fb8PQ2ix65UR5lRT8elZ6MRGLz?=
 =?us-ascii?Q?b5RH2s7umVaLHEqT7aCcyDgss6U+tuyh2O6TsiXDw/EAnV7t9XGGNAFXfmyE?=
 =?us-ascii?Q?q6BawLrfdkMmqtLeR6i/MjSNy8vzYjmlB+Moy4LAy00B8QO4H6uU0fFcVfb3?=
 =?us-ascii?Q?j4qyoDeRV5UjrMskx5w3WgPzLmiVtbZHLEBsAVuui4aD67rtfHxAfT6szPF1?=
 =?us-ascii?Q?SUAbxIWYFHHiM34SItXStcVU145roctmHWh+0oPqUa8fi9lTdduRggxThbpN?=
 =?us-ascii?Q?ggWPVEib16xEOkeuHDlKYQv0Sgzio95HgwEqPlfO/aICRZ5aDZ2+xB6QWra1?=
 =?us-ascii?Q?TqOlZoo4RLj22mxtw+S+TG7+E8wsfs3eiIjivF4XAThfM/6ygBTyXIwqL1Y4?=
 =?us-ascii?Q?R9GcRPxk029gCXUwXhGS1ZCCTQQYajn4PR992rPCwd2RtWdIi4/Oz7+Ak5Hr?=
 =?us-ascii?Q?0Q+yg5+FoyzUI1LkK0UiemOvTUmCpMM8n8ohbHJPkxrSR5TxNC11XeDxrgEF?=
 =?us-ascii?Q?sCPTl8SE/0d62iRiXC6a6P7VL667nNwMlGtW5ifTk2hHyjAnrRJbjChZ0Uke?=
 =?us-ascii?Q?AF8DlDt0L0ieOExZDYi35rbmap+pfro=3D?=
X-Exchange-RoutingPolicyChecked: ora3bfNgheHA9S0sqx2r4rFkpwX543RTtksyBvJY+xklbgSUnLQl6bDV2PPlH6XcrpUnviEVlRxHIU5CAQc9rpRXdcM5fdHGOlO5LEhyay59NWh1ALGSIc5SxuxJf7GiCWPNvSn7Pd11opCD/PDB/yJ2mNBcoOruG3vPjX+Cx4osPKywCVMppdFIEk2WURq34+jAPaSeMm1wEHuz11AgBD1lGTSJAdwjVYYt0wf3iyl2lwx9dzQZhg5VC6qvkFHeH2zpaDwz5Pqqi8w7K01nxLxzjd/3XmNn+AlFhQzCWDvjaZj7NVrKdaCuYyCVuzcjmWbS72DNOBoHSsvo8XeZ6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb7b662-42dd-4d8a-a320-08de894c0c1e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 02:21:24.9169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beiSzKDfUiCpbwDue3JcIQIUXP+Ct7d6YSO1Cg21wLrc9j477MD+d9WRtZpqD4ytaJAhntpZCNEycd6S4Fhb/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
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

On Mon, Mar 23, 2026 at 09:17:42PM +0000, Stuart Summers wrote:
> Right now we are only invalidating TLBs when we are
> running in fault mode. For non-fault mode based userptr
> VMs, we then rely on context switches after an MMAP has
> happened to ensure the TLB is clean for the next submission.
> 
> With context based TLB invalidation, we can no longer rely
> on the implicit invalidation happening during context switch,
> so remove the fault mode limiter and simply always perform
> that invalidation.
> 
> I was able to see this behavior using the following test:
> xe_exec_compute_mode --r twice-userptr-invalidate
>

Hmm, this implies that preempt fences don't issue a TLB invalidation...
I thought we landed on preempt fences do a TLB invalidation in offline
discussions.

We may have more work to do here wrt context based TLB invalidations.

I think BO move path likely also needs to be updated then too.
 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_userptr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 6761005c0b90..dfd679dd98d9 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -102,7 +102,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
>  				    false, MAX_SCHEDULE_TIMEOUT);
>  	XE_WARN_ON(err <= 0);
>  
> -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +	if (userptr->initial_bind) {

Should be change this if statement based on hardware support?

Matt

>  		if (!userptr->finish_inuse) {
>  			/*
>  			 * Defer the TLB wait to an extra pass so the caller
> -- 
> 2.43.0
> 
