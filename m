Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE273CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 15:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7981C10E7AF;
	Wed, 27 Aug 2025 15:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyWXSsBY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7463C10E85C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756308601; x=1787844601;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lPnh5JvqfW8i1qdMY30GTJLrFT5DA8AOxEavPpN1blA=;
 b=SyWXSsBYkBX66gnrmblHTQDPUAoF0mmZW4xZyrLBWU5hrElQEihdxSE5
 ytfG9vuo9jkBcBeNuIIRvN4FfrlhN1qXDfjI6ieYF0MKDlhcVD6k2v7PX
 6ziu9RHxK7+3VDJPjzs06Pw+Y6d8rKLrgqnpZCTPuTDYqJ8dMjTBHaS6p
 9h4R2FizZykdp5fTjQKx4Em+Y3rbb2Nly3dDEIDV3LHhVO23J0Rw8xnzP
 RcJjFYEqszjF6P7WWkOW02P9tA5Gkwszaq9f7tU2hLIjSU1EabHiWhcBj
 vyt+x0gktAiJAJ5krJ4miDYvsms+/AZ5UYrUD/kfAzrwKOSw9l3y7Qi6m g==;
X-CSE-ConnectionGUID: bKcyA3n/RtWN837Wg9RjRg==
X-CSE-MsgGUID: AH4cL6ixRje1WP/kPp6onQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57584190"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57584190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 08:30:01 -0700
X-CSE-ConnectionGUID: TU8oDv5nRa2CWhSnW52O3A==
X-CSE-MsgGUID: qtF6US6nQrSxMP3enbYx/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200764597"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 08:30:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 08:30:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 08:30:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.83) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 08:29:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvKNmJHfRL+g3OaqnVBx/03vzxGw+ELUauonoc1rZpwyfuA5ERcyA2IyphJpZNDR/iPCEVvh0IMjuUtV4QRHFpY5QHDCQOqdePNwQ+rTpxpaDMsG7FE7Pa0eF3S9YDGe3EITfxZuI6OIkmv2P7zHYXmXTHAoiNTzlYggdJ/uKXxk2Aou47/QObxyvyZMsbdrswUhpniOxHwYUfaTeFHQuBF+al86QyMPhrHE35vBl+99B/tEKsUdc1xJHhrXrbLyh3johyJvotNIzmomK+jNzLsqZTKotlLBXMIcMygIKJ2yPKLurQY5FqMAdQGL/w1zxH2a/wkEFpgIULc7pvqEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RktkSWmQ9ap1H6gTphjRCbY2RQoNTxE6cGEO+8AocYg=;
 b=vTOs4oDAQ8xBPudMDc2eTEHILXC0yKbXP7SKluYf+VXVkS+aXk/vbP+2iMdY3HbzDy+8nEP4OEwCep4jyqKLekXenbAzKY9o4wqCV+CVhTH25RWaDV+TOox1YLWTsCoGR71X70T2iVkaAwSYsBQ5bx3nKOw4uh1DvltFMgqWs1pB21MlO0S8OqQvKZuTCZIRLpqrtlJADd76Q1U+gzn2qhvBaLksp+fnspOCJ5P1PLlYt/WXqYMiJaP8y9E4KOTPyHJrIy/XcnQLDw1grXmlGFKi120tkpwh1I2ENIi4LElZEenr91EnR1VXgpSaeb0Nc96Cap7zv2WPDUJPQGkQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB6896.namprd11.prod.outlook.com (2603:10b6:806:2bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Wed, 27 Aug
 2025 15:29:57 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 15:29:57 +0000
Date: Wed, 27 Aug 2025 17:29:46 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Message-ID: <aK8kauwpALcoSxwr@fdugast-desk>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806062242.1090416-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR08CA0260.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::33) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd7be1d-819e-4f91-cf76-08dde57e9424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlRBTVVhUGFiVHNwQ2Y5aHJoZCtBUExXSFB5UmFWSGZURnpNYWdlRTdIWWxn?=
 =?utf-8?B?dzRoc3B2eUI3VHJDUm1NaEJ2ZkJvdjd3akdtTWZmOXE3WGIrQm5SY0U5N2xK?=
 =?utf-8?B?OGhsZENwSnlRUmdRUFJDWWFRSG83TmVDQW5IdDVPcHhBcHd2NWR5cksrMUlk?=
 =?utf-8?B?NzExUVNqeTl0MGhGTjFrSnZaRDV6RUZkSk1TLzNZcjZjcEh5bFlwZWJaZ2di?=
 =?utf-8?B?b0xYUkc0WGhxN3RKamJIMG13bFhCV0YwVi8vMUdQNldaOU4wUDdJU3FKa1JM?=
 =?utf-8?B?U0JXa1NzQTF5K2lFcmV6SkdqeUZnVllOK3V1cVR6NDNJaENqMmtUUmVWM3ND?=
 =?utf-8?B?RjBnaHFoeGVjNHB0d3pvSlB0Z0Z5Mm9IdzQwNHJuS0VqTUowbklyWmdvNUhO?=
 =?utf-8?B?NGhGUU04VTUzWDlHTlMvL2FhU0VyZEduNEJEMlBZR05oNnQwdHZjWDVoREla?=
 =?utf-8?B?RjlMcUpXMVUyUXBXcXFnSTRXNjdJVnBmTXJPTnhpSzZROHA1dG5mTXJTNHMv?=
 =?utf-8?B?V3puZXdnenYxTk9hLzJZWU0wS0U5WGhYOE0rL0MwbVNpTnNiY1dDekJaK0xm?=
 =?utf-8?B?UEtVY1NoQ1hlWjZwVEFTRDV4RjYvdDZ1a21mcU5ET3NUdFArNkpETENuNm1p?=
 =?utf-8?B?Z0xmR0pWc2lKWUVESHRNeFo2UjJpY3hZWjNra3VlMFYwSk5mbXQ4cmhrcmhL?=
 =?utf-8?B?TXhyMEpUUmZsa1hsSnYrTWMyV0hYd2M5c1p0MWZZZTNLWFF4dGhSQWs2Mmhp?=
 =?utf-8?B?Vkk4R2lDOHdJNW8yRnBZNEx1aDNKVW11NzVhcVdoRHFvOTU0am5mRmw1ajdK?=
 =?utf-8?B?d0J3bnMxWjdvSUtUOFNoR1pWdUFPc3lvRHBvYTIwNlpEQ3lWckROZ0NNdjZ1?=
 =?utf-8?B?MEpKQ1ZSTXVQdzFNbzh1QWFGVnAzOWcweTFRUURSc0NXdGVZb29xQWR2MFJm?=
 =?utf-8?B?allJVlZTWHpPMTdscVBvN0t0QUVuaGx5MWFOemJtb1Q1YmJKZUU3T0xFem8x?=
 =?utf-8?B?cFZZOVd3Z1ZmM3IzUDZLeHRTejZXR0w4cjZQTG4vNkMxNWpEdGNHUi8rV1FC?=
 =?utf-8?B?SFBOYm8rQ2ErL0JqdFlVWTZoVE9RdjQvMVQwRXBQcUo0LzNaR2JFYkZndWJi?=
 =?utf-8?B?emNqcVR2VkxjQ3BwbjNjYTlnSmFnaklBRmZRQzNKYWFCdytGSDlxU3ZjMWZX?=
 =?utf-8?B?WFNYbUk5VWhFK2IrWURHM3Z2bGFXdWJQRDhlTVVBVnd2Wk1zalZ0Z3oweFZB?=
 =?utf-8?B?TU1BZHQ1dzM0NHQ4cDhPb004dzRkT3VKMnN5MUFCRjE2UDNTa09jLzhremZi?=
 =?utf-8?B?N1VSdVFvL2xEUndscEh4ZjNiQTRJU095Wm5tUzdyVEtLelo4NXhKa1k0amF4?=
 =?utf-8?B?UVBvWXRGenpsY3d0MUNRYTdlL0NBKy84WWl1Y2ZBb0pONzQ3ZWw5cUxCQmJV?=
 =?utf-8?B?MjQ5bUdkMXJwamlxRFRNYkt3TTJWNVpQVGJwRkNYcWRxUmZQdDJkeW50Vnli?=
 =?utf-8?B?aXI0RXNNSUtiZlJrcTJrZ3FNa29HdkM1Uk12M2ZZdGMvN1VtYkEzaEVjS2Nq?=
 =?utf-8?B?azdvcFVZQ0VvbzdzaGYvaitFYXlOSHBPUW1xSStsbjZHV2I5UkF2bWtCdElT?=
 =?utf-8?B?ejZkWUxyOFlZV3VUWDNEcFRxZ1RYYk83dldxRkw4U3M1OFIzQVZQMjZDT3Zx?=
 =?utf-8?B?aVp6TFJ3WHZBVERjenhGNTB6Q0JudjB2bGw2Q0Y0enRlaEsyWnlSd08yTGdJ?=
 =?utf-8?B?MnFDWWJMVXBHcjUzQVllVDFobXZSMHJudWtlZWN4ZXdRTFdRMzM1QjFqSVhj?=
 =?utf-8?B?YVk1MW9oN016QWF4QXFJcElTT1ZEcUc3SWhOVTNhdEdUNHRlWTB3c0RoMzVj?=
 =?utf-8?B?K2hPbmV5SVhtRldxK244UjQyK01mUTNZZko2aHF0V210d2hqeWxCMFNvMEUz?=
 =?utf-8?Q?hoO2AyX/GNc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk9uaW0vdU9CTXhWWGI0Y3VEc2YwVkdnVlBLYTBjYWc5OEVWQTdnN1MyQ215?=
 =?utf-8?B?bXRLYWxtSTRjaFJOVGhwSEF4NVpBWDlWaUZqS2RaZFEvNWMvalNvS280UDhI?=
 =?utf-8?B?OWNCZlFycmxSMDF1ci90RjY4WUhlQm1XenNEZy9TcWYzS1RKbGJyOElYbmx0?=
 =?utf-8?B?dUQ0VFRmV3AyZmhUZ3UyNFVDd3BuMWx2dTF0TWl6amZ2QXdKYURBeXE5THNu?=
 =?utf-8?B?REVKbDl0ODB6NTFTQ21PQzk2b3Frd3VkaUxkaTlKR0xkNW93RGMzMTVFVFFE?=
 =?utf-8?B?N296QVJEaDNoTlg5SXZyMG5pU3dkMDRwSElYREUwZ0VDR0x5NUw2MnlDVG5k?=
 =?utf-8?B?bXVpNUNQVWdKWHNZYXFxSTRZMm5oeWw3SFE1TWdXWllCNlA1WVZvMHhQY1Z5?=
 =?utf-8?B?ZHRQa1g4cVZjVUVBYVpCT1lVUWdBVDV1SGhPNEZNTmlyTmtEVWc0Q1pHbHRo?=
 =?utf-8?B?YmJKbVNQN1JvUkVoelhUWGJCNnpHN2p5VVhRemZQbUJmLzlyNGg1cWtKQnVu?=
 =?utf-8?B?K1gxVTFjdFlJNGVlZkFCSldXQ1IzRml5akM1dlByOWFJVmxlR1poQnBad2hy?=
 =?utf-8?B?Z2NJNVFPbW83WFQxQmFtSjEzS3dxdnc4R0psY3RyRTgxMmdQRnlkQ0NJcHAx?=
 =?utf-8?B?cTZHRzFwcXJtVkRXSkNqMnF1MGE2Rm5wK1FZUDF3bWxQMGsvbUk4T3EyMXhj?=
 =?utf-8?B?Y1dIS2ZSSHhRRE9ZekJlZ1hQSkZCdFo2V0FIc0VpYXYrQnAwM2d2MFkvNnVN?=
 =?utf-8?B?NjRJdGN0dVJHdmRpUjhyT2N2cndWc1VIUHBna1U4dFhpMlFNTlB6Y1VlenBE?=
 =?utf-8?B?eVc4bGVmamJFcHpZSmEzZlk5U1hyVXJnQnJIZHNPQXIySUZwSmVVdVNZOUFZ?=
 =?utf-8?B?Q1FJQWtTMngvT2Q5TjVJWmhlbzZpeTlqZ2lnQ0kzOHVyK2ZjdTB3OUp5cEo5?=
 =?utf-8?B?U2FqVkplMGdoK2JqNDhkOXpET1Z0MUNHR3h5UThwOG5EVU1BMWxjMkdBZmsx?=
 =?utf-8?B?OXRRdW1kTnpxdDNmamdSYlIxdTU3TzU2bG95ZzRpM1FpdFFMM2tsR3JVci81?=
 =?utf-8?B?dlFNMWJyWmNUQlZCT0V2TTVnNlN0OGhrbmxwSmdVYUxyWVc0bzR0NHJOOUZ2?=
 =?utf-8?B?aURHQjFtM25CRHpMc05rN0FoNU9GV0FSaHQxQ1ZQZWV6VnRwczB4SU0wM0Nu?=
 =?utf-8?B?VUVwN3Z6M0MwcE96STJNaXlZRGdsQmVKWHVLRWl1SkQ5TXBlclYwYk0rQWVj?=
 =?utf-8?B?clhWZXRxOTlhVkZhbXFNWko2MWNjMDUrWVdWN05JeTBoa3Nhd3JFeE9Ddkhh?=
 =?utf-8?B?QXFRRThhQ3JxVWZUZXBCbzV6RHhNMlk5WitwVjZpTmlaSTZtSnJPTGEweGVy?=
 =?utf-8?B?eGlkSUF2T1ZaWmdqMmdGbkVtdDJhYmdralBsWXhuYXdOa1dkak5ObjQ0Qy9K?=
 =?utf-8?B?U24vbUpBZUxVUTdrT1QycUlJek4wcGJnOTFXYlErSGZIR3RjZmk2Wk51RXpn?=
 =?utf-8?B?T0U5TE5RNlBRUG4xdG4vbmJvZlI3VjNzM3V1ckNzSitWVTlMandkd2tkOEhH?=
 =?utf-8?B?RWFwVEM1bEpSNkwzTFBaSS9jUTNrTzJxV080SllxRmo3cWFRTmpPYm4vNkVq?=
 =?utf-8?B?Q2lqbWtWRVErN0VPb3JvTlYwS2l1cnFKdWo1eTFrdk9uWFBDT21Oc0VScFZ1?=
 =?utf-8?B?K0RoMUtIVnBoUndRL0tMUms0a2xVZlhUdk1aeWtVRU9Bblc1N3EzZ2ZuZktx?=
 =?utf-8?B?WWRPSUhxNkVJNzdVeTdMYVp4Y25DUFQ2b2diOE5HS2pIUGFsaC9leUdqbTNj?=
 =?utf-8?B?TjJlY0pya1lxejVqUWxIOE1Ta29sc0wrZkdBVHRnMWNuZ1I5UHhQZDJPRExh?=
 =?utf-8?B?VEJ5aExkUFZpRTlXWkFPc2lLdnZjdVlBNWxHTkxxc0ZSOFlYYm15a0JURWUr?=
 =?utf-8?B?KzJVQ0xlWE1JRHJidXZmSzlZekpsRW5QNGN0dWpuRzNJeUFob2VlYnF1QitY?=
 =?utf-8?B?ODhETk5CaktYZTJJQnpPaitMMTh6dlkrbVhuV2dEckdQS21ZWTV4S3laalRB?=
 =?utf-8?B?V29zeW5qT2dtVEhtQ25XWFdtOEExUDZVK3RvbUc4d2R4RjQ2cmpkK294M1BW?=
 =?utf-8?B?RUdlSFU4ME9RZTlhOHIyM2tkVUMzbGcvZC9yUnQ0WUVOdkk4VzdibWJWd2d4?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd7be1d-819e-4f91-cf76-08dde57e9424
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 15:29:57.4518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HeJIS1gelVhceVdobtyEjVzr3RbnbojILSH1UCSOjiOw3f6TZ32yZA2ihLROu/lzIXLTNPAKf0rvHONej3QzQO2rzige6GeHCMDv0ZwcYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6896
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

