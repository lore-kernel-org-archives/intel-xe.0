Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69196D1BDC0
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 16:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F9610E488;
	Mon,  4 Nov 2024 16:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJX/ZJwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698D210E47F
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730737547; x=1762273547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IdZDqBLGvIP6N8Ye2kKXoTElQ6BaQJJx03sgUVXAW2w=;
 b=MJX/ZJwOaTDMITCZam08Uu/VLazjyLZbQHPjf47A0eVMBsP19IZ4+VMC
 CMISetGRwXBZEj4GTO3rNSwFNRTj0AMuy9N1GIObgyPmV1RfmElbhAPwt
 LtZDwNFbuXNg7xhCgIKH5IB3xq+OrqzAITodIuQFpPFemT7by85lqZwWa
 GAT4jfmZD7+ZI9yUo1TsLe5vhBnArv0PsqZgy1JAAt5NqfLPeg6JFB/y4
 aRCSIFUPkiDEf0f3oPictFKEUqTLinpTUch3fMGks95ncTrjCv2HQbrVp
 wcRC+aVhnsWcV4ZMM7Vnrkt3JwHzT7xI5NaPAw8pkt/U/+hUogWqXMbJF g==;
X-CSE-ConnectionGUID: 5GQrqpWwTdCTjE1923E4UQ==
X-CSE-MsgGUID: st4q/XHdRAurroQma3NBsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55846600"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="55846600"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 08:25:46 -0800
X-CSE-ConnectionGUID: y+cb8gOMT++6J7AMh9Rbww==
X-CSE-MsgGUID: C4AF1jBkTEanPuIPro68wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83798050"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 08:25:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 08:25:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 08:25:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 08:25:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9W2/yHzf+d4xotLNZvo8HSvgqrS3xZKCZAx4myairCW2eKGoTWxNw3Yqhf5BQAmGU9EgGJROEKVN/pU8npz+588oc1iKHsMEqek3s9jdW9yOtFiXFoxGNq0EoXrWK1sx3kYaQDsxikx0K+hVBs9yzBIVB9V+nCn1355GydYLJVBizjW4Pb+zxh/eHpIck2g1j5mycwA6Ei2WsDE3kCXCWjIRFYOzKxpRDYdeCzXJVJrMi2x6KhEhEtQrpo7+uYTqyqf4ZD+kDpguobTJXVgpmnYMjm0Dv7MdKqyupKAk5ss4U6Fh7ue+7RzW2Ct0LJTbaeQfOMPcoGH/FhlGwuopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKgKSZhd1KT2GT+qhIR8Ra2MCWSXw82aonJNH4BvAXA=;
 b=scNJ75yeu9AIXFO/uNu5KCUxJSq2zimY4NVzIWaE2Ky5k5H3llkAo+hbGgropM6FqGebuKkgoj41lVaoxJm1D9PLzE9J7V/U8x2Zo/W5dG/Q+crSwVEWkvqQNhBJZ3F//ORelAP985OvWbZI/jBqf91MBnCOCZmNgCYEYOT82NavOrLrXVoe7aXoojxVoxJ6ZDOJzrmcgzODzf083FgCJ/kYsca5D/w0PXqqHSaIN8oQg5prmLtAnjVS468RxlwBRunCL6Oo1Tp7EaAsQJwVbUGyFOmWJ6u4sHKfcPeM6LObZsM0a/sBu3OpXkUoROKjDz7wkAFmpyXJwJIjf2zANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8419.namprd11.prod.outlook.com (2603:10b6:208:48b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 16:25:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 16:25:39 +0000
