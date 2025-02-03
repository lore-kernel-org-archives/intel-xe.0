Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2B4C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 18:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A6410E087;
	Mon,  3 Feb 2025 18:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJWNZfQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42F10E087
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 18:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738607998; x=1770143998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3TAznn4PO+KkYnSQ4hg++aeWkw60ECpCTBm0thz+A5o=;
 b=JJWNZfQVCR9gg2R0ptINNqdwZ3yuEtVqQZrhg3kG1xKXKtndTGrPI0de
 YUa65Eu+9+J28djX9CWp/Ra2BSj8qWtrWTwMmxEfWICDPQIRfgozGxNUz
 CIIxdY5D5m91eaoF1uS8DjkibSqtGoLJeGXYu/ZMH+5PhAkzjLUxsSWqI
 DjXf80wQ60ZeCE6A90+jBNNO+ZqyTM76Xp0r/zmLaEw6DqPcpW8r/ymGO
 mF+TS6AM7QhZhyLVo30qOni1tJEj4LZJZR909dh51PfLpdH6EP/fNnHCd
 IGwCnUYvoZbWTuWIbc0Yc7/3N2x0F9/c9gHaXvVtoY1J+ZdXIhfzUbDyb A==;
X-CSE-ConnectionGUID: zoQWltCnQs6rUpaMAm5sYA==
X-CSE-MsgGUID: TuAQnLuZTouc9jpWXsGHvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38822039"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="38822039"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 10:39:57 -0800
X-CSE-ConnectionGUID: xVnosKOcRO6SGRvS8p8B/w==
X-CSE-MsgGUID: 4ah98Zn6RNyZgWlJ6wA/ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="110132459"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 10:39:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 10:39:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 10:39:56 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 10:39:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo5DYov2bFFwQkcmqAEmxs6N61NeSKT7L3RYrZ2PB5lAK2HSzp10HYz9z9iZNcC1HajhzSgRmMOy6J7E1xhYsglkPxhh+h0DNv2UaZZirF43RHNCptNTJR2II1bK2KloRTiGBkl+Tz1xvPY7xAYGScg1bTaQN1aiPyfE+4jDbEn8BlbynAmttwhTrc0d5rnFDdU1aS40sRCax3hAFy5lCtEtU2MOrSA2HloyAOzJe6wGoWeo/A8Qaxnca+TW88idVc2+cMVzvGYrv2LYTGPPQtOHjo47yhHGsFxm8K6rFzk3rxBfwiocOjR+tJC6kcGSNkdThnx5YryfGmegfRfNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUk38B/hNOVpbdTfgfoyPIQd0mrkjn9IHwl45Pc1TVU=;
 b=h2Q3ySTsaSKDNt1VWZ0ocK0NGg29ZwcBkcSpvPWNqPehnwNDaEGEUcWqfv3B5F69jKMlX4aRYcrpvaLlPqA5Qe5P/rKBvkyJFisSYQ12pv2NyImfrlVV6630jBJzy3Hz31RDR0GKQ9mW8T0prOxMxEAdoHxLgn5z7kEdc//yPS5ndtYEqEcpOCqFjXSmDY0woNuX74bDQqD95qogxuTiD/QplNzZIQNqtgecNUJqIrDc16Mwwjk9+nfag789Wz8s4f22yiodwOTc6Hv+M5Q3lU665S0VGTUUSgrq+1aR1PypWfe1KD2jjQh62/fGHYhJYMxlbwn3Hex9ELR+Lr1bow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 18:39:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 18:39:11 +0000
