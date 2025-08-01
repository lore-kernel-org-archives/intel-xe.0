Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40492C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 11:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046A910E837;
	Fri,  1 Aug 2025 11:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdkzBC/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C35110E837
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 11:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754047560; x=1785583560;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=krkRPn//rdMIi1vgt5Z8CfI1FLiOi1+lJkixcwmLoo4=;
 b=JdkzBC/NbvBJo1bjNZFM4sLN8vRW80qFOOjXdQjtP6UTjHwhU0cPys7L
 WG59PX3NXd0j0DPyI+9O6WKExmqQy+yzhJr/VqhEMw6WXyf/2qBKNYn0a
 meJ6x/q9Un4XrkZ0+HlZlMAQJvsQvc8p7605UZ32bedOOJlBIa5f8IDDX
 FpdioVXkGEySvsx0LQoQnCrFdGBGluPnEl7Rl1E/vJ+NHp2/mPJEz8Fod
 f+YzJxb/JQNRX7NEDfUDj4lRNf31lrCmMZvSChu7YGIIrutNhQfkXialx
 AB2n6z/MJcchx9dqgCiBLgjCmkL3kPpvMrABjAPuSLAMpKVU1mqgSimDb g==;
X-CSE-ConnectionGUID: 5+sDalWuS4+5XpDPwrUyog==
X-CSE-MsgGUID: J9u/BxwQQse0MFss1xVbuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56536346"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56536346"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 04:26:00 -0700
X-CSE-ConnectionGUID: ukQyKvo/T3yuSXy7HEiKXw==
X-CSE-MsgGUID: DSEXnlxeQ1WKaklVScmXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="200698234"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 04:26:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 04:25:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 04:25:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 04:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHWhJXATgyOizr4e+ywhPZkyGwCtj09yVq9IIT15y6hcz2ywxWQRRud940mIne+gU8k0pqleKwFwT6F+MN8GeL+3S0DqhO391VvEBuZ/ZwISghefcGWU3fTo8ZXY1R6xNrWFx/uIkr2TshHvWTLxppFZCatpdzH/ESOg0YYeXHUsF7NE/nmw5LGzwRWsUpk5Z80CmxTUfC85boTyjWhiTKfljmpCfzY9cEc6rG+ExxFXjituGG4eFlubqtgzvWZwnHEB+6EiOZSy3lFZ5GH4EX0lto0L3xq+W+kQV+0lVzJcRgMELJ5pN7IElqQYFKIXbLrlvn3UR2SpTc3PtMEOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F02jFssvDeSag6P8uSmlJZFbMN9bOdXit2czk7b1pjQ=;
 b=yIcB3Gy98T2D26V7GSkRig9c/nS9NWuoWk036Gmo7zxAHZp3Dx0jO2SC8zE7kt7jcH/vhNddbjUVoGN6nnc+F31TOJcAuPqMpPREHa3uguiX3CCzS5+ezcsBGXY63Aef0+N+GTLQOupkMwBxOTHiaDimNSMR2ZyOZITQLGyXBsPpBgHp7tlmsQTgBye5GTrlSTpyv2QLa9zxq9vBJOEbnjwy7mU6iffHKprNxbr5PCGEAH0EVrCGfPCWWGl9utUCqugnkQ9HXpomM8v37wP6jJRGS63cOOHmYSdnnIbpby9NjW1jDfNay36YrI/LF+gIu4qD2CzRLYm2FDcYddlWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 11:25:15 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 11:25:15 +0000
