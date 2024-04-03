Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE56CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 21:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AEF11277F;
	Wed,  3 Apr 2024 21:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzEGkx2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1065911277F
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712178573; x=1743714573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=T89bX4a+CUUc6wz0Nc4JFNJGeWoHW5XzCwaA/oxcCJ8=;
 b=nzEGkx2XKf08xuQBHGO1zrtwInb3LtjQuL4D6AtxAy9I2MUZAi4lQX0z
 +Kr7sroFhmv6znVJ4fnOz4N/5j1bq/xySsIOoygh7QgPzU35+8DSJM1fo
 WYCpTkoH4IKGf0J3FByq2lTIsJ2EycPTAjMNLYgELjoImsZHNNKKjs1Ss
 MnhEj7nTUTEUjMHocv5J27Ob1Rkmolo5cTqx2CAE6EUM6WLy5yV0KlSps
 HJLT5aPIoNIdnp8CZXycv5g8Pq+VCZS5mFiBvALlF+mJ+cASV4Pr4wuu7
 FFCwMkjX79u6JIROaXpS1MSf7hYOXxmr09lfXGWwwm7kNNNs8ys9Eei/E Q==;
X-CSE-ConnectionGUID: nv6hqmnWTLq0qfWsQKGD7Q==
X-CSE-MsgGUID: 81Jzsaz2QSmZKSzlF0JHjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="29914317"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208,217";a="29914317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 14:09:33 -0700
X-CSE-ConnectionGUID: DWF+qheTSDC6oBj8Kqu1gg==
X-CSE-MsgGUID: XCqMeZ4LTr68a5MsjaqR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208,217";a="19170968"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 14:09:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 14:09:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 14:09:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 14:09:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQTDeejMpj3+lFrEPwHXv79oIjUxo1WkJRCMwF5d8iFdT3JaescXK4nBaS3Zaxb/iXXjc9iE5isq98fjj/n5TduBEEnWv8/lS9gvrggDpXzB1KXcnmQBV4pklhaSDT4MZkN/cO3NjI3bebIxwUycwo12jMzGEhL2lsn5NdNTB9MTCCA6sZAYJQxOVshyZVMGErAKrRa9vx3qKLO+TFNRA3EozK5O3NXoeuo4UxLIvZ+JcYeRhL3yxZyKiGjoPVwYo00DxJ0wzgKuCxZz44N05RfqwoF9GjeCtuc0qUHHCfCKeW/b6Pbhng6Nc3n+1p/0H/c7ULLC5dIenDz4heeMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhN6c1F4bZiAiWBnXwCR3BKH6AlEy5+3/HGA0XTLD8s=;
 b=JM2Jx+iBELp7DCg94M/XBxgWvchzbtypDbW10gEhbGqSva97X6liG6bbz4qTDlow9rmpEJQseBDZ4Z6FVn4Byj9jhnxwOs3RG7IyKhoF1fGVWskTZW7MRTpEgTqkXywxA+fzHZ811eVhlf/He+1CKvbZy5WxUGThxPEiZ/7v6fw1Wha+a62w8+gwjX4SDatQi6SmP1iWeAbB7/7MT2+LeWs38g0rjkE+wAqgt4cpKV0x2sKvpTlaKEiJCvV4nSvHhrZ5IgdwY+fkhPoTsCUqsRgKluXt0CYFGVuRjP7sxK1nN/wHrAdpjrXODyY+7Qk1A8gAFdLner+isUoNfTirxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CYYPR11MB8306.namprd11.prod.outlook.com (2603:10b6:930:c6::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.24; Wed, 3 Apr 2024 21:09:29 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%6]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 21:09:29 +0000
Content-Type: multipart/alternative;
 boundary="------------e5NqFieZSF5PxSIJCwUtCe1s"