On Tue, Aug 05, 2025 at 11:22:32PM -0700, Matthew Brost wrote:
> Stub out the new page fault layer and add kernel documentation. This is
> intended as a replacement for the GT page fault layer, enabling multiple
> producers to hook into a shared page fault consumer interface.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile             |   1 +
>  drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
>  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 125 ++++++++++++++++++++++++
>  4 files changed, 208 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757..6fbebafe79c9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
>  	xe_nvm.o \
>  	xe_oa.o \
>  	xe_observation.o \
> +	xe_pagefault.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> new file mode 100644
> index 000000000000..3ce0e8d74b9d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_pagefault.h"
> +#include "xe_pagefault_types.h"
> +
> +/**
> + * DOC: Xe page faults
> + *
> + * Xe page faults are handled in two layers. The producer layer interacts with
> + * hardware or firmware to receive and parse faults into struct xe_pagefault,
> + * then forwards them to the consumer. The consumer layer services the faults
> + * (e.g., memory migration, page table updates) and acknowledges the result back
> + * to the producer, which then forwards the results to the hardware or firmware.
> + * The consumer uses a page fault queue sized to absorb all potential faults and
> + * a multi-threaded worker to process them. Multiple producers are supported,
> + * with a single shared consumer.

I am not through with the series yet but xe_pagefault seems to be the
consumer code only, while the producer code will be located elsewhere
such as in xe_guc*. If so, might be good to write it here or in the
functions below.

> + */
> +
> +/**
> + * xe_pagefault_init() - Page fault init
> + * @xe: xe device instance
> + *
> + * Initialize Xe page fault state. Must be done after reading fuses.
> + *
> + * Return: 0 on Success, errno on failure
> + */
> +int xe_pagefault_init(struct xe_device *xe)
> +{
> +	/* TODO - implement */
> +	return 0;
> +}
> +
> +/**
> + * xe_pagefault_reset() - Page fault reset for a GT
> + * @xe: xe device instance
> + * @gt: GT being reset
> + *
> + * Reset the Xe page fault state for a GT; that is, squash any pending faults on
> + * the GT.
> + */
> +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> +{
> +	/* TODO - implement */
> +}
> +
> +/**
> + * xe_pagefault_handler() - Page fault handler
> + * @xe: xe device instance
> + * @pf: Page fault
> + *
> + * Sink the page fault to a queue (i.e., a memory buffer) and queue a worker to
> + * service it. Safe to be called from IRQ or process context. Reclaim safe.
> + *
> + * Return: 0 on success, errno on failure
> + */
> +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> +{
> +	/* TODO - implement */
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> new file mode 100644
> index 000000000000..bd0cdf9ed37f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PAGEFAULT_H_
> +#define _XE_PAGEFAULT_H_
> +
> +struct xe_device;
> +struct xe_gt;
> +struct xe_pagefault;
> +
> +int xe_pagefault_init(struct xe_device *xe);
> +
> +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> +
> +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> new file mode 100644
> index 000000000000..fcff84f93dd8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -0,0 +1,125 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PAGEFAULT_TYPES_H_
> +#define _XE_PAGEFAULT_TYPES_H_
> +
> +#include <linux/workqueue.h>
> +
> +struct xe_pagefault;
> +struct xe_gt;
> +
> +/** enum xe_pagefault_access_type - Xe page fault access type */
> +enum xe_pagefault_access_type {
> +	/** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> +	XE_PAGEFAULT_ACCESS_TYPE_READ	= 0,
> +	/** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> +	XE_PAGEFAULT_ACCESS_TYPE_WRITE	= 1,
> +	/** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
> +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC	= 2,
> +};
> +
> +/** enum xe_pagefault_type - Xe page fault type */
> +enum xe_pagefault_type {
> +	/** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> +	XE_PAGEFAULT_TYPE_NOT_PRESENT		= 0,
> +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
> +	XE_PAGEFAULT_WRITE_ACCESS_VIOLATION	= 1,
> +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic access violation */
> +	XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION	= 2,
> +};
> +
> +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> +struct xe_pagefault_ops {
> +	/**
> +	 * @ack_fault: Ack fault
> +	 * @pf: Page fault
> +	 * @err: Error state of fault
> +	 *
> +	 * Page fault producer receives acknowledgment from the consumer and
> +	 * sends the result to the HW/FW interface.
> +	 */
> +	void (*ack_fault)(struct xe_pagefault *pf, int err);
> +};
> +
> +/**
> + * struct xe_pagefault - Xe page fault
> + *
> + * Generic page fault structure for communication between producer and consumer.
> + * Carefully sized to be 64 bytes.
> + */
> +struct xe_pagefault {
> +	/**
> +	 * @gt: GT of fault
> +	 *
> +	 * XXX: We may want to decouple the GT from individual faults, as it's
> +	 * unclear whether future platforms will always have a GT for all page
> +	 * fault producers. Internally, the GT is used for stats, identifying
> +	 * the appropriate VRAM region, and locating the migration queue.
> +	 * Leaving this as-is for now, but we can revisit later to see if we
> +	 * can convert it to use the Xe device pointer instead.
> +	 */
> +	struct xe_gt *gt;
> +	/**
> +	 * @consumer: State for the software handling the fault. Populated by
> +	 * the producer and may be modified by the consumer to communicate
> +	 * information back to the producer upon fault acknowledgment.
> +	 */
> +	struct {
> +		/** @consumer.page_addr: address of page fault */
> +		u64 page_addr;
> +		/** @consumer.asid: address space ID */
> +		u32 asid;
> +		/** @consumer.access_type: access type */
> +		u8 access_type;

For type safety we shoud use enum xe_pagefault_access_type instead of u8.

> +		/** @consumer.fault_type: fault type */
> +		u8 fault_type;

Same here with enum xe_pagefault_type instead of u8.

> +#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> +		/** @consumer.fault_level: fault level */
> +		u8 fault_level;
> +		/** @consumer.engine_class: engine class */
> +		u8 engine_class;
> +		/** consumer.reserved: reserved bits for future expansion */
> +		u64 reserved;
> +	} consumer;
> +	/**
> +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> +	 * by the producer and should not be modified—or even inspected—by the
> +	 * consumer, except for calling operations.
> +	 */
> +	struct {
> +		/** @producer.private: private pointer */
> +		void *private;
> +		/** @producer.ops: operations */
> +		const struct xe_pagefault_ops *ops;
> +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW	4
> +		/**
> +		 * producer.msg: page fault message, used by producer in fault

s/producer.msg/@producer.msg/

> +		 * acknowledgement to formulate response to HW/FW interface.

s/acknowledgement/acknowledgment/

> +		 */
> +		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];

It is clear from patch #6 why it is more convenient to have this in
struct xe_pagefault rather than local to the producer but this seems
to go a bit against the elegant abstraction provided by this new page
fault layers. producer.private could store a struct with {guc,msg}
but that is probably overengineering so up to you.

Francois

> +	} producer;
> +};
> +
> +/** struct xe_pagefault_queue: Xe pagefault queue (consumer) */
> +struct xe_pagefault_queue {
> +	/**
> +	 * @data: Data in queue containing struct xe_pagefault, protected by
> +	 * @lock
> +	 */
> +	void *data;
> +	/** @size: Size of queue in bytes */
> +	u32 size;
> +	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
> +	u32 head;
> +	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
> +	u32 tail;
> +	/** @lock: protects page fault queue */
> +	spinlock_t lock;
> +	/** @worker: to process page faults */
> +	struct work_struct worker;
> +};
> +
> +#endif
> -- 
> 2.34.1
> 
