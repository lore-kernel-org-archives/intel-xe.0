Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD67DCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A1810E1BD;
	Tue, 29 Sep 2026 18:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5AZZgis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0A010E1BD
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790705637; x=1822241637;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bXlJsi4cJqiBRpM1KYGu9p5jxhPzIuuUXSr93AHLbgc=;
 b=c5AZZgislDm0XHY/comrO2U8DOcA7BFs/MbE69bOcpH49WKVLXM4cI9R
 oCrXe1a6VTGItyOPv97EpugMYwMFQtVWfI1SbC3yNYo6+k0dv+wQZfHlZ
 CoY+hUmZ+X5fU3sKMtTieX803Grv9YvMwO9kSEETWa2shWcqquhndrCnl
 VY+iQkqAhmjSwt8bS8VHxU3keleTekseuF+rxR6NjqTF191N7JB/QGC92
 HpBvQWA68NyrIVeNlfhvVHTufbZFsiC6Jh3htuUfJnMj0ugf5kSY0k2R1
 VD4R2MBbVkkVzWBWbTj4c2mGOBdVE8/42203Mg9O8T7tx274ZpaJtDYJJ w==;
X-CSE-ConnectionGUID: XeShshftTtK9/fYykRCuhA==
X-CSE-MsgGUID: lp88nxlBRbG48iIH0jlzBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="94315899"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="94315899"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:13:56 -0700
X-CSE-ConnectionGUID: EIZ6VidITC2aiqsdi/RlHw==
X-CSE-MsgGUID: Sh0N8NVUTLWqtwh1OV+JVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274552805"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:13:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:13:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:13:55 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guGP4qoWNFpj4QyYUo6cIvvmmWkGUsKzoeRs9gNwDTbGz54h7fFXsh/ve5ef40m1a4wXF2PgJIi1ZuzCLiszp+/qtzZ6AhWKLQ3KVmnVqWp8rK76AxZ85ARkjerlIR1OGJK85LZiFSKnRSnQHsE8pAmHaB3Q17aZL4ZtcpHiBFv44DiYpSbTUt/RyUNSgNEJVs29Ttn0WFaKKDhVfPdFnH6beFfhQJNuSI2/AQWhKqWLPkyAHME+ZUc1dQJVmWAFhNTc3dPgCSA+KvHHs3+NSU7DJUbir49gdQd1GP3/mwIyDVt6NcTO3yiz6Q/iFUF2n8AdaR/fA3VslMYqKw4a/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzmjMrMIEMIH2fHbo/njyO7YsRuFywewWnRL0QZhTZc=;
 b=IabO08pNLqUgpEZhknhK54pLQdBrcnnARmRatJrjnzudpEk1S4ZVA0dA1FPfcgww8IZiDf5ehrEbykeKG2SyjrysnBu3SubIb3V3qHXbSiMLEqn3n+diyPNQF/hoUAwG4zL7fhCtuVZ0tKzH+FGzeWogtbawKMOk3ff01Bo7kgEIapAbamfRA9ptdg0X5xIgBFhk2+cj7r1szgJzFPob4dH8er72nZQQVlYU4tIUJfqJszXmSHUpLkGVWRJ+m9v/pHLVmsJKX75uubb+hOLo27LewY9rdiiCxj3C7qfTl1cftKcwCyMvEcE2Q1ZGOYVAihwH1t4FpSnqEztziyNadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 18:13:52 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:13:52 +0000
Date: Tue, 29 Sep 2026 11:13:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Let xe_guc_ct_send_locked() callers reserve
 G2H credit