Date: Mon, 4 Nov 2024 08:26:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Fix potential GGTT allocation leak
Message-ID: <Zyj1otCt6kRFGiw3@lstrano-desk.jf.intel.com>
References: <20241104144901.1903-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241104144901.1903-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0278.namprd04.prod.outlook.com
 (2603:10b6:303:89::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: d08f7e04-1f72-456c-1374-08dcfced51c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0+xMlotBSnmrSlJLzENi1IZnpCzFqniBPclPzJmGPShV+vkYuaiQ5vFd++GW?=
 =?us-ascii?Q?CjEM+GLv0IQK5y8e16b7fOc1KLzUPB50bz4FkFRa8abSVsoONxd6z7kizH8u?=
 =?us-ascii?Q?Ft/Vch2FdOGf9H1KmOXxqiIgKa+BhjHJF/X+SDWoJXAmjuvT70yrHErqvnhx?=
 =?us-ascii?Q?NWnBcXH5t2Wlddbfwpr/Hq2L1KKodybXFRxvF00fv2ZK0GJFEviVrN5LrCYQ?=
 =?us-ascii?Q?HDg1baR+6XHq7k0MeFfyv0srt+r07UfXFtvvR4j5r470Yu19u7kIgu/OGyC6?=
 =?us-ascii?Q?lltYgt9nbcjcpbIcz5ifsN9rcPCBQ844Z6a4eI91SAAj2cOrJT6MTdWUBOoc?=
 =?us-ascii?Q?NyeInt6JayKi6K4vzYq1jb4X035bnHULyj1Dgns7Uh1OQ8AMuDtEiDluzwGb?=
 =?us-ascii?Q?HKdc1mcx8stGmYK+laGfGBgJW+BmvtqU22deAdtph7f/LeLR9ot2WqcULZHF?=
 =?us-ascii?Q?PlyTr17eTmGu+Rrj04OaZ4Dnviryej/9ZNxpBxbdyMQDi2gm7Ya9hbzxEWQH?=
 =?us-ascii?Q?sA9OFkfP1jUbGp9QD9ewEbkNU6I/VtizjMe6cN0ppnUjTUrpWiAiOLxb3yBV?=
 =?us-ascii?Q?usC1T21TsvJAc8MKbwCsFwKNTrROTb9tE+C9ojKNpEkoEYr/2ZRNIiAdwAG5?=
 =?us-ascii?Q?BlQNR1f2oKQno2gwcNnodQd5hgSna1y2Jygj/6cwWsnE75FN4YaaLPqMapxo?=
 =?us-ascii?Q?32HQt3aZu8bghLXXjr8HgXJW8KMkSfRMIlzN3CcqjfHNYdQ53+l6fooI5xEg?=
 =?us-ascii?Q?iBOBbWBBvIh+fvFDd4aUr8iOzInOoW2aCSgfWMXJsBGOuWj7VRO9BrFRFaMn?=
 =?us-ascii?Q?6lXLjqvhu879w0lXfzDgJu63nuS7hKd71ZuSp8Ts8N7mDjkw+D6mKuo37iTa?=
 =?us-ascii?Q?OKPdlI2u15Hj/CUiNlYOcvgYikvoYtFO4OzNA0r8eVJOxeV9IsJMjhZXN9h9?=
 =?us-ascii?Q?Pk9JFtWSI65K5ag+eCUW2Qk7ZdYwh/LhSNYr8/wPS+AqqVD6SwMbWqVCVNL/?=
 =?us-ascii?Q?xZuoYyDgLU+meGiV1kuhycF7J+UXNnRVWGn/7vvXLrg1E/v4mqS0YPch7I9U?=
 =?us-ascii?Q?98U7ei9KcqLnS4z1dWwP4M4KDg0x8zaicY+D3pz4xjZVSV2RA5GCugPxEEa7?=
 =?us-ascii?Q?SuJpdsVjuh5tDRwJAMEE+3B187AEAAFlzH5Ilu9GItfYhWLZDrzIHdIGZDdT?=
 =?us-ascii?Q?PU7xVJF3vDiJpg0wp2JXXF2e4wl/utmbMRbDa6vr1zRYEICdC7WyGT/T6KAl?=
 =?us-ascii?Q?YRU54VX1NIVRoGGAzmp8pvgjySzR+p32x2/bTJ+W3xnA3rvr0e9DamHunyyd?=
 =?us-ascii?Q?R7guRhKu50/O7dez2waT1DX7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9C+ufvv0rFlWiUzt92xvAT2FgMCZXXHYX92cfhXfJNyqSWBjvZx82FSL9EmF?=
 =?us-ascii?Q?8ZBHGRfK6da3/JhFye30Gj179M2OTA5oCnFDLpCt0PhGXpozHv27juIWWUaS?=
 =?us-ascii?Q?NXsbHoDBULQxX4BAksonkzC/Jpfyz0CVyEzT0osmkLLCKimGkqX8R8wPo/Mg?=
 =?us-ascii?Q?gix2dFx8N03GVbKh+gqAiCgsV8f1XSnZ+nENz1/SIl2jlgaHPQB/11OEsRWq?=
 =?us-ascii?Q?J2oKM/AfBZJ/vXfBCgE80HIpHEmK4OS13uHbkmC0NNo5y84uVqmT1XU9Ucw6?=
 =?us-ascii?Q?98/UWCgqwg9OUteR46RkWFz5M2gDQhodHYx/6TPQXGkLOSp/LmRR/EubeTB+?=
 =?us-ascii?Q?89PolalV4e6DjnWPVsL2De1QToWktXMNuDhtrm9F5335RbiVNpzznLu/ql4Y?=
 =?us-ascii?Q?NePFoDDY5/lCEAvG3X7jNoKTDaAbzl0akd9YQhV5ET3M/3EbcwwaVj/U1R5T?=
 =?us-ascii?Q?u/GTJ9q6XWNrCkgECG2wCj4gZhpBgQ2lEaL4/n8EKJkEYTTZdGd/h7NXS1QJ?=
 =?us-ascii?Q?6dgmTE1Y8FerNPga/jTTrE6qzLTEMCor7K7Cd7oNC22Y6+i+7sJBmLPELWlL?=
 =?us-ascii?Q?RAryvhZTRCPWWi1D38TAu5X0z9plHr7AURVHYHiz2Qjgb7FlcvCb/x3MBePF?=
 =?us-ascii?Q?hxGdA3ikUUhEJxvNLwdzGmEfb49nmdqBfJsIJXuLJj4Vy5qSOtO0wkR0NmvX?=
 =?us-ascii?Q?PCwfdRBqT9yM5R34TRTJ7cbD4gqJYwZF1dpvoGlYzQiydFaJ/I1YXaOMcWsw?=
 =?us-ascii?Q?EnE10sYnzoFMh4HFiPbBwzwlREENppvtZpz++jmUy4kYq5sqCEkKHY2Ulsfr?=
 =?us-ascii?Q?21FcqQdGuojWBTtnRuTkrZ/JNF6bHy2rJP7ch44+4ZUfUVPP9miWDf/CLVjX?=
 =?us-ascii?Q?kmUEqcoKUuV/rR0ECXLpXiT3aldnDsYkexOzhEx/QDB9W538yKum4xXb10ev?=
 =?us-ascii?Q?6Dwa5ygno+Id3PP9/3Bz6IuVx2+FehNwW97gi5VFxWdt7yN6cH7FUB9pWOi0?=
 =?us-ascii?Q?rXJRyrGVrAWB4P8yQeii3Nt2MGN7ocq11Ka4eJIT2cm2RvqC6TaqIE/OF+8i?=
 =?us-ascii?Q?fSZ2y14bKYBRz7kpTlghZXkvqOK7vuAFZvz8oRYoCDZjNu6iwZl6FqiFH8Iy?=
 =?us-ascii?Q?msFZ5i8xrzdNdCGJVHE6XicjJNJXzashS54fmJ9Q032avUaWHMRlabSuSFOv?=
 =?us-ascii?Q?t+U6Imm1RqLWOOteO2HKSiX49FLd9pCBw1+B9kY/dBd8/8oziTV0nnAvWq2Z?=
 =?us-ascii?Q?EYoI1nZgB7Kt9wu4Nt8FUYH1bQDjA/V3Aza5LwIcgOVrejqDXjY8XCttmWo8?=
 =?us-ascii?Q?KYXVBCCtuCUlOhreIW9OPJV8i8OiwIXRQPtgrPQMjmb2w7PNgp/TF4Uqf7hM?=
 =?us-ascii?Q?8+bg9NNdSIaxC3QAh7i6RvsTNK08cTwRh6jZoYt6WlnClX0JbcTH40HBxGaI?=
 =?us-ascii?Q?RkNdS7N4oV6R8O8ALeucCN4ydwKd9sOmcehFoXq9uprzcjDYux3ECpAkFczH?=
 =?us-ascii?Q?0j/4zB1HlsAP5RbfE1LLvw7bfuBMk5AuG+Z3/cGOyD2xvYBx2MI6+urAbUV/?=
 =?us-ascii?Q?iifSU+mokcyDxCGeMytJ//gFbrRnTKIWmzXMqzNDKz0UgYAliJa1r3C7up2q?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d08f7e04-1f72-456c-1374-08dcfced51c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 16:25:39.0276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sgQogrCS7TOf6J3aUqIIpsDQ8lw5mH/lDjY3PZ/nwYottEL+dCukM91XAzAv+a09pfzu8uvEUlONI6RjlquMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8419
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

On Mon, Nov 04, 2024 at 03:49:01PM +0100, Michal Wajdeczko wrote:
> In unlikely event that we fail during sending the new VF GGTT
> configuration to the GuC, we will free only the GGTT node data
> struct but will miss to release the actual GGTT allocation.
> 
> This will later lead to list corruption, GGTT space leak and
> finally risking crash when unloading the driver:
> 
>  [ ] ... [drm] GT0: PF: Failed to provision VF1 with 1073741824 (1.00 GiB) GGTT (-EIO)
>  [ ] ... [drm] GT0: PF: VF1 provisioning remains at 0 (0 B) GGTT
> 
>  [ ] list_add corruption. next->prev should be prev (ffff88813cfcd628), but was 0000000000000000. (next=ffff88813cfe2028).
>  [ ] RIP: 0010:__list_add_valid_or_report+0x6b/0xb0
>  [ ] Call Trace:
>  [ ]  drm_mm_insert_node_in_range+0x2c0/0x4e0
>  [ ]  xe_ggtt_node_insert+0x46/0x70 [xe]
>  [ ]  pf_provision_vf_ggtt+0x7f5/0xa70 [xe]
>  [ ]  xe_gt_sriov_pf_config_set_ggtt+0x5e/0x770 [xe]
>  [ ]  ggtt_set+0x4b/0x70 [xe]
>  [ ]  simple_attr_write_xsigned.constprop.0.isra.0+0xb0/0x110
> 
>  [ ] ... [drm] GT0: PF: Failed to provision VF1 with 1073741824 (1.00 GiB) GGTT (-ENOSPC)
>  [ ] ... [drm] GT0: PF: VF1 provisioning remains at 0 (0 B) GGTT
> 
>  [ ] Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b7b: 0000 [#1] PREEMPT SMP NOPTI
>  [ ] RIP: 0010:drm_mm_remove_node+0x1b7/0x390
>  [ ] Call Trace:
>  [ ]  <TASK>
>  [ ]  ? die_addr+0x2e/0x80
>  [ ]  ? exc_general_protection+0x1a1/0x3e0
>  [ ]  ? asm_exc_general_protection+0x22/0x30
>  [ ]  ? drm_mm_remove_node+0x1b7/0x390
>  [ ]  ggtt_node_remove+0xa5/0xf0 [xe]
>  [ ]  xe_ggtt_node_remove+0x35/0x70 [xe]
>  [ ]  xe_ttm_bo_destroy+0x123/0x220 [xe]
>  [ ]  intel_user_framebuffer_destroy+0x44/0x70 [xe]
>  [ ]  intel_plane_destroy_state+0x3b/0xc0 [xe]
>  [ ]  drm_atomic_state_default_clear+0x1cd/0x2f0
>  [ ]  intel_atomic_state_clear+0x9/0x20 [xe]
>  [ ]  __drm_atomic_state_free+0x1d/0xb0
> 
> Fix that by using pf_release_ggtt() on the error path, which now
> works regardless if the node has GGTT allocation or not.
> 
> Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 062a0c2fd2cd..192643d63d22 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -395,6 +395,8 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
>  		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
>  		 */
>  		xe_ggtt_node_remove(node, false);
> +	} else {
> +		xe_ggtt_node_fini(node);
>  	}
>  }
>  
> @@ -450,7 +452,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	config->ggtt_region = node;
>  	return 0;
>  err:
> -	xe_ggtt_node_fini(node);
> +	pf_release_ggtt(tile, node);
>  	return err;
>  }
>  
> -- 
> 2.43.0
> 
