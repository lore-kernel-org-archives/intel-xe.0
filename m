Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7246C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 11:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8378010EC71;
	Thu, 16 May 2024 11:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWCtZhSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C8F10EC71
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715858717; x=1747394717;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/+v9FMgC8dbT/SD8EBRwmimAe32i5QXVch6wY08Q9pk=;
 b=PWCtZhSEqoUBJ2Qlw4UFphgiBfbLCi1OUe34n/xYBAeRT11obRz6GIPS
 zRYmgAcxxqTqc33XuezBRAS8TdIfaakpZSnT2g/GjdTIB/fIXWoL/xEz/
 mZdueomf5tjXkAlMiceHDDtERlXw2oafC5mw5eg8x0WjyeWy43aPUPSQX
 q29G+C2IdzndM8uIMdw8gHCktzEjdr6tTidsB/QT+QVNTYGFf0CIqjpp2
 DvKDDMoBnqyv6U12WYSdkWRZRFQOJaMoprqLI7XuN0QnRkyM4zPbw8xCL
 RckhI7JQ2wFoQsoM+V0k5VA50j26WfE6Gb3DASwpNcobEVsFaQQHkZbXF Q==;
X-CSE-ConnectionGUID: aVYqA9X7QYiV5Y5KEPiKkQ==
X-CSE-MsgGUID: GvTi+GOiRQCncrFo2g6MuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11795268"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="11795268"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:25:16 -0700
X-CSE-ConnectionGUID: fa4Kn9yMTiefzhHwLZW3Pw==
X-CSE-MsgGUID: gs/rZt09Qt6iuvnLGXCYTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="36182209"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 04:25:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 04:25:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 04:25:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 04:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vqmi23OtEnOGBSojvvWMlgGSYbhGBUXcUGtZaGILpJAyexmqtZPl7RnQBUkihYTXtsUWE+4f94lVb85FNvL2GF48UjjRw/5v7OXLgTRJYaPpldANIuCRGKO3b5h/8iMyF8iSlxKmjrObYmHdJGy1RRHMdJjl+bdYZ5+Btkcl61eSCgg3oIMovUEmJRoedtkq9linFPv/8L9cePQlSvNKcUdL4Pky8ROgbqiesuTfcUqPhuNBnxAePrR7e+ywyGxu4Yu1PikOQ3OoglihCfDuHbka6cFntkCEyf/ejTlcandjpb0yeWqhSpkUzi6pT0Kd+eWcV9LECauw4hxO8myHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCjAB4eNINPxSf6VyM3vYN7wTIeeXNPRNQAOyhcyX+0=;
 b=Ikja5/nTFDm3scR5Jmb6O8DwmFGKywzqFQFmkDChgekwNTFg5+GvXTj2gUCHjP3fpn63os+PPIVE6RZXl7EW73xMoTXERu2CWtsuBwovIikDW7PN5BJuT/KOD5x/twXQL1UZ7l/DtbyZjkDHNELX8jXI6uvzDNUeUWDy8K4PaEHkIaULaMr6fk9ZXq8eo99AA3Cgs0sgAouGbjBuK6oO2rEs0IDT71kW/0HZfDdzYrs7qEh4ZRurk1k+zHHiKadtBnNvhYkf44bQ07OKh7eo6IwgFR+U7csIQ7YCRLHkYM4kzNfFSFpz4RbyWvhPqhMADcrLh/4rBS1G8eSAfvDinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Thu, 16 May
 2024 11:25:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7544.052; Thu, 16 May 2024
 11:25:13 +0000
Date: Thu, 16 May 2024 13:25:11 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/6] drm/xe/vf: Add support for VF to query its
 configuration