Message-ID: <arv/3gSXMjVFC0Fq@gsse-cloud1.jf.intel.com>
References: <20260929050342.221789-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260929050342.221789-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb7a706-1947-4bff-e400-08df1e556aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: F/0EpeMayDiTKO7f1wH0Gerh5PxAEuB8wfgvT9eZa/SbE2piqAf2mUkJpUi6ko2L1VyOgwHCoYPE1qtkj1w48DHTK2p+u9xFPpyVoWo4p7Qj+DtwEkMmsWElYvG6DcQ+Aw6wZ+pywlFF+tf7JoKtLvT4QPiwm+dTnBYq9EqH2CPUm6c1IMxcog+WIgyz+PyPwgNtC0u4KXQzmZ4QpnDh71EwpFNn30dlx+GKoQr+dulL9ab0G7UVObq6Kw7vv2HtZGTlUE3ftUS7e7MVmhxkUhA+dRs/TzFcNbL7mCOqdKlG8Lejw02ue0ku0+Oh7ZpDB2B2E+S+FW+EDRvGY1wrWAFKSvH2Qk7XSRyihDBOwlZigWOYj93S9DfUJdet2tOqpwbESEIxVoJvEl1z5ETgFIiQbaQexaFBAhy8q+ZMqqvF9pwDLVN6sHiNk9baBqG4zwj5sLoxjl4/f+geIlhR20mgsp78jFqmVu1HGf11umkIsMw9HUqkJs60PUkn3aQfmJfZWCOfabRwIb9rpAwpEiso84rpWI6FEY1sOUCBSl6TLXlgABIVtC56MRoSjIoDr2K3OzgNnn4+7VA/k9ifdJ08cw9K0coCQRws+srN2W0Kcsm/TB06g9g9KyS8Qqnuz+gWN20PwCPMNTwjuG6TpeXl4bI/mdLCAbp1jajyYhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tdAjTpYlPGr04bXsEfoVqKIItufgbzP7ROu8kiSeQr35lPMwiumdrmz5vicQ?=
 =?us-ascii?Q?ZJn7GH1oa5x+jBlUkdbnw6ROkDcyZ2OCGVRLB2eqwPCowKq57Nl0lk/201ix?=
 =?us-ascii?Q?Y1w26ddEgiFkSJrNciMfihWqdzJfgEPcBB4Ak3kbWw3+LLOibl6kiRlRJ6MS?=
 =?us-ascii?Q?2mfb/QL0qZMIu1eW3S9cCzotw1cs5lQp8uQC7RHqimcYHUSBaSP6XvZ2ea7X?=
 =?us-ascii?Q?EzMmicNavBFilwK7wTYCJ22d2J550fVLQ3OcAGr3OzNtzpWgqK99l3futcNn?=
 =?us-ascii?Q?8UeK3JO+TVyOytRIM9k9RX32Tnej/Mf8e24w5OVruJYoQkZGRZliQgdGlfbF?=
 =?us-ascii?Q?ckTRr9KrQKbcTaffzq41DBwO2eJrNoFv8E2RWZTa+aQhfNr47TlyGRXh5xLu?=
 =?us-ascii?Q?/erniK9+xjccDr/X53cNHrIsU9y6lBEJfjmwueByia09eb3MJMerBPieJaLE?=
 =?us-ascii?Q?d763mmm4YqdKwTZQ9FNRXltLGOkaE1Tm6HWQEgu9aeqBnrigKSiE+y1dtsSb?=
 =?us-ascii?Q?K/FlOPCEjMnsDN7+efCu6p2wur7e5vx1Y9Nx9DgV0zGQjU/BTNY8dc9aQnNK?=
 =?us-ascii?Q?wM9U3QMd+d+bJJTWsain5Qw+pB6ursHIK8I4kDICKllYb6ttdlleRiAGPrSn?=
 =?us-ascii?Q?NkTrg774+Ii9OVM4XuPHz36VXyzfG9b7SZwxI0Sf9tyUHWu9kVy7FX6HkF1z?=
 =?us-ascii?Q?DPsa69L0X4iA2ki6ys7YzRPKdp7F/SJLgwCGNuRIzEe7b9WZRY2n3G6FNW0M?=
 =?us-ascii?Q?wDh29C6sUwSzRi1F6oZgyZljwp1UPUjKevIuk5ZGz7aXyNbqyCiu+icYJjOd?=
 =?us-ascii?Q?mQz/+deByuG5I8i3J+XSLLrnrLDu3SIRgXu5CnPAK63BqKdI7qmDBeg4Yxc6?=
 =?us-ascii?Q?qpYuEX2jOZgp0MXlVQgccrfBuuA3Ul5VzhwJzdwdA7EotuZA6342xUc/5hqP?=
 =?us-ascii?Q?hA2Q7K/iTMZKZqy9GvR9DAQVhGKTuV5aM16FqViKlQZGWbTYPUBhstxWLrZe?=
 =?us-ascii?Q?BLAV3r8qa+4WaCVZmbpgacBEFEbPzd5iJz9Z63Ac6cbYL6QZAcmPflwZOIAF?=
 =?us-ascii?Q?frba0Ii2L8wwSmj17avfCv5Xx2Oid+PC3NlKlqO9qt39YEBV07p3Mvfnut8l?=
 =?us-ascii?Q?BXuIFGT5BGlWbuww2ftqYON/qC50rbS3af6iDY1Wv32D+kS/CWCpyd2gX2bY?=
 =?us-ascii?Q?tJkAY6PHDCLlb9jXc0knBjeRbNrrke7xI3JuJXprP004e9CJK5yH7gfZmnSZ?=
 =?us-ascii?Q?7v8m5GTYK1G0BokOXe2wScq7PSUxjqIPMQUCjwNga18ST9pPO6aeG+gsogSH?=
 =?us-ascii?Q?ghJVlpuKhHQ73YNYN3OHO27Z9tRhM18gqucrBrFVYi/iuh4+FTZag2vW88VM?=
 =?us-ascii?Q?W8uWnrcLeQdOmQhaTiAMiM6v4ZaYTxXDyvgjPJDizhwzFdlnMiEiCKUJFD/S?=
 =?us-ascii?Q?A4YywZiMCam0IAHNbJkVoXxBShYlG/viziPTM598FRLC3HdAoWNcCt4/gpG6?=
 =?us-ascii?Q?TJ3TzNQOLK+mmQbR93ejd/A+MbZdNhtzIDIkyGbG0cXkDIZL2fzb007UBd5/?=
 =?us-ascii?Q?RSWFNaVFRdXbmfPi1yx3lcPlKNU2TluoU0ADBhePLAwzbV1KFrkyQsXtzMe1?=
 =?us-ascii?Q?xrUHA2VumlTE7wYdE6JQxhK0iTqOucd2vuAPZ/k1QhorvVLga22WM3V/F6va?=
 =?us-ascii?Q?oQfZlY2xhoemysgL2C2BJhCZXCKFQkceKnJ8BrxLBDTgBR0625jpJRdTiDNI?=
 =?us-ascii?Q?ixnKcKRwzw=3D=3D?=
