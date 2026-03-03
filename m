Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9C7EDEBF5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 21:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9210E8CD;
	Tue,  3 Mar 2026 21:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOa36ET6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EFB10E8CD
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772572209; x=1804108209;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aVMhcQteOHYOemHEnTJHY7H9vbAO16WJXuOBhPTkkqQ=;
 b=cOa36ET6Nr2alNUAqY1Xv9MkG+AjrJBKTTa9WRuM/QYO/l/NID+i04VI
 3j4VQ1TmAcqJureK4hCxAVK4JWQYyCqAANtH/tttig5F7IXmldcPmx0ao
 Wnc4hirpyjPVlgm2jlOaOeKhG9y8b10vwd14CMwKr3KxFl96N8mLos+Wb
 xvnrNzMl8TYmhxX/RosWZ2jsbrBU3/h2XfmTJi63kqfYyUYbaPBwncOik
 m/Kn1VaXGfTNl7QWk8IcNX9QyCKntBRZXUp6b3h1w/voer0egShws0+Yn
 0pl+AzxgjWG+zsEYfmVEi8rYK8V8HPzIpP+Zl8d1IOFvpwnTqVdsk/ZP4 w==;
X-CSE-ConnectionGUID: nACfCX6NTCuCQwc3PdSlMQ==
X-CSE-MsgGUID: kN32NuScRLuFOH3I6qvfQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73324756"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73324756"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 13:10:08 -0800
X-CSE-ConnectionGUID: 4V+5OqVcSNC6dGFR+e4Plg==
X-CSE-MsgGUID: b+uocq4sQPiUkkLD0saL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218075195"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 13:10:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 13:10:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 13:10:07 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 13:10:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFIHSBuL03hkRm+Hfpgi/MtvDBd/TF39i2cncGrpOTxBMr+Q57wtgaLroOGjBudRfXiWSlAO4iB7cyIjXubKLUiAAWG+FoTG4Rvv4CGvzh68AQDtVE7AefJU1/nDrk/3UhNAnCgrxHSIt+32oymowD+c5MPsNqP7fEDwLCCaCTeHh4aG7vLQ7nFKgzDvGmMb7a/aB7wMERdH3kUkohKzryrdFZNkUoHkbpDebHckBfDLPgc6JND3/O/0RQ1Ynzjdo/wTnQ1+VT04/eb/6hu/ocJ8X4NRuwJDzKHDxTpqCPmxtYIdjkUqBaSip3EqRj7AhfJ2kBhv9ep0j6lJFucTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMFDiBAhUiyiDVFVbh1THFIVan3Xdm0hDV9tyaJS0Is=;
 b=dBmMdGOQGc4fN/dzhu6hBK5Jpv4H+taI7d63swZoLDy6FS1jSgQlXuuFTCIeexV9pKL0a37J848lvfLQD2qA96yQhZzQqO34EFFdC5MDK3EZAaWmpNXRdvyFWnL8PEII36kceNHbffsJXH+NVlqWmmKBOm5a31vCscs1/ukHAy7uFf3QTMD/Tj/A81zbDPP9BcbEJfQW66IFo53Xa+kIuYFD9W6TC8fx+TcnShOLO9Vaa6fTLfCh0ZsDp3tbtUQhFFDtQ9yi3LxaHwiqLR5479QYIN75fQlI49aXYTDeKIHkAAjo6TuiXMotQauTwizcP7090DazX91/LpqDM+WibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:10:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 21:10:04 +0000