Date: Fri, 1 Aug 2025 13:25:13 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
Message-ID: <20250801112513.skwhz3lnyaqavu6e@intel.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730174913.178434-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0309.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 38dd1269-3c48-4bc7-7879-08ddd0ee1683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enZWSkJDcWZIYk9YcjdHeU44WDBsNWNndG1zcjRDK3R4K0R0SjA0dGNOaW5l?=
 =?utf-8?B?Vm15cmM4akp0SUlTYkR4ajE4N3ZqVEt6d0N6eTErYUtERGxvWkNrSmhSaWRV?=
 =?utf-8?B?Q0JmdHVkMWIyWktUSG9tZHZsbWZzTEdEdWNESDZ6Nnk3YmlsSlo3MmNoUnFn?=
 =?utf-8?B?MVJ6ckJpR1lkNXZxb3FFWk81YmxmN3RSMUp6MysxRzB5QnRoSGpuSDFKUm1j?=
 =?utf-8?B?R1N3SVlMOEt2WkRodzIvaTNlVHpxVEVCdVBvVlI1RXhGYTN5YTZIQVN3U1JF?=
 =?utf-8?B?VnB3eDJCY1NRTVRIMkM4Q3YzS1ZCMGVFdDcxRHFIeVZlZWRMcHMyUFlrb0Jn?=
 =?utf-8?B?UkNJS0pvRzdJNjZiY2dSSWhTWk1FdFU5azc2NHZBalVtWHkyTndyc1hxUWhp?=
 =?utf-8?B?MGlMOGpuTTRpLzJVSUx0UUhZMHlGa0JhQkl3Mlh5U0FWclpveFprOE9GZFFO?=
 =?utf-8?B?Uk1pZ01Uc3FWenNPZjVTY2drR1BRNzFzMFFKSmppZHdXZ1JlaTVpWmpuVk9V?=
 =?utf-8?B?VUppaTBQLzRmT015SmVpN090VC94YyswQW14SWRvekNDbG5YeHhCdGl3dEVy?=
 =?utf-8?B?ZGdYRTdRci96WG9kVFJqRnNrd1o1cGxZakp4OUFYMWxlbDRnTUdhZG1SaEtx?=
 =?utf-8?B?cHhnbk5DcTFKbG9mWjltbzM1b1NUYkpYRkFkRmF4bmVvUGUyV2xKMGZmUkIx?=
 =?utf-8?B?a01ac2tSaWlLenkwenB4aXVjY2hLR2FzZ21iVzdvRnc0emFINU41RWFQVVJ3?=
 =?utf-8?B?NGQvMnhiOW1ZQmVtKzdKT3FrMGpYa2RFVEtPem5aVCtNVkNwSE1BdEtrd1Z0?=
 =?utf-8?B?RlNCaWsrZVB0eWxvbUd3dmN5M3ZXRWdaR2J0S0hTbTRTZ3J2N2QxcDBQNmQr?=
 =?utf-8?B?SUxyck1iL3ArckdxTk83WVQzZjd6OGJMVC9weStHbUljdHM1MFNKY0M2aWlw?=
 =?utf-8?B?eTkvQmRwbVdiYjlhbnhyY2FmZ2JXdmI0ZjU5aVRQQ0d0cjJHM291UGhPeTNu?=
 =?utf-8?B?ZWZYS2M2OVJOVXNONWQxYzg5cVhoWmRNOHI2Sy81bEJHcnlmVzdWK0FmUmhu?=
 =?utf-8?B?aC9pMFlMQzRTMUQwRzhaSkpwT2NPVXJlbWFwQmJPUDd6cU1kZ01zSGZJWW5n?=
 =?utf-8?B?Z2NqSlVPUGl3Sy9YVzFpamYvL3JMSVB1dTJPb2JxdW96eEczUXc2WHhXTEc3?=
 =?utf-8?B?Ky9hckpLbjZjb2dZTENRc2lKV25iMjdJV2gvY2VLK1B1ZzJ1UGc0R25YN2k4?=
 =?utf-8?B?RnJiZ1dUdmF0cmZ5SUJnZE5KV0pNZDRtSG93M09tcGtHcXNNdFZwTCtBRDBi?=
 =?utf-8?B?c3hCblo4RDZSSTlhUWlSZkZxWi9yV3VSQ0c4dDlzcjM4SGtyYlJnanVPcmsz?=
 =?utf-8?B?bXg4dWFmTmNMdng2a3N6Vm00SURMd0JYd1haQU0rUUpmUGh5YUFyNTFrM1ha?=
 =?utf-8?B?S0NzL0tKd0ZMVVUvb1ZsWEp4aCtnVGxPeEtQUHZOYXAxNHFuWGxrN2I5c0NJ?=
 =?utf-8?B?SGxSU0grK3dwOEszTDlRb0pVVU1zbjdpN1huQllaa2EzaW9kZTFwOWROQ0Rx?=
 =?utf-8?B?bm51MHQ2Tm5yZW5EdWtIMHZ5S3VvMW5FeE44dmpFMm4wZm9IWVh3azRYTVds?=
 =?utf-8?B?eHdJTkZZNWlHWjU0UGZCNmNPa09Ka0FjczVEMFhFOTI2TnBmMUlGWS81WDBz?=
 =?utf-8?B?ZVVqVFo0WW1pYlBWd0ErbUN2YmdRR1d5QTE5QUtpSncvMW9XTlBwQ2M4V0dP?=
 =?utf-8?B?QjY4WGp3VWJvVis4Rm1xM2wzK0NIdWRScVphQjlyTGVhMVd0aVlJNWZXZ05r?=
 =?utf-8?B?cUordlZldU5Xc3U5RnRHb1VZUUo3SFBHcjl4eHJRM1hYbi90cG1iU0JZSkZu?=
 =?utf-8?B?cG9oU2tHMjRYVjFYdHIwSFFDY200UlJUS2dSRnlWK2ZOZ1FMY3d5K2VRQ21N?=
 =?utf-8?Q?Jq+1Z7AQKu4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJBZ3NHVHFQMVdXZlRJaUV2YlZ6Z000UkNIZnI5UFdObmx1T1dDb3kvM2Fq?=
 =?utf-8?B?M0tQKzdVMHBUajBzQjlSTk4va2NMWG5PUEM3blJTOWNnbDNHbGRYQnVXdGRZ?=
 =?utf-8?B?eENjWFQyVEtwSUo0UmhRRytNNW1WN011c0RtMTdySElXUHlOMWRnOEdTTDN5?=
 =?utf-8?B?cTd0WE5xcXJvUGp6WmYxSDEzVXIzVjJ1OFJJU3VOdUFUYkNDSG9sSkRvVUdm?=
 =?utf-8?B?U0pibjZDSnBHMGZ0WWdCSXB6YXI5Z2N5Y1JER0JUeHZSTVVyNlY4VE5jY1ZY?=
 =?utf-8?B?WUNEMW5xS3pmYlV2TFFjbjNFdVBzMFNNdzlhcDRYaDl3bVN5ZnlLME54dzhM?=
 =?utf-8?B?V0djZ3Z4UFV1K3FqN3FKa1RjRzlEOERzNWwwQy9XV1RDZ005aWRyY3hxL0Y1?=
 =?utf-8?B?MzBIditXa1p6a3FndDVsek9yRE13eVZ3WjFOWWYrbGwwL2hkeEtRUDNxWnlk?=
 =?utf-8?B?dnVsRzdpQ2JvUkJ3TGdNV2l1RzU3UlJVZVZaWllReXRPU1BKSFBWeEVCNk11?=
 =?utf-8?B?cWFTdzU3TnV4dXJnNjh6ZG1FZDBGMDZWMit5U3ZGbzlkZC9NcTZjSWhuWUR1?=
 =?utf-8?B?WjlwbVFHcXFGSDhVSmxiWEZBTy9hSU12RTJLZkhuZ2tVZWIyWmkrUEZzZXpq?=
 =?utf-8?B?WDQrVktKTXJRS2FIZUFFTjVKQzNPWTJQWkY3czdQYmVyMFBkU2xMRGpHUFdK?=
 =?utf-8?B?OExGekdvTkxLZTEzaStpRmxOVjZDMFc0WkRwd1NRNnh5UVgrclYyL05xSFh2?=
 =?utf-8?B?cEJjeU5ETzBNUFQ0YW1NY3VBSzByR1NCV0EwdG1QcDdQVWhLY3pXT09ZdlZk?=
 =?utf-8?B?cytTRzYzcTlJL1J5MkQ4SW1JOFlPeEFCMEdBdlRvcjFkQnNpMTZGSXVsSE1x?=
 =?utf-8?B?QXgrYkEwdjd6NkNFYzdaRThxM3h5ZEFZY1EvZmZHMFY0WjlENU9zWUlVYUpn?=
 =?utf-8?B?N1phTUZMYzBNTWtpcVNHc0R6djJaR21UK3hJb1pZN3RyMENoeHQ4OGVJbFA1?=
 =?utf-8?B?UHdtajJZR2lUMXRPWTE4dk9SbzJnTmx5YmpXcDVmTVovSFhYNnp1UGM0VVZI?=
 =?utf-8?B?T3ZxSVRvcDB6eDAwaHBxbFBBLzRCL1ltNGZvQlgyS3BzeXllK0srTkthc1FV?=
 =?utf-8?B?azB4NGIyZjVjZ0F4SEhjb0ZpSVVJWk5icklrVlp1dFM0K0xRV1JVRHF3bFY5?=
 =?utf-8?B?ZDYzYzh4QUpFSkYvcm83NlRQbC9GR1c0QU9vR1AwREdVNmFTWDNLRjE3a1M3?=
 =?utf-8?B?SzY4QWdLK2RNTGRIU09lelZySTVhVXdSQXhzcVFwdGJVOFNjbXM0enh4dFFR?=
 =?utf-8?B?Sm5HUDhTN0RsWkMwMHBiRlI4bHRabzA4WlNTZHNrdTdzVTN1eEZEM2JoM1Zh?=
 =?utf-8?B?U0F0YUhpbWJaWWJMN1hSaTRJbjBBZEFydWVHeEc4eXVFRG1HSXNpZUhzbi9l?=
 =?utf-8?B?cTRIK3hCTUN1ZVlsVGhnbkJhREo4U2tBN2RRVjRNN2lncUFHbHZoa2djN1BE?=
 =?utf-8?B?ZC96WllOYk5nZDY1aXd2a0wzbXR0Tk1TcFV4Zm5kdWJ4OTNLVmdwZFQ3WnFV?=
 =?utf-8?B?N1E2M3FpZE93N3JQSEdKeDJLcjRkWGMxTm43ZE01ZWJXd3I0SkFoeEJ0RjQ4?=
 =?utf-8?B?QlRkdGFYTFNKeFZsc3lNYllNVmdhbml3L0hKbCtldVR6Q1lpQm9aVHI1ckxG?=
 =?utf-8?B?cXVaczZLL1VhZHpnTHZyZk9JVHo1M0hCOFFzTDlZZ2JiU0k3V0c4KzFaTzcr?=
 =?utf-8?B?MzVKZmdTdXhadVlEOElDbzJNOVVhVk1CYzVrU1FRTE5qZWVlOGk3VUtqQUZ2?=
 =?utf-8?B?NEh3R0ZwWklPeVpUZGYrK2t2ZjdyWStXQk5yOHZBaklKQ1FiY1RQWGpHd3lT?=
 =?utf-8?B?Wncvdm5Eb095NWIxZEM1SDdsVUloNEhsS25PRlRRTkRxWjFiRExjU3Nzc2pG?=
 =?utf-8?B?RlNwcnM1K09JTC93OWM3c2ZaNitNa1lmMXlzSVd4ZnJJT0o3blNTWExiVnEw?=
 =?utf-8?B?TG1MNFBzbEJvSStUeWVHdmQvajhDY0xobE1UazFxSGEwZGZCWHZsdU93RWY4?=
 =?utf-8?B?a01xVkJCeTdmWElrNWFrbnQweVJnUmJXaUo2NXliNDhuZVM2YUdYT2xMYmJo?=
 =?utf-8?B?eld0U3hhcklKT3YxU1V5dytRRWI4NXJaV0F1dTlxVXZxSTdNT2dZdzJrUkc5?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38dd1269-3c48-4bc7-7879-08ddd0ee1683
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 11:25:15.6810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzOHNDE4RyO99Fylm6Bl4/O0KE7X53JhIk4xuYOlsTAfcU52yDWcNCxed8/3yMND4/B99bVaKRInHRkJucbQ4pVZ0POX2E6VA2+kOplhUnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6541
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lip-30 19:49:12 +0200]:
> The PF driver might be resumed just to configure VFs, but since
> it is doing some asynchronous GuC reconfigurations after fresh
> reset, we should wait until all pending works are completed.
> 
> This is especially important in case of LMEM provisioning, since
> we also need to update the LMTT and send invalidation requests
> to all GuCs, which are expected to be already in the VGT mode.
> 
> Fixes: 68ae022278a1 ("drm/xe/pf: Force GuC virtualization mode")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 28 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 ++-
>  drivers/gpu/drm/xe/xe_pci_sriov.c           |  7 +++++-
>  drivers/gpu/drm/xe/xe_sriov_pf.c            | 27 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h            |  1 +
>  6 files changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 2761319fdc26..8bc7d7f9f47a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -16,6 +16,7 @@
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_guc_submit.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  
> @@ -258,3 +259,30 @@ void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>  {
>  	pf_queue_restart(gt);
>  }
> +
> +static bool pf_flush_restart(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	return flush_work(&gt->sriov.pf.workers.restart);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_wait_ready() - Wait until per-GT PF SR-IOV support is ready.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
> +{
> +	/* don't wait if there is another ongoing reset */
> +	if (xe_guc_read_stopped(&gt->uc.guc))
> +		return -EBUSY;
> +
> +	if (pf_flush_restart(gt))
> +		xe_gt_sriov_dbg_verbose(gt, "ready after restart\n");
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index e2b2ff8132dc..e7fde3f9937a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -11,6 +11,7 @@ struct xe_gt;
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
>  int xe_gt_sriov_pf_init(struct xe_gt *gt);
> +int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt);
>  void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index bf679b21f485..3ed245e04d0c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_pm.h"
> +#include "xe_sriov_pf.h"
>  
>  /*
>   *      /sys/kernel/debug/dri/0/
> @@ -205,7 +206,8 @@ static int CONFIG##_set(void *data, u64 val)					\
>  		return -EOVERFLOW;						\
>  										\
>  	xe_pm_runtime_get(xe);							\
> -	err = xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
> +	err = xe_sriov_pf_wait_ready(xe) ?:					\
> +	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
>  	xe_pm_runtime_put(xe);							\
>  										\
>  	return err;								\
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 27b148eab49c..af05db07162e 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -16,6 +16,7 @@
>  #include "xe_pci_sriov.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_printk.h"
>  
> @@ -154,6 +155,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	xe_assert(xe, num_vfs <= total_vfs);
>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
>  
> +	err = xe_sriov_pf_wait_ready(xe);
> +	if (err)
> +		goto out;
> +
>  	/*
>  	 * We must hold additional reference to the runtime PM to keep PF in D0
>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
> @@ -191,7 +196,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  failed:
>  	pf_unprovision_vfs(xe, num_vfs);
>  	xe_pm_runtime_put(xe);
> -
> +out:
>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>  			num_vfs, str_plural(num_vfs), ERR_PTR(err));
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index afbdd894bd6e..7e8f3d3ac656 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -9,6 +9,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_gt_sriov_pf.h"
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> @@ -102,6 +103,32 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>  	return 0;
>  }
>  
> +/**
> + * xe_sriov_pf_wait_ready() - Wait until PF is ready to operate.
> + * @xe: the &xe_device to test
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_wait_ready(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int err = 0;
> +
> +	if (xe_device_wedged(xe))
> +		return -ECANCELED;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_wait_ready(gt);
> +		if (err)
> +			break;
> +	}
> +
> +	return err;
> +}
> +
>  /**
>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>   * @xe: the &xe_device to print info from
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> index c392c3fcf085..e3b34f8f5e04 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -15,6 +15,7 @@ struct xe_device;
>  #ifdef CONFIG_PCI_IOV
>  bool xe_sriov_pf_readiness(struct xe_device *xe);
>  int xe_sriov_pf_init_early(struct xe_device *xe);
> +int xe_sriov_pf_wait_ready(struct xe_device *xe);
>  void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>  #else

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.47.1
> 

-- 