X-Exchange-RoutingPolicyChecked: HfrCo9PW1AmMPdd2Xorf44bMdfu0Js/HY7Pkkl98L5u2oos0fSXLGyryiw3bNBtRUMKSYuR+lRL/68Pr4efY/B+CvAFeEhZv7nm5KHwsnlQBZ9bslk/atBTfdrEtj4V3ACnEz3gUYcCvU6RQBFhB9Pp3eyY1ACEh6SdpTFMsVqTZUqvkf95OQDMU5oSLGH50whtUdg+/C2vVLilygNDVfvTu2dpmjSl/DPgZGJ22/kRnyUaoA0IGStIzr9MrzqOpwhXk0GixF1eyM2F6TgE9A0Qw5mShfJL+wfui2yO3vhjf7DIMkMfBDtCZoOusb4u0mY5I4rMKMkQSMmxYhARVMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb7a706-1947-4bff-e400-08df1e556aeb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:13:52.7874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/uHK17TvGWuI8VlSAccm/2bmiXw5INDIDQOslr1ohVbfNv/QwShC08rNa6V+FRdm9X2p8YayLoc4vcZ8oYM0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
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

On Tue, Sep 29, 2026 at 10:33:42AM +0530, Sujaritha Sundaresan wrote:
> Commit d4a7e1611716 ("drm/xe: batch CT pagefault acks with periodic
> flush") added a defer_flush argument to xe_guc_ct_send_locked(). At the
> same time it dropped the g2h_len and num_g2h arguments, which had no
> in-tree users, and hardcoded a zero G2H reservation.
> 
> That leaves no way to send an H2G that expects a G2H reply while
> already holding ct->lock. The G2H receive path (parse_g2h_event() and
> g2h_fast_path()) releases credit unconditionally for replies such as
> DEREGISTER_CONTEXT_DONE, SCHED_CONTEXT_MODE_DONE and
> TLB_INVALIDATION_DONE. If the credit was never reserved,
> __g2h_release_space() reports an "Invalid G2H release" and marks the CT
> dead with CT_DEAD_G2H_RELEASE.
> 
> Replacing two u32 arguments with a bool also means a caller written
> against the old signature can silently change meaning when the two
> reservation arguments get merged into one: the call still compiles,
> still sends the H2G, and loses only the reservation.
> 
> Add g2h_len and num_g2h back, ahead of defer_flush, so that the
> function matches xe_guc_ct_send() and forwards both values to
> guc_ct_send_locked(). The kernel-doc now says when a reservation is
> required and that a non-zero reservation must not be made from a G2H
> handler, because waiting for credit can dequeue G2H inline.
> 
> The only existing caller, the pagefault ack path, does not expect a
> reply. It passes 0, 0 and behaves exactly as before.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c        | 17 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_ct.h        |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pagefault.c |  3 ++-
>  3 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5c393aa29de3..da5ce97484b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1290,11 +1290,23 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   * @ct: GuC CT object
>   * @action: payload dwords (HxG header dword is expected at @action[-1])
>   * @len: number of payload dwords in @action
> + * @g2h_len: G2H response space to reserve in dwords, or 0
> + * @num_g2h: number of G2H messages expected, or 0
>   * @defer_flush: defer publishing/doorbell for batching
>   *
>   * Sends a single H2G message to the GuC CT buffer while the caller already
>   * holds @ct->lock.
>   *
> + * Callers that expect the GuC to reply with a G2H message must reserve the
> + * matching credit via @g2h_len / @num_g2h. The G2H receive path releases that
> + * credit unconditionally when the reply arrives, so failing to reserve it here
> + * corrupts the G2H accounting and kills the CT channel.
> + *
> + * Reserving G2H credit may wait for, and process, outstanding G2H messages, so
> + * this must not be called with a non-zero @g2h_len from a G2H handler. Handlers
> + * should use xe_guc_ct_send_g2h_handler(), with any reply credit reserved up
> + * front by the H2G that triggered the handler.
> + *
>   * If @defer_flush is false, the function completes the submission immediately:
>   * it makes the payload visible to the device, updates the H2G descriptor and
>   * rings the GuC doorbell.
> @@ -1312,11 +1324,12 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   *   Must be called with @ct->lock held.
>   */
>  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  bool defer_flush)
> +			  u32 g2h_len, u32 num_g2h, bool defer_flush)
>  {
>  	int ret;
>  
> -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, defer_flush);
> +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL,
> +				 defer_flush);
>  	if (ret == -EDEADLK)
>  		kick_reset(ct);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 3ddc665ab84a..e2a33249d65d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -56,7 +56,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>  int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		   u32 g2h_len, u32 num_g2h);
>  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  bool defer_flush);
> +			  u32 g2h_len, u32 num_g2h, bool defer_flush);
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			u32 *response_buffer);
>  static inline int
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index df237fd40551..6b48550e7579 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -55,7 +55,8 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  	bool write_only = guc->pagefault_ack_counter++ &
>  		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
>  
> -	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
> +	/* Pagefault acks are fire-and-forget, no G2H reply expected. */
> +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action), 0, 0,
>  			      write_only);
>  }
>  
> -- 
> 2.34.1
> 