Message-ID: <20240516112511.wrjvfwlcac7eoybl@intel.com>
References: <20240516110546.2216-1-michal.wajdeczko@intel.com>
 <20240516110546.2216-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240516110546.2216-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6986b7-4f0b-439c-f0ec-08dc759ada8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVNqblF4c3VOOC82RTJXdnAyVFNvenJ4d21MZmRZWVZCUjNLWlVnTDhQcGNS?=
 =?utf-8?B?NndHaHpDQVplNTdYdVlOZC9HNmVnKzJjbSs2VTE2QXdhVVBlak5hdW5SYS91?=
 =?utf-8?B?NUhEVmVuRTQ5UFF3STBkNEMycWV0UHBsM083VmpycTlVanlEZWRVaC9BbUxJ?=
 =?utf-8?B?VnR6VEhLNEg1R1ZwamdsSmU5di81NS9BQWI5ek9Ecy9vYjlIVVFldzNmYnpU?=
 =?utf-8?B?dWpNOFFMeFZ4cUd4N3FtUmpZVkZsRzg4bVBGOUdUcFRObytlT1Fqck5mbSs2?=
 =?utf-8?B?M1NUSXA5aXdiNjQ3MGRRUFVaSzA2bDI3NmpVMld2dWxDZVZoMENaY3h2Qkly?=
 =?utf-8?B?OXJLZHlzMjhvTVpRL3pNeXVFYmlyL2VEMjYzUEs4MVE2NkpSTldheStjRXIy?=
 =?utf-8?B?Z25aMmU0YU9wSzIwREExY3ptTCtpMFU4S2psai9wQUZMdmJGSGdjQUtIOVY4?=
 =?utf-8?B?cGJGa0M0L0lSY3VoeWVEUWNsY1dWSCtYTjBnVkRtNzBCc3RLN2t4VVZ2RHdH?=
 =?utf-8?B?K2l4ODY0YzlQcXloR2V1YW1XOEhXeWU4WThlUWpReDdNWDRpeXlhcDdIcHZw?=
 =?utf-8?B?TVhNaDducjBjL0NjSUdCeVdwMnJReXptNlhreHh3eDdMbkRTTjRqa0JkVklM?=
 =?utf-8?B?SmtGSjdNNHo2T3FwTnVqdVoxOGhFVitRZnJOWmY1VEdZbG5KK3ZIOW1VdHA5?=
 =?utf-8?B?OHVKOVNuTWhhOGZTZVg3aEFvSXI4UFJkQTA0Y3NNODBxRjRpN1B1ekJpQ2k3?=
 =?utf-8?B?ZTk4T25jRFhUWGNtcDc2NUd4UmN0OENNMzIvb01RdUhOYlNUVHltNXUxbXlY?=
 =?utf-8?B?c282bkUwbWFzRDVsZDZRMVdEcmd1U0M1SGNxdGsyUUtTU0VGNlJhZW93L2F4?=
 =?utf-8?B?ZUhtOFg1NXI1QXU0TllwZGN1L0NhM3lGQTQraXYwS1FKZnlWUW11MXpQaFNU?=
 =?utf-8?B?SE1GbzBYTm54MGd1LytVaUtEMW82bHhJcHVvWUcrVGRYTDc4ZzNlUysyVUw1?=
 =?utf-8?B?K0lteWt3K3ZzcHdrN1Z3RDkwVVJBU09EckJNWHBaSVVsOVFOZ3p3L25sVFZK?=
 =?utf-8?B?NUZCZHRZRk1wTCt2Y1lrMENWaEFVaTh3UUozS1hOckdTTlZHVERXZ3U2Z0tJ?=
 =?utf-8?B?SDkvODZHdEd0b0I4ZHdJaXEvdTN0bTBOdkZWM3pCQW1meGJIbHRlazFsbEht?=
 =?utf-8?B?Szk3c0lVK1JVcTlCdHpzVktPVmRJeE9oUGVQMzBOSWE1enhvU3psWEhaZEVS?=
 =?utf-8?B?c2JLZnZJeWN5RkNTQWx2cGUzTXZsbDN2RWw1ai9sbDhFMFcrSXJCWmNoeGZG?=
 =?utf-8?B?cE5MaTVDZk8ycjltLzZzZTJxL21jcEVBUFV0bTBpOFNRRUxWL25HYVp2dE15?=
 =?utf-8?B?RzdTQmwvY1lMN1lEUEdZeGNZek44KzhGMkM3WEc1dWQ4QTc5c2ZvSkNNcTBt?=
 =?utf-8?B?V1lNV2JxSmVuTktoRGs5aGZnU2VZSXFHUVpmZUtZU2s5dmZaNGQ4cjdXTEtq?=
 =?utf-8?B?eU8yZ2xFRE5iTjcrblMxR1FQcSs5UWFleXkyWGozU3BmaUpTdW5FSURCQ1JX?=
 =?utf-8?B?dEg3VnNJVFp2Q2RhaTJqY205V21JVG1zNGx6aXREN2lKS1E2ZFI4STdNMmt0?=
 =?utf-8?B?UUx5TjU4bjFQa0hLcGpmOFdzeDg4MWZjbkpxRml5dVdGMjVuQVNXV2djeXRR?=
 =?utf-8?B?NUlhRUtuYWlIR3k4Qmp1RDVQR2lJeS9MT1BwK2szSEVFVlEyNE10T0JnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzR0L1pLWC9LVnYwdDZMelNJa2VlREpwVXZ6cWo4SWpEZVRoRUNFejd2c0gr?=
 =?utf-8?B?SDBFMElKcnkwUkx2TllsNzkxZjZ1UE1GWmRDZmREaEVEcDEyOU43dG9lSWMw?=
 =?utf-8?B?b3RxNTNOSjFKeUVBZEE1dGhzYnVzRXpzWDloZ1EwLzUwUjg1MmJlZEkvK0hV?=
 =?utf-8?B?Wit0UExqVlNkdVFLQmRnZittQUsvdHEwMHRVRjcyOFN3OTZvZWNaTnFIQjFG?=
 =?utf-8?B?WkdBTW81VjhyajFleTI0YkNXdnZubkxvSnMwL0xzYS9pSzNUVmRvQmtmT0o3?=
 =?utf-8?B?d0dUa2tiYTR1U1l4am1qUVlHVWxoMjVsU2FXRXVHeStVelBCR3hhWUpWRTJH?=
 =?utf-8?B?NmV0NnlUNkZZcldVNmNvWWpBcWtkOWdTdHlkVHc2VHRGSTdidGxleFlJL3Vp?=
 =?utf-8?B?N0lld3lwZGtQWkVBSFVqT2JwNlRnTmNhbXVjMFN1M3hoa01iZXRnNlJzWHor?=
 =?utf-8?B?QVBNdk9mZHdhM0gwaUU5WjFuM2pqY3RselhXUVNLL3dPbTlleklNNHNFaU1J?=
 =?utf-8?B?R0VqU203djZXemxuZ3ROb3ZOLzFyNWRhK29UVHFQU0daUjZ5cmFPQW55SUpC?=
 =?utf-8?B?RlBQL2tIRS9Xcm4vaDM3cVlkclJCSkMrMHdlVzJBMk5NbzAvMC9UNlVmU2Ji?=
 =?utf-8?B?Wmp0YUU3d2ZpeXJ0bm85REw2U05kYk44czhUb3k4MTJDYVNQYzZvcGdWdFdH?=
 =?utf-8?B?RXArcncxY1kvM1JNOTV4TXlVMXl6OHJNMnAxOCtnaTFpWWVlUmk5MVBNS0c0?=
 =?utf-8?B?TE9tZlloSVp6Z0JkSk1YSDBQOE52VjBBeng2ajgwVXh5UUNDcEZpeE9hWkZn?=
 =?utf-8?B?eEpyajYweHh6a29FdVB3eEZvNXVTOENRblBtM0xFbFU1N0xKUjhiVFFNaDJR?=
 =?utf-8?B?SHlDWkxaQTg1UkwxcWFoRy8wQ3h0b0o2enduU29tZ0FyVVUxU2FxaklMWE12?=
 =?utf-8?B?UUE0VzlBS3JhazJBM0FmUTEwN3hrR3dqUlIxMTkzL0RNSDNnb2FOZ2VrSjRS?=
 =?utf-8?B?Z1J0TjVxWGFRNXVJcm5DVVNWLzhFMDRNMjIrdDFFWkxIMWtEYkwwN1IxRStG?=
 =?utf-8?B?MkV0c3JqNk1oS2FwemFFUjE5a1dZNm9BNzZ6TVovQWdEODY0NlFPdkV3NXd2?=
 =?utf-8?B?L3dlVi9wTEZWUEoxVTU5WmZwRmVuaWI3K3lrZzJzYmxJTjZYNG5MeU9RQVY0?=
 =?utf-8?B?OUlhaVIxNjFHOWVjVGlpU09Pbm52ckFmbGNLdFFuZGVBUXhWbHFNbnR4K2NE?=
 =?utf-8?B?dVg3Nk5MYnVycVhMZWl4VmdzUWFpR1U1VFYwSThna3BiZWN0ZUE1dXZIaVVi?=
 =?utf-8?B?VmZST3UyR011NEZHb2djUHo4UEFhdERRWWNLbExxZDcrOENWKzFLTzI2eEpq?=
 =?utf-8?B?dTYwbGxsWTdSMmV2TkJ1VmpUUFZVSWlId0oyT0p4ODBCaFpUVlNQN1dQUVFU?=
 =?utf-8?B?QmpId3paVjF1bHE4L01jWUhxb0V0RHRpaFBCS2ZoaU90Mm1GM0JLNkdjckZC?=
 =?utf-8?B?c3loQ09mNHRIaDFvVkhGbHZybmM4SjNzbnFhRXlZR0MyT1orMXBwU2JwRHMy?=
 =?utf-8?B?WWZOTXJ5ODJ4aVFseENPSVBDZ1hUSzg2RHZidmdyS3VOZnA1dDE5c0N4RjB1?=
 =?utf-8?B?OHNScFFSTFBZTUFJdVBIN1hhb0s3YVhhU1c5bitiMXFoYkNNSWVqTE9BR3lq?=
 =?utf-8?B?Q3BCenN1YkNIbEVBN1Y5N0x6bk52K1FuL1MrVnZzT1R6UUJEejR0YnJVcnlk?=
 =?utf-8?B?OUptVjYybExHek5uNVBPdEdtWm1XMXI1OFZBNXRzeXhKSlNPcTVrVmZ2ZE55?=
 =?utf-8?B?ZjQ0RlcwM1hWbmhYQlZodWRPeVozMHh0Zno4aTVjcVJBdG5SMW1DUUJJNHlt?=
 =?utf-8?B?RkY2eGdYNlkwbXBpR2hVdlM4N01rRWZ6WkZ4cUpWVWkvUFZJZlE4M0tsVFJB?=
 =?utf-8?B?NnJKUWUvWkljb0J1Vk5WREVzMytMNjBhWWpzRFVIUEVhZ0pneXB1TzZVL25m?=
 =?utf-8?B?N3BKbUVEb2x6MHBKeVBWUWlCZklneDJMdXFHWjlOaFBMRVk5ZmZKRnpyVSs2?=
 =?utf-8?B?NC9VWWJrSkFxaWpXK3RlRTBiUE9VOGM3amVQYnU2SFdBUzhXVkR3STdndnE3?=
 =?utf-8?B?NEp5VHJqZW5veDJhRmg3N3JscXU2c0YveXdhOGZVb1V0c01LYTdLQUk1cW5N?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6986b7-4f0b-439c-f0ec-08dc759ada8f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 11:25:13.4088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cklLz2wuZB6HGFUuv/9nvlGnBcRx5uVuGhtIcETd+J63I3L7wLIXQSphOACXHN//aSZRhK9JnJJ9bg4+2lorV7FXtSx3pj695J31FqRxWsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-maj-16 13:05:44 +0200]:
