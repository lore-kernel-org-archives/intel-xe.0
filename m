Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4C4E7716F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 23:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDC510ED8A;
	Wed,  4 Dec 2024 23:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFKDmUT4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79A310ED8A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 23:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733356660; x=1764892660;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=E2kJ/ITUXzuS9XV2wopHPsPm21NpIe49Q2Gn9Cgz35g=;
 b=HFKDmUT42zqqLXSnvDYYG2pmR6Fbp6XjfaoIjIGkJ2c4sRTye7qDbBoI
 y49Mww0Uj0jVVeUUguWjAdv290ucG6TgDkMxAkmkP9EyAdyyTVqAv5DPu
 6su9cV2rbUz27bxuio+TxZ6uGG7KZLdI8OZoVatrzYKzSEUEeBj65wXME
 P2sLz6L++HEGDP2HcQyMYjnGhtCRmZ3DhTA4HAbF2kr/SKjaZ87l6N0yX
 wgc4HnM8XJm4V9PJwjbPSrEpLfSpksoMVYAJnhMo0wot6azOpiBJKBd5H
 fllTavEfG7/Coj3xYXAbQMYLRwln73mDFVi9XbrvnuxTiBkIbbHR84B+8 Q==;
X-CSE-ConnectionGUID: MBUpkfPeR1CrEbI6pCmAAw==
X-CSE-MsgGUID: W3o6BoYyQ92dA+0EP3XnfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33793167"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="33793167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 15:57:40 -0800
X-CSE-ConnectionGUID: busDJt27S6u3Eo/x7/WDhQ==
X-CSE-MsgGUID: XTbdJZQxQVupGPxz9qw+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="131364066"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 15:57:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 15:57:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 15:57:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 15:57:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJn5h36lOk4EC1EOcHPw8UWXn/dLXA1iMJ+nvvwh4U3VtTqMAXz4IuPs08oDzF6dsgwqfSXK+6EURYrYiRT3/CuiBPFAI20iqG+L+27XrSytdesJrKO1i4ETrD057YA4fhE09LmjTfUQwAeexgc9/ni9VwkVnQu7ThA9+KncfHOa7RsZUPNSfyrthLi5TXXkDai2G2Oj2LmgOKBg4X0UWuenhumKPn1ub3zFmr3WMZyeFckV4OMLdyU1PbCjtQiNcuhYwYfd8/58fEQkO8xIe5X83iBs2qfNggU6yKCTumsK8xvpm7cQxvUjFvw2xIswMLmrmkoUd8Qb12yKDm7h7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2kJ/ITUXzuS9XV2wopHPsPm21NpIe49Q2Gn9Cgz35g=;
 b=MQ0vXRIzdABTjQkrbZyuB5miNZpKNxk9/lIMRQ4FZS7leohLecZbQekMLki2i1Mw8xtWrEWIoGccrPyZvgNKVC/ZCsFL8gRLHaSv+YKB6dwguKSc5NNO3+HPQpxGpZ0UFN3wO07I5YYxDZN7adguVvuUXMDX4OHZG3D/OLVvqIHZ0VOnDUTAi94k01XwJYJwQu0V7q12QcU37x7X/1N5wIW09Yla+FrT0rS3mcWn+Y2W9GJ6ZIa+9CjtPi+jO4m43tOvziDhHMUSHr99TfQReruZbGfEPkQssVbnLGXpfqY6vvozzqkT4ZY9jh8Y/RdvaZC1KQlXpao0Ok331otjMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.25; Wed, 4 Dec 2024 23:57:37 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 23:57:36 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBNYWludGVuZW5jZSBv?=
 =?utf-8?B?ZiBkZXZjb3JlZHVtcCA8LT4gR3VDLUVyci1DYXB0dXJlIHBsdW1iaW5nIChy?=
 =?utf-8?Q?ev3)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIE1haW50ZW5lbmNlIG9mIGRl?=
 =?utf-8?Q?vcoredump_<->_GuC-Err-Capture_plumbing_(rev3)?=