Date: Mon, 3 Feb 2025 12:39:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 0/7] Cleanup error handling on probe
Message-ID: <tlw3joizjnw6ve6tpkxfx67nbcun72fgtfazfgcim6ii35b4h4@fdbwkyqtl62d>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:303:b7::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: ef19fa24-b5cd-48da-0851-08dd44820d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xqPIblD73RswZTUq9qouGB4fTyVJ9yIO5x8F/mumHWOmkjndq3XWL9fQ+izr?=
 =?us-ascii?Q?ktjjILuIOuQp1pin/fNYhr41IYFnHliaIemZneR7LeSeSv5PAp8dQmmM8F6Q?=
 =?us-ascii?Q?3vWmfcZrolt6iRUNkq5fLgTP5FPheZaE7STxDLbfFYruepdqIAGIXBXckgQv?=
 =?us-ascii?Q?HTNJY2QqK7LfMEFf+7Z+WswCyysjjrNZ9LivWE9inTjyVX1IHmItD5+jUrxL?=
 =?us-ascii?Q?ZQEgL7TA+IUQFHp/4NHZCrvN+e+/EM78HCBnNOcsamWFWeMLQMvhSylXMdlC?=
 =?us-ascii?Q?1SPPMSmEoiz+5ZaxPcCUX0ZQ2wLj/Gb7h8ZxVanzAksmy9RKhr/CE8eOLwgG?=
 =?us-ascii?Q?wF7fLTDZfME2SBJvjbiMHRRr93dFaXVu/Y1OBR85DL1+uDN4D9OE9EjXDp4s?=
 =?us-ascii?Q?WXkeSl2ck8zuupsw2dnAzElIDlwk7C2Dgl2qukgF9CZd6HjILBtjGiMcxWf5?=
 =?us-ascii?Q?Gny8L/ywWwIlbbCAtKQR0B8OVEQxR9y1tBn/tjGOh+9w7OebrpnBUy5smKgX?=
 =?us-ascii?Q?5HDbLOaoo1XULbcf50OT+otxMmLSEjfW34Eam0hdZ5o0Arfn6QstMTs2/Zbc?=
 =?us-ascii?Q?GTjimwcQxSeKGwRp3pAbVZrfqfT2ERmLuO652bOgVbexmDZF135bGPkG7KvU?=
 =?us-ascii?Q?T/48M4zSLJjuTuIvpYMFMliEm+gvzNlhGnb4HRoKFxdgjoPsP5VLz9J1MMbD?=
 =?us-ascii?Q?Jj+m5zWxuj5dt42nb0DbSoj6oJ31S3RzIqjKqn4wTJ/fEstZWMqeGdncrGrm?=
 =?us-ascii?Q?2tp4fpXrgXhbeGVYze+cdHd5FSXRMhSd/UrVcYHsRTs5bKc9Q1Ilzfhl9jgS?=
 =?us-ascii?Q?ngggqctzB7esXK/LeiI0AJA6bV6zYo5ulp7hIxLdn210D6nIUg/7igN9lbKY?=
 =?us-ascii?Q?XIMKR9K5+d4OCewLz+pmhNDOBqqYHh2WCCyoJYENVW7kWWqlr6szoV599OSy?=
 =?us-ascii?Q?I8n5S6YR79W69hEATwUYSfzYhJmarJjTapZV4puzXt2pFFSwprefD/yW8Vsy?=
 =?us-ascii?Q?3wpXnLH1/OXfqcQE3YnDl9osxPPhozH8NXnQ1M1C6q+7DrLqMwf2WtYgqZ5i?=
 =?us-ascii?Q?O0DvRjfJyDT/smFRZhrYYpkcC+YyciRqILA4UiZYzq4nErOrcuYd16DjRDEQ?=
 =?us-ascii?Q?7P2hoFP2Jn5R1u/DtgPsuvLKEzLqEnP4dlLFEyKpVb4xiuwvJgKBsxChADAU?=
 =?us-ascii?Q?tolHVv2AzMmRy4wuRvrVWHxNqfHTSE5ee5tt5m1BcBqbh0ymiR2CQVi/MSNn?=
 =?us-ascii?Q?1dS2rBiKR5PlZx4kdUXnlh2rIolNUuqF2/bNPq/d6pQ9IJdNd1PSU3LoPE0Y?=
 =?us-ascii?Q?AV7aejFJv49iorwQId1gOLKQtRYi1iRFCvJgoWj2EtY+LPWaRdQAi6RDLxfv?=
 =?us-ascii?Q?AMjyOURC9eq2+k0GZRShJ+66LB24?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WU2KRv8yX4aD+NOWFBWjUqaRH4l5xQVfqD2NgtJfWhzISbuoj0S8ilaMjqW9?=
 =?us-ascii?Q?PHpb3aIkNk8f4tbpTJKjSLjZUDp+O1eC+mlcjLw9yrmMjWI55hJf6yaDFcMQ?=
 =?us-ascii?Q?ReWFPvWg7JFYRY8TxbauzOrSRuOP3g9jzI8c+h62unwd8sYDvY4KforzoNqt?=
 =?us-ascii?Q?V+DVqM81dOpVPz0ZaF2a0G1ac6sdYhgudExAtJ98u6+1Vk+TxKC5sUz7WY4n?=
 =?us-ascii?Q?3oogxDneYak5sGm8qp4HuPrNkM3MzwMz17/y9GwPHgv9tOCP+4UFaqZcVLz1?=
 =?us-ascii?Q?bj0G0G4ow393OSvCbSyFmZ6Le9QYGYUR7xEmnjyA1gTniuNrRmB1Tgcac85A?=
 =?us-ascii?Q?rukij8IYicqvMdFYhSobNWrWkZfYvRmbKF8Dg31STRw0TgY6fLGrfjhE1RKV?=
 =?us-ascii?Q?8IDgGRb4E68EDUd3TBhhH64DnJw3MhpT1oPJ0hUcWZxfqWI+y44d+qVYl3N6?=
 =?us-ascii?Q?cILNwkef+cwrkeE9TN0x77u4tl44sfL2r0IYRoALQUk3b285LlUctqamtzGk?=
 =?us-ascii?Q?VLUE0yHxUhXtXf4QCspMO6Y8l4shbCWVp73naw3qCK/L93EmTsolfmFqF7G7?=
 =?us-ascii?Q?SdqJRNixX5IV4eBEq/tQPTQAgV4Nswz0K7KFNVs3l716psHWLJkyWEu53PPB?=
 =?us-ascii?Q?NMyWH8sG0z44iXHnU2Ob64wQBmtMjyVU9kCydFbbO6pG0E+/YOzP9pgiYd1X?=
 =?us-ascii?Q?U4x4T8EWAWz0qtRJMfHGSRk6Z+Y+34D/N0p/kq/LgCktsET4gj+ZOHFLqdYZ?=
 =?us-ascii?Q?OMrUf5RFslelchnLL0sbDRDG0KAZ0OCVMv8audBcKckuNJBpjjjU4fpvEBMq?=
 =?us-ascii?Q?N0t9UoaRRIIwr1rxx04sl8dCCibM8eEu1BbErzSjGmlRaCbPA9mQOLeGcNik?=
 =?us-ascii?Q?47/V8kiCg4wqMOGHwbijqqxiwFGexVu7Qc07nZHiu0sI507Y1CH3pftbmEVI?=
 =?us-ascii?Q?33rMmdqXE0cXwvYt2dCU3P9+nhemT6xjQf4nQHyTXFCTc6FzR2CE4T1u6wyj?=
 =?us-ascii?Q?e4hWX8dBizKJMQ+saP95M9XYMns71LRQ4H+78wdubCWSunHkS0AWE/KDc9Us?=
 =?us-ascii?Q?JYYy6UxOSHINhI0QopNNTMWjQtAylRZedL1rY9xNAO6popDPpUvOLJIfkMqX?=
 =?us-ascii?Q?w6n5EzrjSrLNLF4l322UITyO5DvwpYx0QTIkX8j6MItPcJLAWq/VLzhkZNkh?=
 =?us-ascii?Q?CQXkMlNotQ1Y3d6LZksuKxesZpwmzsHgmENFIUn/eR7k2DO98GKwLP/VkgAj?=
 =?us-ascii?Q?SCprpZG7yr/r2lJJ+TuG0xdYwgKwUff8XM44/a/RKuuWUsV1Cozfi/JrPqSd?=
 =?us-ascii?Q?lLxbvZACBpc1DOBDjJUFsHXvACt/FF+bE7YAHCMxdG07AmbtdHpVzIHMUWS5?=
 =?us-ascii?Q?StRRkoIQZcxr4MNBUO6+Vijcug2bY46/jYuPGoGymekxuJOdvLB4FEVBf1Tp?=
 =?us-ascii?Q?k9eyEhihp1aK4zPRryAAMg4SM/0bO9UKm9H3TlLU1JichLF/VnC5i2T0T3l0?=
 =?us-ascii?Q?goB4aYCSOQNfNq3jjFjqqLMg1rwhhvMIF3Te/jKS9EqvWSO75YV2ObaElQn7?=
 =?us-ascii?Q?kyrHROQBA+4CTTD7xdL/KOVgqhAFq+5aicVy7jUsfq4szlODRByRuHw/9rcL?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef19fa24-b5cd-48da-0851-08dd44820d32
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 18:39:11.6140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vZJGlcoBl0CnjeecFfFltHCSGDsyRUa3RHmzpVMkeNeUycj7rMAmahkrm+lz0HrIhCH/j7cqXkFWg7r0LXjSk1BQbMZk6He+zD4ANDMKTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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