> The VF driver doesn't know which GuC firmware was loaded by the PF
> driver and must perform GuC ABI version handshake prior to sending
> any other H2G actions to the GuC to submit workloads.
> 
> The VF driver also doesn't have access to the fuse registers and
> must rely on the runtime info, which includes values of the fuse
> registers, that the PF driver is exposing to the VFs.
> 
> Add functions to cover that functionality. We will use these
> functions in upcoming patches.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: use proper kernel-doc format (Piotr, CI.hooks)
> ---
>  drivers/gpu/drm/xe/Makefile               |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 747 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  23 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  82 +++
>  drivers/gpu/drm/xe/xe_gt_types.h          |   3 +
>  5 files changed, 856 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 38da5a575deb..475d38969a40 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -155,6 +155,7 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
> +	xe_gt_sriov_vf.o \
>  	xe_guc_relay.o \
>  	xe_memirq.o \
>  	xe_sriov.o
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> new file mode 100644
> index 000000000000..378dde5ad4f9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -0,0 +1,747 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_sriov_abi.h"
> +#include "abi/guc_communication_mmio_abi.h"
> +#include "abi/guc_klvs_abi.h"
> +#include "abi/guc_relay_actions_abi.h"
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_gt_sriov_printk.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_gt_sriov_vf_types.h"
> +#include "xe_guc.h"
> +#include "xe_guc_hxg_helpers.h"
> +#include "xe_guc_relay.h"
> +#include "xe_sriov.h"
> +
> +#define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> +
> +static int guc_action_vf_reset(struct xe_guc *guc)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_VF_RESET),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int vf_reset_guc_state(struct xe_gt *gt)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	err = guc_action_vf_reset(guc);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));
> +	return err;
> +}
> +
> +static int guc_action_match_version(struct xe_guc *guc,
> +				    u32 wanted_branch, u32 wanted_major, u32 wanted_minor,
> +				    u32 *branch, u32 *major, u32 *minor, u32 *patch)
> +{
> +	u32 request[VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_MATCH_VERSION),
> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, wanted_branch) |
> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, wanted_major) |
> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, wanted_minor),
> +	};
> +	u32 response[GUC_MAX_MMIO_MSG_LEN];
> +	int ret;
> +
> +	BUILD_BUG_ON(VF2GUC_MATCH_VERSION_RESPONSE_MSG_LEN > GUC_MAX_MMIO_MSG_LEN);
> +
> +	ret = xe_guc_mmio_send_recv(guc, request, ARRAY_SIZE(request), response);
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	if (unlikely(FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ, response[0])))
> +		return -EPROTO;
> +
> +	*branch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
> +	*major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
> +	*minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
> +	*patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
> +
> +	return 0;
> +}
> +
> +static void vf_minimum_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	switch (xe->info.platform) {
> +	case XE_TIGERLAKE ... XE_PVC:
> +		/* 1.1 this is current baseline for Xe driver */
> +		*branch = 0;
> +		*major = 1;
> +		*minor = 1;
> +		break;
> +	default:
> +		/* 1.2 has support for the GMD_ID KLV */
> +		*branch = 0;
> +		*major = 1;
> +		*minor = 2;
> +		break;
> +	}
> +}
> +
> +static void vf_wanted_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
> +{
> +	/* for now it's the same as minimum */
> +	return vf_minimum_guc_version(gt, branch, major, minor);
> +}
> +
> +static int vf_handshake_with_guc(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 wanted_branch, wanted_major, wanted_minor;
> +	u32 branch, major, minor, patch;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	/* select wanted version - prefer previous (if any) */
> +	if (guc_version->major || guc_version->minor) {
> +		wanted_branch = guc_version->branch;
> +		wanted_major = guc_version->major;
> +		wanted_minor = guc_version->minor;
> +	} else {
> +		vf_wanted_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
> +		xe_gt_assert(gt, wanted_major != GUC_VERSION_MAJOR_ANY);
> +	}
> +
> +	err = guc_action_match_version(guc, wanted_branch, wanted_major, wanted_minor,
> +				       &branch, &major, &minor, &patch);
> +	if (unlikely(err))
> +		goto fail;
> +
> +	/* we don't support interface version change */
> +	if ((guc_version->major || guc_version->minor) &&
> +	    (guc_version->branch != branch || guc_version->major != major ||
> +	     guc_version->minor != minor)) {
> +		xe_gt_sriov_err(gt, "New GuC interface version detected: %u.%u.%u.%u\n",
> +				branch, major, minor, patch);
> +		xe_gt_sriov_info(gt, "Previously used version was: %u.%u.%u.%u\n",
> +				 guc_version->branch, guc_version->major,
> +				 guc_version->minor, guc_version->patch);
> +		err = -EREMCHG;
> +		goto fail;
> +	}
> +
> +	/* illegal */
> +	if (major > wanted_major) {
> +		err = -EPROTO;
> +		goto unsupported;
> +	}
> +
> +	/* there's no fallback on major version. */
> +	if (major != wanted_major) {
> +		err = -ENOPKG;
> +		goto unsupported;
> +	}
> +
> +	/* check against minimum version supported by us */
> +	vf_minimum_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
> +	xe_gt_assert(gt, major != GUC_VERSION_MAJOR_ANY);
> +	if (major < wanted_major || (major == wanted_major && minor < wanted_minor)) {
> +		err = -ENOKEY;
> +		goto unsupported;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "using GuC interface version %u.%u.%u.%u\n",
> +			branch, major, minor, patch);
> +
> +	guc_version->branch = branch;
> +	guc_version->major = major;
> +	guc_version->minor = minor;
> +	guc_version->patch = patch;
> +	return 0;
> +
> +unsupported:
> +	xe_gt_sriov_err(gt, "Unsupported GuC version %u.%u.%u.%u (%pe)\n",
> +			branch, major, minor, patch, ERR_PTR(err));
> +fail:
> +	xe_gt_sriov_err(gt, "Unable to confirm GuC version %u.%u (%pe)\n",
> +			wanted_major, wanted_minor, ERR_PTR(err));
> +
> +	/* try again with *any* just to query which version is supported */
> +	if (!guc_action_match_version(guc, GUC_VERSION_BRANCH_ANY,
> +				      GUC_VERSION_MAJOR_ANY, GUC_VERSION_MINOR_ANY,
> +				      &branch, &major, &minor, &patch))
> +		xe_gt_sriov_notice(gt, "GuC reports interface version %u.%u.%u.%u\n",
> +				   branch, major, minor, patch);
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_bootstrap - Query and setup GuC ABI interface version.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + * It requires functional `GuC MMIO based communication`_.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = vf_reset_guc_state(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	err = vf_handshake_with_guc(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
> +				       u32 *value, u32 value_len)
> +{
> +	u32 request[VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV),
> +		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, key),
> +	};
> +	u32 response[GUC_MAX_MMIO_MSG_LEN];
> +	u32 length;
> +	int ret;
> +
> +	BUILD_BUG_ON(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_MAX_LEN > GUC_MAX_MMIO_MSG_LEN);
> +	ret = xe_guc_mmio_send_recv(guc, request, ARRAY_SIZE(request), response);
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	if (unlikely(FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_MBZ, response[0])))
> +		return -EPROTO;
> +
> +	length = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH, response[0]);
> +	if (unlikely(length > value_len))
> +		return -EOVERFLOW;
> +	if (unlikely(length < value_len))
> +		return -ENODATA;
> +
> +	switch (value_len) {
> +	default:
> +		xe_gt_WARN_ON(guc_to_gt(guc), value_len > 3);
> +		fallthrough;
> +	case 3:
> +		value[2] = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_3_VALUE96, response[3]);
> +		fallthrough;
> +	case 2:
> +		value[1] = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64, response[2]);
> +		fallthrough;
> +	case 1:
> +		value[0] = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32, response[1]);
> +		fallthrough;
> +	case 0:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int guc_action_query_single_klv32(struct xe_guc *guc, u32 key, u32 *value32)
> +{
> +	return guc_action_query_single_klv(guc, key, value32, hxg_sizeof(u32));
> +}
> +
> +static int guc_action_query_single_klv64(struct xe_guc *guc, u32 key, u64 *value64)
> +{
> +	u32 value[2];
> +	int err;
> +
> +	err = guc_action_query_single_klv(guc, key, value, hxg_sizeof(value));
> +	if (unlikely(err))
> +		return err;
> +
> +	*value64 = make_u64_from_u32(value[1], value[0]);
> +	return 0;
> +}
> +
> +static int vf_get_ggtt_info(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u64 start, size;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> +	if (unlikely(err))
> +		return err;
> +
> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
> +	if (unlikely(err))
> +		return err;
> +
> +	if (config->ggtt_size && config->ggtt_size != size) {
> +		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
> +				size / SZ_1K, config->ggtt_size / SZ_1K);
> +		return -EREMCHG;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> +				start, start + size - 1, size / SZ_1K);
> +
> +	config->ggtt_base = start;
> +	config->ggtt_size = size;
> +
> +	return config->ggtt_size ? 0 : -ENODATA;
> +}
> +
> +static int vf_get_lmem_info(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_guc *guc = &gt->uc.guc;
> +	char size_str[10];
> +	u64 size;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
> +	if (unlikely(err))
> +		return err;
> +
> +	if (config->lmem_size && config->lmem_size != size) {
> +		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
> +				size / SZ_1M, config->lmem_size / SZ_1M);
> +		return -EREMCHG;
> +	}
> +
> +	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
> +	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
> +
> +	config->lmem_size = size;
> +
> +	return config->lmem_size ? 0 : -ENODATA;
> +}
> +
> +static int vf_get_submission_cfg(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 num_ctxs, num_dbs;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
> +	if (unlikely(err))
> +		return err;
> +
> +	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> +	if (unlikely(err))
> +		return err;
> +
> +	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
> +		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
> +				num_ctxs, config->num_ctxs);
> +		return -EREMCHG;
> +	}
> +	if (config->num_dbs && config->num_dbs != num_dbs) {
> +		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
> +				num_dbs, config->num_dbs);
> +		return -EREMCHG;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> +
> +	config->num_ctxs = num_ctxs;
> +	config->num_dbs = num_dbs;
> +
> +	return config->num_ctxs ? 0 : -ENODATA;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	err = vf_get_ggtt_info(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
> +		err = vf_get_lmem_info(gt);
> +		if (unlikely(err))
> +			return err;
> +	}
> +
> +	err = vf_get_submission_cfg(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> +{
> +	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_RELAY_ACTION_VF2PF_HANDSHAKE),
> +		FIELD_PREP(VF2PF_HANDSHAKE_REQUEST_MSG_1_MAJOR, *major) |
> +		FIELD_PREP(VF2PF_HANDSHAKE_REQUEST_MSG_1_MINOR, *minor),
> +	};
> +	u32 response[VF2PF_HANDSHAKE_RESPONSE_MSG_LEN];
> +	int ret;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	ret = xe_guc_relay_send_to_pf(&gt->uc.guc.relay,
> +				      request, ARRAY_SIZE(request),
> +				      response, ARRAY_SIZE(response));
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	if (unlikely(ret != VF2PF_HANDSHAKE_RESPONSE_MSG_LEN))
> +		return -EPROTO;
> +
> +	if (unlikely(FIELD_GET(VF2PF_HANDSHAKE_RESPONSE_MSG_0_MBZ, response[0])))
> +		return -EPROTO;
> +
> +	*major = FIELD_GET(VF2PF_HANDSHAKE_RESPONSE_MSG_1_MAJOR, response[1]);
> +	*minor = FIELD_GET(VF2PF_HANDSHAKE_RESPONSE_MSG_1_MINOR, response[1]);
> +
> +	return 0;
> +}
> +
> +static void vf_connect_pf(struct xe_gt *gt, u16 major, u16 minor)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	gt->sriov.vf.pf_version.major = major;
> +	gt->sriov.vf.pf_version.minor = minor;
> +}
> +
> +static void vf_disconnect_pf(struct xe_gt *gt)
> +{
> +	vf_connect_pf(gt, 0, 0);
> +}
> +
> +static int vf_handshake_with_pf(struct xe_gt *gt)
> +{
> +	u32 major_wanted = GUC_RELAY_VERSION_LATEST_MAJOR;
> +	u32 minor_wanted = GUC_RELAY_VERSION_LATEST_MINOR;
> +	u32 major = major_wanted, minor = minor_wanted;
> +	int err;
> +
> +	err = relay_action_handshake(gt, &major, &minor);
> +	if (unlikely(err))
> +		goto failed;
> +
> +	if (!major && !minor) {
> +		err = -ENODATA;
> +		goto failed;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "using VF/PF ABI %u.%u\n", major, minor);
> +	vf_connect_pf(gt, major, minor);
> +	return 0;
> +
> +failed:
> +	xe_gt_sriov_err(gt, "Unable to confirm VF/PF ABI version %u.%u (%pe)\n",
> +			major, minor, ERR_PTR(err));
> +	vf_disconnect_pf(gt);
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_connect - Establish connection with the PF driver.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_vf_connect(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = vf_handshake_with_pf(gt);
> +	if (unlikely(err))
> +		goto failed;
> +
> +	return 0;
> +
> +failed:
> +	xe_gt_sriov_err(gt, "Failed to get version info (%pe)\n", ERR_PTR(err));
> +	return err;
> +}
> +
> +static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	return major == gt->sriov.vf.pf_version.major &&
> +	       minor <= gt->sriov.vf.pf_version.minor;
> +}
> +
> +static int vf_prepare_runtime_info(struct xe_gt *gt, unsigned int num_regs)
> +{
> +	struct vf_runtime_reg *regs = gt->sriov.vf.runtime.regs;
> +	unsigned int regs_size = round_up(num_regs, 4);
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +
> +	if (regs) {
> +		if (num_regs <= gt->sriov.vf.runtime.regs_size) {
> +			memset(regs, 0, num_regs * sizeof(*regs));
> +			gt->sriov.vf.runtime.num_regs = num_regs;
> +			return 0;
> +		}
> +
> +		drmm_kfree(&xe->drm, regs);
> +		gt->sriov.vf.runtime.regs = NULL;
> +		gt->sriov.vf.runtime.num_regs = 0;
> +		gt->sriov.vf.runtime.regs_size = 0;
> +	}
> +
> +	regs = drmm_kcalloc(&xe->drm, regs_size, sizeof(*regs), GFP_KERNEL);
> +	if (unlikely(!regs))
> +		return -ENOMEM;
> +
> +	gt->sriov.vf.runtime.regs = regs;
> +	gt->sriov.vf.runtime.num_regs = num_regs;
> +	gt->sriov.vf.runtime.regs_size = regs_size;
> +	return 0;
> +}
> +
> +static int vf_query_runtime_info(struct xe_gt *gt)
> +{
> +	u32 request[VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN];
> +	u32 response[VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + 32]; /* up to 16 regs */
> +	u32 limit = (ARRAY_SIZE(response) - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) / 2;
> +	u32 count, remaining, num, i;
> +	u32 start = 0;
> +	int ret;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, limit);
> +
> +	/* this is part of the 1.0 PF/VF ABI */
> +	if (!vf_is_negotiated(gt, 1, 0))
> +		return -ENOPKG;
> +
> +	request[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		     FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +				GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME) |
> +		     FIELD_PREP(VF2PF_QUERY_RUNTIME_REQUEST_MSG_0_LIMIT, limit);
> +
> +repeat:
> +	request[1] = FIELD_PREP(VF2PF_QUERY_RUNTIME_REQUEST_MSG_1_START, start);
> +	ret = xe_guc_relay_send_to_pf(&gt->uc.guc.relay,
> +				      request, ARRAY_SIZE(request),
> +				      response, ARRAY_SIZE(response));
> +	if (unlikely(ret < 0))
> +		goto failed;
> +
> +	if (unlikely(ret < VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN)) {
> +		ret = -EPROTO;
> +		goto failed;
> +	}
> +	if (unlikely((ret - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) % 2)) {
> +		ret = -EPROTO;
> +		goto failed;
> +	}
> +
> +	num = (ret - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) / 2;
> +	count = FIELD_GET(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_0_COUNT, response[0]);
> +	remaining = FIELD_GET(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_1_REMAINING, response[1]);
> +
> +	xe_gt_sriov_dbg_verbose(gt, "count=%u num=%u ret=%d start=%u remaining=%u\n",
> +				count, num, ret, start, remaining);
> +
> +	if (unlikely(count != num)) {
> +		ret = -EPROTO;
> +		goto failed;
> +	}
> +
> +	if (start == 0) {
> +		ret = vf_prepare_runtime_info(gt, num + remaining);
> +		if (unlikely(ret < 0))
> +			goto failed;
> +	} else if (unlikely(start + num > gt->sriov.vf.runtime.num_regs)) {
> +		ret = -EPROTO;
> +		goto failed;
> +	}
> +
> +	for (i = 0; i < num; ++i) {
> +		struct vf_runtime_reg *reg = &gt->sriov.vf.runtime.regs[start + i];
> +
> +		reg->offset = response[VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + 2 * i];
> +		reg->value = response[VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + 2 * i + 1];
> +	}
> +
> +	if (remaining) {
> +		start += num;
> +		goto repeat;
> +	}
> +
> +	return 0;
> +
> +failed:
> +	vf_prepare_runtime_info(gt, 0);
> +	return ret;
> +}
> +
> +static void vf_show_runtime_info(struct xe_gt *gt)
> +{
> +	struct vf_runtime_reg *vf_regs = gt->sriov.vf.runtime.regs;
> +	unsigned int size = gt->sriov.vf.runtime.num_regs;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	for (; size--; vf_regs++)
> +		xe_gt_sriov_dbg(gt, "runtime(%#x) = %#x\n",
> +				vf_regs->offset, vf_regs->value);
> +}
> +
> +/**
> + * xe_gt_sriov_vf_query_runtime - Query SR-IOV runtime data.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = vf_query_runtime_info(gt);
> +	if (unlikely(err))
> +		goto failed;
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		vf_show_runtime_info(gt);
> +
> +	return 0;
> +
> +failed:
> +	xe_gt_sriov_err(gt, "Failed to get runtime info (%pe)\n",
> +			ERR_PTR(err));
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_print_config - Print VF self config.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * This function is for VF use only.
> + */
> +void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	char buf[10];
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> +		   config->ggtt_base,
> +		   config->ggtt_base + config->ggtt_size - 1);
> +
> +	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> +
> +	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
> +		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> +	}
> +
> +	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> +	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> +}
> +
> +/**
> + * xe_gt_sriov_vf_print_runtime - Print VF's runtime regs received from PF.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * This function is for VF use only.
> + */
> +void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct vf_runtime_reg *vf_regs = gt->sriov.vf.runtime.regs;
> +	unsigned int size = gt->sriov.vf.runtime.num_regs;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	for (; size--; vf_regs++)
> +		drm_printf(p, "%#x = %#x\n", vf_regs->offset, vf_regs->value);
> +}
> +
> +/**
> + * xe_gt_sriov_vf_print_version - Print VF ABI versions.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * This function is for VF use only.
> + */
> +void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
> +	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
> +	u32 branch, major, minor;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	drm_printf(p, "GuC ABI:\n");
> +
> +	vf_minimum_guc_version(gt, &branch, &major, &minor);
> +	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", branch, major, minor);
> +
> +	vf_wanted_guc_version(gt, &branch, &major, &minor);
> +	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", branch, major, minor);
> +
> +	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
> +		   guc_version->branch, guc_version->major,
> +		   guc_version->minor, guc_version->patch);
> +
> +	drm_printf(p, "PF ABI:\n");
> +
> +	drm_printf(p, "\tbase:\t%u.%u\n",
> +		   GUC_RELAY_VERSION_BASE_MAJOR, GUC_RELAY_VERSION_BASE_MINOR);
> +	drm_printf(p, "\twanted:\t%u.%u\n",
> +		   GUC_RELAY_VERSION_LATEST_MAJOR, GUC_RELAY_VERSION_LATEST_MINOR);
> +	drm_printf(p, "\thandshake:\t%u.%u\n",
> +		   pf_version->major, pf_version->minor);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> new file mode 100644
> index 000000000000..997cb7541036
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_VF_H_
> +#define _XE_GT_SRIOV_VF_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +struct xe_gt;
> +
> +int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> +int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> +int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> +
> +void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> new file mode 100644
> index 000000000000..519492f4b7d0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_VF_TYPES_H_
> +#define _XE_GT_SRIOV_VF_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_gt_sriov_vf_guc_version - GuC ABI version details.
> + */
> +struct xe_gt_sriov_vf_guc_version {
> +	/** @branch: branch version. */
> +	u8 branch;
> +	/** @major: major version. */
> +	u8 major;
> +	/** @minor: minor version. */
> +	u8 minor;
> +	/** @patch: patch version. */
> +	u8 patch;
> +};
> +
> +/**
> + * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
> + */
> +struct xe_gt_sriov_vf_relay_version {
> +	/** @major: major version. */
> +	u16 major;
> +	/** @minor: minor version. */
> +	u16 minor;
> +};
> +
> +/**
> + * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
> + */
> +struct xe_gt_sriov_vf_selfconfig {
> +	/** @ggtt_base: assigned base offset of the GGTT region. */
> +	u64 ggtt_base;
> +	/** @ggtt_size: assigned size of the GGTT region. */
> +	u64 ggtt_size;
> +	/** @lmem_size: assigned size of the LMEM. */
> +	u64 lmem_size;
> +	/** @num_ctxs: assigned number of GuC submission context IDs. */
> +	u16 num_ctxs;
> +	/** @num_dbs: assigned number of GuC doorbells IDs. */
> +	u16 num_dbs;
> +};
> +
> +/**
> + * struct xe_gt_sriov_vf_runtime - VF runtime data.
> + */
> +struct xe_gt_sriov_vf_runtime {
> +	/** @regs_size: size of runtime register array. */
> +	u32 regs_size;
> +	/** @num_regs: number of runtime registers in the array. */
> +	u32 num_regs;
> +	/** @regs: pointer to array of register offset/value pairs. */
> +	struct vf_runtime_reg {
> +		/** @regs.offset: register offset. */
> +		u32 offset;
> +		/** @regs.value: register value. */
> +		u32 value;
> +	} *regs;
> +};
> +
> +/**
> + * struct xe_gt_sriov_vf - GT level VF virtualization data.
> + */
> +struct xe_gt_sriov_vf {
> +	/** @guc_version: negotiated GuC ABI version. */
> +	struct xe_gt_sriov_vf_guc_version guc_version;
> +	/** @self_config: resource configurations. */
> +	struct xe_gt_sriov_vf_selfconfig self_config;
> +	/** @pf_version: negotiated VF/PF ABI version. */
> +	struct xe_gt_sriov_vf_relay_version pf_version;
> +	/** @runtime: runtime data retrieved from the PF. */
> +	struct xe_gt_sriov_vf_runtime runtime;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 5a114fc9dde7..475fb58882f1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -9,6 +9,7 @@
>  #include "xe_force_wake_types.h"
>  #include "xe_gt_idle_types.h"
>  #include "xe_gt_sriov_pf_types.h"
> +#include "xe_gt_sriov_vf_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_reg_sr_types.h"
> @@ -143,6 +144,8 @@ struct xe_gt {
>  	union {
>  		/** @sriov.pf: PF data. Valid only if driver is running as PF */
>  		struct xe_gt_sriov_pf pf;
> +		/** @sriov.vf: VF data. Valid only if driver is running as VF */
> +		struct xe_gt_sriov_vf vf;
>  	} sriov;

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  	/**
> -- 
> 2.43.0
> 

-- 