Thread-Index: AQHbRc1++Sbm4uiEQ0q6C8kzUwVM87LWxPgA
Date: Wed, 4 Dec 2024 23:57:36 +0000
Message-ID: <5031dcf0c908e3d4922ec854ad5ab89dec1bfa81.camel@intel.com>
References: <20241203174732.3232351-1-alan.previn.teres.alexis@intel.com>
 <173326266776.2159353.5809796838779806711@b555e5b46a47>
In-Reply-To: <173326266776.2159353.5809796838779806711@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7289:EE_
x-ms-office365-filtering-correlation-id: 203ee029-340b-4e30-0a5d-08dd14bf6db8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RDRCbXJScHNOVDlUb1ZaOWNMb0N3dFRCckpNeEVnclVqamt6VWZud1lXNVE5?=
 =?utf-8?B?UXIrcnV1TWYyODV3aklsODR5KzNxWVdnMmJTeTIxb1Q2UlVlai9lVHlXSkFC?=
 =?utf-8?B?VmZPU1B3eituN0V1OEcrVTNsWlJ5STBnQkozRGZ3WTZaRUlILzZRSWxyb290?=
 =?utf-8?B?Nk1tMGhwUGhzRGFXRSt6VnRxN1lKOHFsNWx1bEUvMjg3MEtoUmJVTUlOdTZX?=
 =?utf-8?B?YzJjaTdGU0tuLzNqUGRwaHBqRTVlNUdXUDA2NHNUVjBiYVV0WTFiMzE1aWZ4?=
 =?utf-8?B?QnNPc2tpcE5aSjdlQVhBVk9SdHIrRSs4S0RFZWdEbUpLb2dMZmpqaTZRYmZm?=
 =?utf-8?B?cXh1Tk40S1F2cHRCZXNIN29nc2FhNVRKSkcvd1dramYxeUVTUm03L3VYclNk?=
 =?utf-8?B?ZUJTZzZ2L1VPQzJjbThtMmphQXJzUkJpeHYzdkJQL2dkdjZiMWJiZzZFZWlE?=
 =?utf-8?B?N3RoaHN1ZkZxd2FQR2lXd09ySVE1dlhpMlQyZDZPMjVnUmt4TDJRY3F3Zlds?=
 =?utf-8?B?RUNDQXBId05xRmhtR09SNlRZQU5XNlBNRElzM0pyeC96ZVZMRWZYNk93dzRm?=
 =?utf-8?B?U0dBeWZwYU1qSHQ1V2o1aEhFUitNcjBPK2tIQndWOFRPODB6MDZFcVY5RTZB?=
 =?utf-8?B?NjNpSjV4ckpSdmRMYUVmT0t4NnNPYkRYNnRzRkl4bC9JaW1OOXlRR2EvOXY4?=
 =?utf-8?B?SVJkL01sM1ZQdlRNU2pRN3J4U1dFNEdLQU95WjVJcDdDTFkwa01KbjJxYkx5?=
 =?utf-8?B?c0YrNUpEZmtxaGtCYittUW5QTCtjZ2t1Z29ndXhyV0syeng0MVVZMEZKK0o0?=
 =?utf-8?B?Q0dZZlRpNFFveUZSYlVQSFI4dTlCcjByZkdNTmtHR0haTFpIcnVpNFgvZFEw?=
 =?utf-8?B?V3FsZ1NCRVU3UDlEeVlURHFlS0hWbHhTUDBEN3B2Ly90T3JKM05KU2NCa2hN?=
 =?utf-8?B?eEppTUFtYXV4UDhkRVdyOTVuemo2ZkVObFF4c3BSVmpaL1VsN3JVTHBSdElv?=
 =?utf-8?B?M1c5c2FQYVpBcnJMWTlhbEhYRGp1cHN0R0lpeEZOVzBncklFZVBIdmdSd2tW?=
 =?utf-8?B?YVo1VStWTkZ5YkNFVitGTzZIM3B3eFR3a01YTFVKaSsyZCttZm93dnIwenVX?=
 =?utf-8?B?Sm8vZVF2NEhtUnJ1VUM0T211Qm1PZmhJWEcrdFF0MDZUVktmOXk1U3I0ZWxH?=
 =?utf-8?B?Y1FmY05mU1FFZjdVd1FEU2N2VXVGSXN3RmRoVk9UOTZiYXdzd3pVZnNLSnBW?=
 =?utf-8?B?NzRSc2J1OWoxdWs4a0Y1RHU1M042cGhqUnM1ZTV6WnZha0trK1FOaXV1OTF3?=
 =?utf-8?B?WDY1cHkrNW1jTmh5NWZaZnpieG0vdGFPR2RWeXhyS0tDMWduUmM5a29WREFT?=
 =?utf-8?B?UkFGdWVmRUtjUGNlZlZUcEZDVmtudmJsMGI1ZWFUdnI2WnBBZ0h0Y3R2Q2x0?=
 =?utf-8?B?cE4yQkx4MFVZanlmZjB1MjNhSUhQa1llWnZKMHlmN1R4ZEN5ekw2Z1cxV0lP?=
 =?utf-8?B?Z2xOMjdoQURjZkR6VndkeVlMNHE4dFFLd2lsb2hpYzJ2WWtyZFNPeWVnUkow?=
 =?utf-8?B?MTNpVWJRR3h4UEl3MW5ZZy9OQXdDRHVJc3FMZG80SWRnczlMaW4ya0JLSkYx?=
 =?utf-8?B?QzZSdFYwNzd6cnllYVkxajhROVN4Vm13d01sYXlRWDBaODlGZHVMYlljdjl4?=
 =?utf-8?B?bjVhS0l6NjkrVlhtUEl3YjI0dDlETVNvUTZWcnh4eU1CcXNLUG5rdmtoN3gz?=
 =?utf-8?B?QlJNSHNGZHZjLzg0Z1hSbko5WisxNUJ0ZEROSjVnYUJXY1lvNGZ0WUFmVUVp?=
 =?utf-8?Q?BdOtBadVOKdseFd685cv9DFIqUDqWQto/tOSU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFQySmFaVGd6VU51bHVXNTBERHBuNnlUVGJuREg0c0pTRUluVGtCWDNlTXhy?=
 =?utf-8?B?c3VzcUZIYUlTdjdWZHV3UGFKVUVEQkh6UnZRRDA4bW40N05HRkNCU0dlajdY?=
 =?utf-8?B?eWdEbkFRem5NMFJLK2ZLVzVudFI0bUNMZTNkMFEyUm1wYTVMbzVEamlSNTRs?=
 =?utf-8?B?cHVTdkxiSmV3YnMwenlHcm84SU5Qa0VxNEkvUlZLVjE4dVNoWVZRVHdMK0hv?=
 =?utf-8?B?MlV2QWdNU01hU3Z4NjN5RFFwSUJqY0dXMHkrTGwydXA4V29HNGIveDFXcFov?=
 =?utf-8?B?Z2JOeGhER3Y3RWpYTDFjMFJraTYxdmNwTDJYeDVKazAybXVwMnd5SHBRQmdz?=
 =?utf-8?B?Tmp0cEplTDZhQmo3QmMzTHhwUUZIRmJiZHk4UFg3K2F2c0pZRzRqNHBOVUlV?=
 =?utf-8?B?cmxSWXFlTWV0cEFreEtUZ1lUNVZ2NUpSMm5PdzdJVXFOS0h1NmtNTWtSUnE1?=
 =?utf-8?B?TEltcGlLZjEwMWlQV2xZUURaL2pSeVhCaGVNQngzOTNsMlY1bUxLUFZ6VjRo?=
 =?utf-8?B?OE1qcnNLeUtJNDI3QXVDSlR6RFI5TG1wa3lEMmpvbS9zWEN2L2dCOExWSkZM?=
 =?utf-8?B?V0pTZE5qdk1xTFErZ1NhZm1XQ0pvMFZPTlFjMlZxU1l2Q044QndNcC9OTmRK?=
 =?utf-8?B?cENzdmlFQ0xNdHJYWGF4SlFPck80VE04UjBkNTBGcGdVQXFCVFBrb21LUHJ2?=
 =?utf-8?B?elFIbmhjbHhzMm1nNll3YklpTGRSRGZZYmU2Mk05aWFXQmp6YVhzK3AxWHAz?=
 =?utf-8?B?NVhmSDNrMFZ4bXQ2NFNJVVU2K3U3OCtUMUVFcG8vYWt2QkVPaHBXVzNyQU0v?=
 =?utf-8?B?cEsxRlp4QnlWYUFBbTRUYnEyWDhFd2ozRDM0aVU5ay82RzZXYVlqQjd1U2Zm?=
 =?utf-8?B?bWJTeEU4YTNNMHlwQ3NPQ0hOS0NSd2lwQXVENGJRS1RFWElhVDhyWG9EL3o1?=
 =?utf-8?B?WEFyRnpqUDVyM0pRUTdRVkJ0QWlFbVpTOHpCeHBSR21pMkkvWkh6b0VkbVRm?=
 =?utf-8?B?bmJNV3MzbzMzamhrV0hSejEzU2hoSFlrNnptSlhxOFNwNUE2R04xTjhXclZI?=
 =?utf-8?B?LzNISklBTDNXQVAzS0dJekVWV1Z3aVpjUjFnUzBkcFVjTVdNdDZiMHBtdGd3?=
 =?utf-8?B?cUtnRHM3OTBXRm9DcHRveEdVODdwWngxemlyb2tRNkxWT2l6ZHNTT0Jwckhq?=
 =?utf-8?B?bEhBcS9xajQ3SHNKeHRaZ3Fud0V4VnM4UmdlbklDczk5bmVmeG9ELzdUWmRo?=
 =?utf-8?B?c3JNbjFzT2ZDakYwZk5kblNNNWx4Y1FKRHR5V3Y3VUFsWG5DbmZUeFBseFhj?=
 =?utf-8?B?bG9CRWg0UU4yYkRRUjRRTU9pSjZaYjM4eUkxWm4wbkZobEk4eDVNV3RISll4?=
 =?utf-8?B?bW9hakx5RDRCeGQyZE5kRVVxQ0JucXlMWm0ybldKbldkTmR4a0Zra2lyZHR0?=
 =?utf-8?B?YzBLc25pOFNqOFlReFZIOVBKemFvKzQ5YzdnRllkTGh1VmhZQlRIZkI5MGhF?=
 =?utf-8?B?WjV6OUVtakVhNU5hS3VyMU5VaXB0S211T0RiV2NOYTBiVWVyTUJaeWw5UFdE?=
 =?utf-8?B?NWQzT2ZXNjRrYXNnWXpvOXFLVkUvVWdCV2VEaUxuWUFLRlYyclJLa0J2a2Jv?=
 =?utf-8?B?VTU0Y3M0SHhIUXNxRGZQRWNmd2hZeWJJYVZqODlrUzJzVlNqL1ZBbktZRU96?=
 =?utf-8?B?bnd4M3hIeDFWUFMvZ2JodTdmMFBuL0dmeHdPamlILzVndVhlRnpqZU5Yc3V6?=
 =?utf-8?B?YnNXb0w4YU1tSVo3TXRDVy9QYVVDM0g0OE5xY2hRTjk3aWRzOG9UU3lWUW90?=
 =?utf-8?B?QmdDTHpYallKR3NhUEhEZ0swVGFsRXZBR2xGcVl3VGhHU29QOXVWamQ2YVBW?=
 =?utf-8?B?R1RpYWxqaWowTEY0cGdmTGRLcmJaWVRON0E1Q1hwUHV1TUVRaElSN0FnaVR6?=
 =?utf-8?B?NGcva0hrdXoyOTFTRUZHWmdsN2V5aXg3RVgwOVUvamtYejRzampBMzhpQW84?=
 =?utf-8?B?dW9ZRVlIL0w2UzdIaW9NYXM2UEd6Y2dHVm9tS0trV0pWZUFHS2hBZWpLeEZw?=
 =?utf-8?B?a1dPM2FJdWZkTzlvUTNXdnhLWEtyekZDb3VJMUxaYzNETDJBZXVMWjFLdFdl?=
 =?utf-8?B?QWZKb0pEUlEweXVjUVFUeHhWdU9TOGs0clpUUEdKY09aRTB1akVHcFZxOXg2?=
 =?utf-8?Q?6rmCiMR7jkCPJ+SVupc05KU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D23D555A8494D4EBE936B73C4DEB7B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203ee029-340b-4e30-0a5d-08dd14bf6db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 23:57:36.8401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFHKb93oeSOp2ESCUoKUxEJJ3Hl1NjX4l4HQO3LPBw0ktsXhOaZwI6CGXSz04LlgSgCJNT0blqh9TqEUsjpKcf1Wi/Ll1Q8Ll7aQqFKsosbHtzcdxJwvCIkQLio6CGjG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
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