On Fri, Jan 31, 2025 at 02:31:33PM -0800, Lucas De Marchi wrote:
>Mixing style with goto and devm_add_action_or_reset() is very confusing
>and error prone. Clean that up. The only missing one is one of the
>display calls, but that can be done in parallel to the review of these
>first patches.
>
>This received limited load/unload tests on LNL and may very well not be
>100%.

Yeah, got this from CI for bind/unbind in LNL:

<1> [384.198034] BUG: unable to handle page fault for address: 0000000000002458
<1> [384.198049] #PF: supervisor read access in kernel mode
<1> [384.198053] #PF: error_code(0x0000) - not-present page
<6> [384.198056] PGD 0 P4D 0 
<4> [384.198061] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
<4> [384.198066] CPU: 1 UID: 0 PID: 8477 Comm: core_hotunplug Not tainted 6.13.0-xe+ #1
<4> [384.198071] Hardware name: Intel Corporation Lunar Lake Client Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3222.D97.2411281331 11/28/2024
<4> [384.198077] RIP: 0010:xe_gsc_proxy_component_unbind+0x10/0x60 [xe]
...
<4> [384.198235] Call Trace:
<4> [384.198237]  <TASK>
<4> [384.198239]  ? show_regs+0x6c/0x80
<4> [384.198248]  ? __die+0x24/0x80
<4> [384.198250]  ? page_fault_oops+0x175/0x5d0
<4> [384.198256]  ? do_user_addr_fault+0x4c6/0x9d0
<4> [384.198260]  ? exc_page_fault+0x8a/0x2e0
<4> [384.198266]  ? asm_exc_page_fault+0x27/0x30
<4> [384.198275]  ? xe_gsc_proxy_component_unbind+0x10/0x60 [xe]
<4> [384.198338]  component_unbind+0x4a/0x80
<4> [384.198343]  component_unbind_all+0xc2/0xd0
<4> [384.198349]  mei_component_master_unbind+0x21/0x40 [mei_gsc_proxy]
<4> [384.198352]  take_down_aggregate_device+0x32/0x60
<4> [384.198355]  component_del+0x99/0x140
<4> [384.198358]  xe_gsc_proxy_remove+0xd8/0x100 [xe]
<4> [384.198417]  xe_gsc_remove+0xe/0x20 [xe]
<4> [384.198474]  xe_uc_remove+0x15/0x20 [xe]
<4> [384.198570]  xe_gt_remove+0x26/0x70 [xe]