Date: Tue, 3 Mar 2026 16:09:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [v4] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <aadOJ6YTk2fhOEBn@intel.com>
References: <20260227112310.1222483-1-lionel.g.landwerlin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227112310.1222483-1-lionel.g.landwerlin@intel.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dea5bbe-dfea-420e-8bff-08de79693cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: eCrxllQSZIYjrolHB5YSO2aaeuw9nzlpH+98EEkR/Ij68ieLOS/d7W0uwBvioMG7C2+x5ykYKGlGS/bLV7jkF8wFpFtzz+Lk/+IZ1kOSTZTNTM3y7eoLZkc8vfRkOohey+UKIK87g5koszQ+eO9ZwSgXZjgCW0bUtmjSrhoYdD6NYavl1VrMfkn1lVp4mMmG55iMdOY83UOiMpeuTDg1YfTlo1p0c3zQtXPGxpNxbHbGxOBMXKxiFRJPyIicCx/ZukzsjvlwFHqcNHBaHklYxpF9xlQQXloJq0O62WrzPpAzt3NjzU821Vqdsyi/toIMDOBdQJz2fyrIgXvAXbj7wgumwnbPfK/3K1YovP6RlDkX7zgDzJef9qQnquaEXCToIoONW8eJFPAmudCyLz+S5cXNwKAIDbFAnM4rMOYnwVtJQ1BXw23lSEY49opta8gW6RkiohIySG35Xm+tPwghoyM+ul+s5hdZPPckP0w4AxHf3/18zWSTIPfx7YrqS5W7LAOSTLPRIjJQLsEJNxmvNgu0M2AS+UGtOy56j6JOQ7LDP5r+ReosC7LoPKksDEm2mSZb8lqNZjzlSicfQtZt+N6qjmY4WPNI/uDr3Qc1I3opyZcTCLMXyBESSXrsyk9wcSuTjE4zvnpwVcjC7AHKIfScLj9Eywb/oRVauocuafW8LjNZ/J1yJfriDSz2NyRLM3qNEUH/ykQe0TTysZx8I/qDgFmtXk7StwL/grY0Ku0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDBKNTJsbmpNcHQ1cXhmZ0lPK29iYmk0U2wzVnd0VVhGY2J5OThUT0tiT0N0?=
 =?utf-8?B?ZTBUSTFnTGtBMVI0a2N3YzBVcHNNaGlhWHRRZXp0dXg4Q0FFdEdoOS91RVdQ?=
 =?utf-8?B?ZHBhZXMxb0VyNUptejlMclRNN0ZHb1N2SzcwUHJaZjVld0xYQUVnZkRMUloz?=
 =?utf-8?B?MzFVdmJXczNLRm1OMDJLQTIyTlZuVGYrMmYyUmtSalN6bmJzN2c5OWJDQU1B?=
 =?utf-8?B?bGI0cUZhdXU4RFliOThIM0tFakFQT29KN2QvbTdNSTJ3YU5MS1pZSWxzZk43?=
 =?utf-8?B?Z0c2dHZvNURnT2NRRnpVM1VsbjBSQ2M3VXVKY2t5SldsS2VPemVna0N3UFFR?=
 =?utf-8?B?b3QySCtsTVYrVEFtRnNnTXUxc2ZxZEhrRUw4UGp3T2wxQ2g0b2VQVjVNQ3Qw?=
 =?utf-8?B?VjlOMGdlei9HbVJJTzlTYW16V0h4c1A4aXpLNGZidUE2TlJMV3kvejlKQXNQ?=
 =?utf-8?B?eGRnSEJQVmRMODdMRDkrNEdkNVZMdDlSOVBqamVpa3M3MFBxQlVpZVRueWYx?=
 =?utf-8?B?dEdMdTZSQWdCSVFKWi8zZzlFbzRSRlpxMy9xb2w0ZHR6RFFscEJxdStmSWx4?=
 =?utf-8?B?OG5ocjBiMmN3dWorNG1wOXJsTjcxdjdWQnBBV1UxZVMwVVZYVUZ1Y0JlRkNO?=
 =?utf-8?B?MExxSGZsb3B5KzBzZm9KbnhETmV0bzNpNk9VV2x6bzZMSzdaRXlvaVZNMUc4?=
 =?utf-8?B?c05oT1ZVdkVIc3BpMy8zRVBWQ0hYcW1xTlpjMERISkJuZlBnMTBKajY0V0tN?=
 =?utf-8?B?aFQ2eWlpNllNSFpHcklzT0NxWU5OOEtERGg4M24xQ0ZoYThiS2tKZzI3SEVV?=
 =?utf-8?B?RHBHQ2RvbmhJSXllMWlyV3VMT082N0dvZjZRQUV2aG95OU4vRVBZdlEwWDFV?=
 =?utf-8?B?VWtTN1pEMGFVaEVvaGlFUTZyYjFuYzcwbEUyR3lqbWEvcUprYzE3K0ZjYnE3?=
 =?utf-8?B?Q1ZDQk5DOURvTGQ2RUNHaDFnOVFzM0xBdUVmVmRTNEd3NDN2dnpnYllaa0hk?=
 =?utf-8?B?VmpkYjBiSGNtdG1YeGkwSUoySVdOL3dvSXJnOS9HZ2VnejdIWUJPM0RKNXZl?=
 =?utf-8?B?TUlKSm5waUtyNkdhVVQrdnNGMmpHV0llSExpSEo2d1dUakJFYkVxZ09JVkph?=
 =?utf-8?B?UnpnelcxcTQ2enpsdjJUMDNHaTA2cmxETWg0dDZ2NUlWdnBEMzZLQlpOaFlZ?=
 =?utf-8?B?VUpFaUlpRzgxSVlNSTRpM0pwcnlGZmFGcWlMVDZpeXhYWW5lc1ArKzZ1dVhG?=
 =?utf-8?B?OS9mZWFqYnl5RjBOZUY2bWxQNUdaRFQ4VnBrN3lLSG5ZRXZGSm1QR3V0aHpw?=
 =?utf-8?B?bk1WeHZPTUs3aXVVRzZMdjNJRnp5TWppVWdWVXhFSXJFa2V6emFDTjRnQ3hC?=
 =?utf-8?B?UmN3eGZIeUk5cVN5TlRYa0Q1VkxHVER0KzdJbmtpZVZyejRoSFhwV2NCbTlH?=
 =?utf-8?B?K3EwaWF5MkJtMTNidWdQS3V2aGpvVFN0cEVXQkVKQ2NodmhCRytBUWNxSStq?=
 =?utf-8?B?Z0UwUkxwelg4WFlETFhZdUoyUHUyblRNUEQwUXZiWHJNVHJYYmFVeGwzNVRQ?=
 =?utf-8?B?OVNPQS9KaTNBV3l6ekkrWGR0Z1M0cFNDOGdZeGVzTmlFZVdyUWVNbkY3Z1pG?=
 =?utf-8?B?THlZQStyT29ES2gxMkg3RlJzV2RldUdXQXljQVp4V2Q3MWJyaGN0bEliQjM4?=
 =?utf-8?B?dDIrV3ltSTNka1BUUnFFZnM0cjAvejBJSEtTc0hlR2tNZ2hwSWNvRERtSmpF?=
 =?utf-8?B?TW16T2ZsR1kyVVM3ZTU1MStIa21kek1PNGJRWVN2Zk1LaUYyOFhxV3M0S1Bj?=
 =?utf-8?B?MVBWdGU2KzVURmVEb1ZsVmdtWjlKcXlKdFQ0bEx3L3oxb005NTdxUGJjM3JX?=
 =?utf-8?B?eVlyc0VjLzg3M1Y3NlNtUFBBK01xeXEvOEJ1SHNheU9namZRZU5vTytPZ2g0?=
 =?utf-8?B?UkVUMGdKT0d1ZEEyL0V6dFB6RldMTFoxTGFKeWN1TTlnZUQvSHBGanUxRTl4?=
 =?utf-8?B?bDh2UlhQY2lleUhQcVE1cS9nbXRpbGF2bEZ2QnB2VEMrVHZaNlhwZDhvTmtQ?=
 =?utf-8?B?N2d1UkRzQUtPK0F1VmtScmR2WFZWaHpoWWJrcFFId0prN0JhSyswUW90SFpI?=
 =?utf-8?B?SVZSaS9DWGhMbEN1UU5vVldiVWpjbWVWaWZZYmNQNEZhd29nbHZ2dGR4N3lr?=
 =?utf-8?B?NWwwTUZHYjI4Qk82aHhUT2swRGNZbkpzRDZtbGhsUzlRR3I3eVN2RVJaM0tF?=
 =?utf-8?B?Q3EvUHQ0bGI4VzVURFBtVllFM0pCNWY3ZENtdzJ1WHVlZHgrc201UWtzN25y?=
 =?utf-8?B?K2pNSmdSTFI4VEtxM2dxbnRQaERHK3liMXlwcGp0Y2dyVjk2QjdtUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dea5bbe-dfea-420e-8bff-08de79693cb3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:10:03.5360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtBj58TVLdAjCu+pyeqe16XKzcX2zzTRzdXmBIPjKlpQd4epDANLsMPmvwGDLg5cUf78Dj49VWgl65XPnvkjEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6522
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