T24gVHVlLCAyMDI0LTEyLTAzIGF0IDIxOjUxICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+IFBh
dGNoIERldGFpbHMNCj4gU2VyaWVzOiBNYWludGVuZW5jZSBvZiBkZXZjb3JlZHVtcCA8LT4gR3VD
LUVyci1DYXB0dXJlIHBsdW1iaW5nIChyZXYzKSBVUkw6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQxNDU5LyBTdGF0ZTogZmFpbHVyZSBEZXRhaWxzOg0KPiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNDE0NTl2My9p
bmRleC5odG1sIA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIHhlLTIzMTEtZTQ2ZThmZGQ4
M2JjMGVkMzI1N2JjZDAyMzBlYTdjMzI3MmI0OTZjYl9mdWxsIC0+IHhlLXB3LTE0MTQ1OXYzX2Z1
bGxTdW1tYXJ5RkFJTFVSRQ0KPiBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4
ZS1wdy0xNDE0NTl2M19mdWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiDCoHZlcmlmaWVkIG1h
bnVhbGx5Lg0KPiBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5n
IHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gwqBpbnRyb2R1Y2VkIGluIHhlLXB3LTE0MTQ1OXYz
X2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gwqB0byBkb2N1bWVudCB0aGlzIG5ldyBm
YWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4g
UGFydGljaXBhdGluZyBob3N0cyAoNCAtPiA0KU5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBo
b3N0cw0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQoNCj4gSGVyZSBhcmUgdGhlIHVua25vd24gY2hh
bmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiB4ZS1wdy0xNDE0NTl2M19mdWxs
Og0KPiBJR1QgY2hhbmdlcw0KDQo+IFBvc3NpYmxlIHJlZ3Jlc3Npb25zDQo+ICAqIGlndEB4ZV9l
eGVjX3Jlc2V0QGd0LXJlc2V0OnNoYXJkLWJtZzogUEFTUyAtPiBETUVTRy1XQVJOICsxIG90aGVy
IHRlc3QgZG1lc2ctd2Fybg0KPiBXYXJuaW5ncw0KPiAgKiBpZ3RAa21zX3BsYW5lX2N1cnNvckBw
cmltYXJ5QHBpcGUtYS1kcC0yLXNpemUtNjQ6c2hhcmQtYm1nOiBETUVTRy1XQVJOIChJbnRlbCBY
RSMzNDY4KSAtPiBGQUlMDQo+IMKgKiBpZ3RAeGVfZmF1bHRfaW5qZWN0aW9uQGluamVjdC1mYXVs
dC1wcm9iZS1mdW5jdGlvbi14ZV93b3BjbV9pbml0OnNoYXJkLWJtZzogRE1FU0ctV0FSTiAoSW50
ZWwgWEUjMzQ2OCkgLT4gRE1FU0ctDQo+IFdBUk4NCg0KaSBiZWxpZXZlIGFib3ZlIHJlZ3Jlc3Np
b25zIGFyZSBub3QgcmVsYXRlZCB0byBteSBwYXRjaCAtIGFsbCBvZiB0aGVtIGFyZSByZWxhdGVk
IHRvIGRpc3BsYXkgY29kZXMgdGhhdCBoYXBwZW4NCnZlcnkgZWFybHkgaW4gdGhlIGJvb3R1cCBv
ciBkdXJpbmcgYSBtb2RlIHNldHRpbmcgb3BlcmF0aW9uIGFuZCBpIGRvbnQgc2VlIGFueSBpbmRp
Y2F0aW9uIG9mIGVuZ2luZSByZXNldCBldmVudHMNCndoaWNoIGlzIHdoZXJlIHRoaXMgcGF0Y2gg
aXMgZXhlcmNpc2VkLg0KDQoNCg0KPiBLbm93biBpc3N1ZXMNCmFsYW5bc25pcF0NCg0K