Message-ID: <370d78d4-fe25-4b77-b6c0-62bf6862d7d6@intel.com>
Date: Wed, 3 Apr 2024 23:09:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Protect devcoredump access after unbind
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20240403195044.239766-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240403195044.239766-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CYYPR11MB8306:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7mMXTJ5ZzMm+dqfOnQoqXhQ1IyuIZIkbIYvBZ7IjLI29mkutURuLakrnc+j04w+V7vMFDpaORmVXVOkpklGfI1fh95OyT0G3ftjtuQlG5eBXTo3zQbkKlC1Q0Cjo07AufMMjOQu/Xfsf9QCOKaVU9mJrQUGgHFtkVbnT64SOamPX7NumIhpZPrZfNwwX0cavYFC6v8QTxflKVq4ViZiBzxzyC90DVipSsaovWf1tDhx+7M4U25t8ruPHjpSC4m4Qfok4hfOJgQfexNkRU5d7lEspaFhCz3HRMFVWZwnsyJhqBZQDgDn3C9ClN0U1qvk9gkLoG++lr1vCmdM/MtqDZ1uByDT4ExIo8BkTyiA7csMJLzik+S1pJGHwfsOal2EJotPgpR9ceKncxfLL+183w4jWQSAgNm3Ft+REW6U/SKAehKa5NQ0XmxtNKThTtiC7CRnwP2786P3SjllIYsv8BHxd8OmAF7k/xwKL4+qXwh/ah0cVXHaoZBVBdHbMlbQZ8gxEAkudTLvziJw1W5GJxEAIUde0XhAEiZYGJhxMQ3EgYR7sV4Pe6k/TkyXsoAcJaj3xSbccBbHpsQg3YMEg6Ydlg8solh2qD/Td55dNIovXKKA5Vi9jESF8yRdnPrvWOdfco7b79VZTlP+uru9HbOA1U2zNFCjnrSzNkEHF5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1Q5cERndllNUFByWldDOXVaSkFnZFF0YVJJY2lPb3U4S0VFMFZhQ1cvdWpi?=
 =?utf-8?B?ZVNLRmUwaFh1VEo4QkxVRjZhVEcwQjFvQUhmcncycGMydVVmOU9pdzR2SkhY?=
 =?utf-8?B?clhMKy93dktsb0JwZXdqRVRldWgvOHQ1OXY2Mk4xaFFBTzlEMm5FZ1J3OXVK?=
 =?utf-8?B?dHZ1SnpTcjBaa2FGaFY0L2NFc1ZqRjlVU1BrR3lCYnBINVViZHNiWUZUMDdu?=
 =?utf-8?B?anZlQ3BXcWhBRWpXdXErNVhHYWVuUkljNFJtV3ZOWGpVSWdHT2pPbWcycU9t?=
 =?utf-8?B?Vk80QW1PK2RxanZRZWtwbkJSRzZSK0FxTjNqWDVwcmxLaHhxRXdsRUZobVox?=
 =?utf-8?B?Z21QcldxV1pIRVY1SjVtdVpYUFZIN3NpU1drd2hPMGJoSDVjWUtUUUVXQ3Y2?=
 =?utf-8?B?MGpZaGZrU3lGVXdDY2NBRGoxRERrV3hLQmJmYTE3UWJiZnVkY0kxY1pWNVhW?=
 =?utf-8?B?bUkrSTZ6QTJzWEJzb2lwaFdoTE1NOWJPc29PZVU0T1E1eStVSUtaazhWY3pU?=
 =?utf-8?B?eXdaaW9RSjJEOGJlYlFzMStSTk1JbmgzZjdtU3AvUmo3d2JnWllNcGY0Z3Qr?=
 =?utf-8?B?SURUR2RJMVZoa1F5aTEzNmZWZTd4NmZmZlhDUC9uSDBlSnpucDFFZ0VwTEIv?=
 =?utf-8?B?Si9ZV0psdkhqQTIyeFQ0enhBVzg4bUxYd0dkSUJqQ3JzTkNrWXBKaXltOXZP?=
 =?utf-8?B?U2dhMzBvdjFTRHpxZGNSSk5OdWxRdmRyNDJiNWF1NUlLMkJNYWU1M2UzMnRk?=
 =?utf-8?B?UUoxdld3R0tqbmVqK29JbGNha2FEaE5sTzRCQjM2VVRvWnh5SThncVZRdVNV?=
 =?utf-8?B?V0dNOTlHNXVsaTFOMU9MOFJreHljYllrWUlxUmNSRlVsR05aLytRNGhmZlRy?=
 =?utf-8?B?UE9YS2x5aXZEUTlCSDNTSkVnQ0RGUnFGSmRlbTltOUZ4bHpDSnFleDVFQStF?=
 =?utf-8?B?VGNTOFVvOHI0bzVJUHAxR1o3ZVRlNHkxb3A0RkN2ZDhzc2RtS2MzTDBzZVNX?=
 =?utf-8?B?SlZmVDgzbVpzb2VaMnp5QThLVXdoZnpKRE5qUlVyc3c0ZGNiOU1NUHdFMDhN?=
 =?utf-8?B?M0RUREl2SkR5d0xpUkhRTktseTEwZk94Uk5FcnAzalJNWVZXRDk3am9VaUpH?=
 =?utf-8?B?K3d6c3RmUzBBOWt5TWNUK2o5SzhYYnR1d0ZkVzUyUVBUcE5IN2dNVlVqdVBG?=
 =?utf-8?B?V0IrWi9UamZ6Z1ZTYzlSNndOWVpxRW1WY0gyTGhQVGNaa211S2ljMHRzNGpj?=
 =?utf-8?B?ZlhmNGd4aXNuRlNRVGVxMXluSmNEM2FtZEtlQUwvUFBiS3hTTVVrWDl3dVdn?=
 =?utf-8?B?Qks1cHhoL3lLWHN2SWkvNDR6MEdwb2VLK2JncGxhcFhENS9pcGs5dGIvUE10?=
 =?utf-8?B?bVAvdGREbjRjTklJdHExYnVFMEd6SjRWc3luVVlrbkcvT2lLYVFjaGxDVkRv?=
 =?utf-8?B?cnhrR0l3VCtFUlVoYmxxZzhwVUZ1R1h4ZmJNY2NyVW1LbC9McHJoMElSTHIw?=
 =?utf-8?B?SVJQek4wdWx6OENMeFZLVzF3REUxdkk5cytObUc4V3Y3bWtKU2x1V2FseWJ3?=
 =?utf-8?B?WFZrdC9Sb1J3SHlZYXpkUHNzakZFVmdxUy9lKzVHK2cxZmU4eXcxZy9DWXJK?=
 =?utf-8?B?b0ZVOXF2eURhYjVteDAwKzVleVVUWjZvYzBMVVFKbDVxc3g2RVlZdXJodXcx?=
 =?utf-8?B?ZDlQOHkvMjFuNHEyVGhSTW5TT1V5UUgyU011RmJyMUtmendXTDhsdm90dk5q?=
 =?utf-8?B?YTljVHhPbjMvQWV6c3VXeGtzZWd6NUV2SWs5YXNQU1pEMDNIbXQ5SDNnVWh5?=
 =?utf-8?B?ajVqT3MwWS9yOFBwL3NZVHlXWVlvYmtkOFVZbG8wV3RPdnN1MEZvM0pJV2FV?=
 =?utf-8?B?ZDNaeDNNSk55VE9kRVYwd2o2ZmJZVVBXU0c4ekNYV0hrbGE4eGl0VWVIU0l5?=
 =?utf-8?B?aGhDUzlCU2NFN3NkSzAzTTNzVG1CTjIxdis5STBwUUx1SHdleFl0YU93SnEz?=
 =?utf-8?B?V3BobmNkR1JSR3I4NzY0ZE91SmVwODRNaHR2T1BFSGd0RkZ0QnlMTzl4dDhp?=
 =?utf-8?B?MFBrUU9oQWllVGdWb1NUSVY4elVLMGJTc3VLbjgzZnBMMi92dUpqRkpHRUQ3?=
 =?utf-8?Q?38AUzjOfZNpJZxYWAL9RI21WU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a91db669-d0cc-41c7-c0fc-08dc542259a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 21:09:29.1489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /if/Xbe7DN2LlJoJksq4gQUCsMra+vvgJ44CYghMehKz9+ds2671Vf8JMkkMlOqOjYRQEVwP01n0CyOwd0xokQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8306
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