On Fri, Feb 27, 2026 at 01:23:08PM +0200, Lionel Landwerlin wrote:
> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> people have decided to not rely on putting the register on the
> allowlist for UMD to program and instead have context/queue creation
> flag.

NACK!

Broken record: https://lore.kernel.org/intel-xe/aZXhoXWY8tDl63Lw@intel.com/

> 
> This is a recommended tuning setting for both gen12 and Xe_HP
> platforms.
> 
> If a render queue is created with
> DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
> be programmed at initialization to enable the render color cache to
> key with BTP+BTI (binding table pool + binding table entry) instead of
> just BTI (binding table entry). This enables the UMD to avoid emitting
> render-target-cache-flush + stall-at-pixel-scoreboard every time a
> binding table entry pointing to a render target is changed.
> 
> v2: Use xe_lrc_write_ring()
> 
> v3: Update xe_query.c to report availability
> 
> v4: Rename defines to add DISABLE_
> 
> Bspec: 73993, 73994, 72161, 31870, 68331
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 19 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>  drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>  drivers/gpu/drm/xe/xe_query.c            |  2 ++
>  include/uapi/drm/xe_drm.h                |  8 ++++++++
>  7 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90b9017770ea2..33b94ec344044 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -179,6 +179,7 @@
>  
>  #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>  #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> +#define   DISABLE_STATE_CACHE_PERF_FIX			REG_BIT(13)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>  #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index f8980cb7293dd..93b39a3d60800 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>  		flags |= XE_LRC_CREATE_USER_CTX;
>  
> +	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
> +		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
> +
>  	err = q->ops->init(q);
>  	if (err)
>  		return err;
> @@ -850,6 +853,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>  	return q->ops->set_multi_queue_priority(q, value);
>  }
>  
> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> +					       u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
> +		return -EOPNOTSUPP;
> +
> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX : 0;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -862,6 +876,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>  							exec_queue_set_multi_queue_priority,
> +	[DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX] =
> +							exec_queue_set_state_cache_perf_fix,
>  };
>  
>  int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> @@ -946,7 +962,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3791fed34ffa5..e4e3dbe956f05 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>  /* for migration (kernel copy, clear, bind) jobs */
>  #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> +/* for programming COMMON_SLICE_CHICKEN3 on first submission */
> +#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(7)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 384f9b31421ec..1ddc4f269d08c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -14,6 +14,7 @@
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_gfx_state_commands.h"
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> @@ -1451,6 +1452,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	struct xe_bo *seqno_bo;
>  	struct iosys_map map;
>  	u32 arb_enable;
> +	u32 state_cache_perf_fix[3];
>  	u32 bo_flags;
>  	int err;
>  
> @@ -1594,6 +1596,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>  	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>  
> +	if (init_flags & XE_LRC_DISABLE_STATE_CACHE_PERF_FIX) {
> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> +	}
> +
>  	map = __xe_lrc_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 3e500004f1ae4..1c4ae5f6f06da 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>  #define XE_LRC_CREATE_RUNALONE		BIT(0)
>  #define XE_LRC_CREATE_PXP		BIT(1)
>  #define XE_LRC_CREATE_USER_CTX		BIT(2)
> +#define XE_LRC_DISABLE_STATE_CACHE_PERF_FIX	BIT(3)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723fa..4852fdcb4b959 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ef2565048bdf1..df1dc6b9cbc8c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>   *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>   *      This is exposed only on Xe2+.
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
> + *      if a queue can be creaed with
> + *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -425,6 +428,7 @@ struct drm_xe_query_config {
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX	(1 << 4)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1285,6 +1289,9 @@ struct drm_xe_vm_bind {
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>   *    priority within the multi-queue group. Current valid priority values are 0–2
>   *    (default is 1), with higher values indicating higher priority.
> + *  - %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX - Set the queue to
> + *    enable render color cache keying on BTP+BTI instead of just BTI
> + *    (only valid for render queues).
>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1329,6 +1336,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> +#define   DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX	6
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