I will try to reproduce it and understand the gsc sequence here.

Lucas De Marchi

>
>Lucas De Marchi (7):
>  drm/xe: Fix xe_display_fini() calls
>  drm/xe: Fix error handling in xe_irq_install()
>  drm/xe: Fix xe_tile_init_noalloc() error propagation
>  drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
>  drm/xe: Cleanup unwind of gt initialization
>  drm/xe: Cleanup extra calls to  xe_hw_fence_irq_finish()
>  drm/xe: Move oa fini to xe_oa
>
> drivers/gpu/drm/xe/display/xe_display.c | 22 +++++-----
> drivers/gpu/drm/xe/display/xe_display.h |  2 -
> drivers/gpu/drm/xe/xe_device.c          | 53 ++++++++-----------------
> drivers/gpu/drm/xe/xe_gt.c              | 52 ++++++++++--------------
> drivers/gpu/drm/xe/xe_gt.h              |  1 -
> drivers/gpu/drm/xe/xe_irq.c             | 14 +------
> drivers/gpu/drm/xe/xe_oa.c              | 48 +++++++++++-----------
> drivers/gpu/drm/xe/xe_oa.h              |  1 -
> drivers/gpu/drm/xe/xe_tile.c            |  4 +-
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c  | 17 ++++----
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h  |  2 +-
> 11 files changed, 86 insertions(+), 130 deletions(-)
>
>-- 
>2.48.0
>