--------------e5NqFieZSF5PxSIJCwUtCe1s
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 4/3/2024 9:50 PM, Rodrigo Vivi wrote:
> While we don't have the full flow protection when devcoredump
> is accessed after device unbind. Let's at least for now
> protect against null dereference:
>
> [  422.766508] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> [  423.119584] RIP: 0010:xe_vm_snapshot_free+0x30/0x180 [xe]
>
> While at it, I also fixed a non-standard code-declaration block
> on the similar function of xe_guc_submit.
>
> v2: - Use IS_ERR_OR_NULL (Nirmoy)
>      - Expand to other functions
>
> Cc: José Roberto de Souza<jose.souza@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
>   drivers/gpu/drm/xe/xe_vm.c         | 6 +++---
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f42f1b567067..6e32f9ce4eb5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1961,6 +1961,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>   void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot)
>   {
>   	int i;
> +
>   	if (!snapshot)
>   		return;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f4bfb2705956..2a431690d245 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3426,7 +3426,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>   
>   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
>   {
> -	if (IS_ERR(snap))
> +	if (IS_ERR_OR_NULL(snap))
>   		return;
>   
>   	for (int i = 0; i < snap->num_snaps; i++) {
> @@ -3483,7 +3483,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
>   {
>   	unsigned long i, j;
>   
> -	if (IS_ERR(snap)) {
> +	if (IS_ERR_OR_NULL(snap)) {
>   		drm_printf(p, "[0].error: %li\n", PTR_ERR(snap));
>   		return;
>   	}
> @@ -3514,7 +3514,7 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>   {
>   	unsigned long i;
>   
> -	if (IS_ERR(snap))
> +	if (IS_ERR_OR_NULL(snap))
>   		return;
>   
>   	for (i = 0; i < snap->num_snaps; i++) {
--------------e5NqFieZSF5PxSIJCwUtCe1s
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/3/2024 9:50 PM, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240403195044.239766-1-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">While we don't have the full flow protection when devcoredump
is accessed after device unbind. Let's at least for now
protect against null dereference:

[  422.766508] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[  423.119584] RIP: 0010:xe_vm_snapshot_free+0x30/0x180 [xe]

While at it, I also fixed a non-standard code-declaration block
on the similar function of xe_guc_submit.

v2: - Use IS_ERR_OR_NULL (Nirmoy)
    - Expand to other functions

Cc: José Roberto de Souza <a class="moz-txt-link-rfc2396E" href="mailto:jose.souza@intel.com">&lt;jose.souza@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap">Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20240403195044.239766-1-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
 drivers/gpu/drm/xe/xe_vm.c         | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f42f1b567067..6e32f9ce4eb5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1961,6 +1961,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot)
 {
 	int i;
+
 	if (!snapshot)
 		return;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f4bfb2705956..2a431690d245 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3426,7 +3426,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 {
-	if (IS_ERR(snap))
+	if (IS_ERR_OR_NULL(snap))
 		return;
 
 	for (int i = 0; i &lt; snap-&gt;num_snaps; i++) {
@@ -3483,7 +3483,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 {
 	unsigned long i, j;
 
-	if (IS_ERR(snap)) {
+	if (IS_ERR_OR_NULL(snap)) {
 		drm_printf(p, &quot;[0].error: %li\n&quot;, PTR_ERR(snap));
 		return;
 	}
@@ -3514,7 +3514,7 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 {
 	unsigned long i;
 
-	if (IS_ERR(snap))
+	if (IS_ERR_OR_NULL(snap))
 		return;
 
 	for (i = 0; i &lt; snap-&gt;num_snaps; i++) {
</pre>
    </blockquote>
  </body>
</html>

--------------e5NqFieZSF5PxSIJCwUtCe1s--
