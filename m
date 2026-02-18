Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCE2E9A04E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDDB10E640;
	Wed, 18 Feb 2026 22:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXyQATSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AD510E333
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771454391; x=1802990391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xs7De9PTlO05nqbGHw3n4TBeYRJSGrz9iT2+t7L0LFo=;
 b=iXyQATSv3o9OeoJd9Qudr0uaGqv2C7ODexSDnZmMwuwLphpyMWw8QnB3
 +QN8ljLN4t5kFX1kU8HQQvJWIDw8j4obF+VzzLQniORtC1O4wn64pzrk4
 W2b7syyKtCXeN/pGrmaEaBd9d+0MqdaHYEawfa1XIREfOlYFSjFAEANvz
 FDRB9g7zhldxDUMRtOsXFVk295pQr4vhGpMR1RqxKkcHaKASMYKtFuM8b
 ZJwFJ359ZhvQ79SMQ7hD2HCnyW707b6pkt6T5nLDTJa4EjkuewGszcbVm
 Z5RxGZPVXCUEgUGD7tRu2aLKsBoT+TaugPmxax05mRMl0BapIWpaArDos g==;
X-CSE-ConnectionGUID: alkMhY8wRv2yg/r3yxfCJg==
X-CSE-MsgGUID: wLusor7yTqmTCowVH9EEyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71563688"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="71563688"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:39:51 -0800
X-CSE-ConnectionGUID: ZO6IvpW/Que5e6Xlaa7hZA==
X-CSE-MsgGUID: yiYALKgfSCu2vgRjEKfzSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213568118"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:39:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:39:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 14:39:50 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XegJi1F7iIAWlqpWgJBxT/9aiZsZ/m60oJT06+xfMDRqhi81WSuainb2p7TJ4unxaIXBnHE0h21P73Cj+4Xmidw4ftOHMQSCefpWEoBreShttRa9oYsSHAw+QUkDCX/JaWVmI53nEbgKMPVi4AAsFaOo73X1PZ/mMcSPvUY+s5V0DOB/f89hM3+kQ8BrpizZqnlpKxpzKk6BjHn21feszqfSaMAoBNkf7x8hxRELVtHoi2ejRSXfBdYDivaxhOGWZ2dyD4WS2JcnAvJ6mLlq59b9sG5XTRL9108YSn2GnjD6EK/NSNsXOO1YgoJUEZ8ik8FsQ/wgYxOnWGU9A/2Esw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs7De9PTlO05nqbGHw3n4TBeYRJSGrz9iT2+t7L0LFo=;
 b=bUx1G3Q/fDoLsisG1O5BaWD+2lbciE3JWbguARs51d9h0uEwGs/oxfgDD77Kp4c+z57gujh5IK04REjJqll7rjmGG0mVlhew/0ul+IIU6rJK+WBWzQtE7nn9Rlg+yOVKjGn9pmmmmVsJT5YH+DOoS1vZElP3oZIiEwL64EGwkL3cQBsX0fVfWbO72JYungkD0Vltp7DhW7xPWvd9G40AalDvpX3m/CHsuhYJTVZCtDPF21F/ZP4dDNc8px2B7NqRQm74YNZc0va+tp4CA8v6ensn2L72OnaRxkN/8IdIkUi18TnVB8VN+UGy0twRKKOl0z09UbgBDWrAGnsWQIkY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by LV3PR11MB8765.namprd11.prod.outlook.com (2603:10b6:408:21d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 22:39:42 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 22:39:42 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wang, X" <x.wang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>
Subject: RE: [PATCH] drm/xe: restric multi-lrc to VCS/VECS engines
Thread-Topic: [PATCH] drm/xe: restric multi-lrc to VCS/VECS engines
Thread-Index: AQHcoJqanw6BgXaRqU+RlEvumg4B2rWJCEwQ
Date: Wed, 18 Feb 2026 22:39:42 +0000
Message-ID: <DM4PR11MB5456FCBFCFD2B9ED3B486848EA6AA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260218055033.327926-1-x.wang@intel.com>
In-Reply-To: <20260218055033.327926-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|LV3PR11MB8765:EE_
x-ms-office365-filtering-correlation-id: 35041565-f0fd-4b5d-35cb-08de6f3e9be5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M3dOZlFGWkszZUZ5WDZYWFpDYmpKMWtjOGJxS2VZRWZQc2tBMWFQN01SNXV3?=
 =?utf-8?B?T0pGWTgzU3N1RDQrSEUyakpxYTUrM2NLVlhIdHVCQVRHTUtrR3o1cXM3cFVi?=
 =?utf-8?B?aStpRlZ1WHNXMGFkM1dQenc3UGNrMWZod0RWYm50K0ZFZDIwWGptdWIzcFBw?=
 =?utf-8?B?K1kyYS9YWG5oRjkyVUdhOFRaT0tWRzZpdmV4SkV3T1dYZTdIZ1FGWVl5U2wx?=
 =?utf-8?B?L1VkM01ETyt6TzNkclUzOW5ZTUhWT1BuYzJ1Y1VDUWlGOWNmYXZIWThhc3gz?=
 =?utf-8?B?Yzd5RTlQN0xWUW5iUUlQTUxiRlhXWDZDRXhGN3hucWhxK0c4MXQ5MFJPSERq?=
 =?utf-8?B?eHBOZGh5dklGaFZyY2RlN1lxNjR2R3VGdTQ3Q0svM1NraTlCSWFrYkxNejgz?=
 =?utf-8?B?WExmdVpCZHlNUWF4eTBxQm5WakJUZDZqOWdHcUJDL2FkSFlCYW1ITzlvbkZk?=
 =?utf-8?B?cVJqWHJkQnNEbXI3THFzY2JnUm15VHFsTUdLRW80R3VRdUcvRElmVFdtLy9p?=
 =?utf-8?B?VlcrM3FHbnMyQlZQem41a09maWRuMjVqNkF1WkVMTTFjU3kvMjFxczBzT3N5?=
 =?utf-8?B?Wi9DRFZtOWt4MUJ6SWZONjF2Lzl0Nm1Bbm9CVCtVc0N5RjFIbzB2bUNlaU9w?=
 =?utf-8?B?R2twcFpoY1dxUkM3WG40UHBwV2VML3ROMVZBR2ZMZWZyd0xsSUhtK0R0Y0pP?=
 =?utf-8?B?T0RzNlMvNnp6TEdZbThBT25ldHpkQmZXalpvL1Vwem1JZ1VpeUUvd0w0OGFI?=
 =?utf-8?B?WUpyVkFFeC9JR2pHakpnSUxGcG9lYU5VeUUycHpVYWNNZTNIWXJrRFFudlRF?=
 =?utf-8?B?LzlWSStCeUZlMmZYaXhZU21vNTExRzJKV290NExYYzJLd3VyQ2pBTlE1TEtj?=
 =?utf-8?B?WmtYOWl6Z01TaFpNNzlFSHI1V25vZG12Tjh3Z0xMYllzRlNBZkJNOXdMYTBs?=
 =?utf-8?B?dGVZQ0pMM2o0NHpDQi9kenlGYkh5T1VhQ0ZCR0hndXZ0azFheWo4OTlTTFZm?=
 =?utf-8?B?T25NajVENVpkMXFFL0wrS1BhNU5nSjBiWFZrclloczllbXBsNFIzNldoWCs4?=
 =?utf-8?B?WGVmaFUrVjRXc2UvVGhLWHYzNGxiRUVTc0NCYkRhL1NuMTl2Nk5hRVhEOXVV?=
 =?utf-8?B?bVdGdzQ5Tnhkam0ySDZ4YXY2VnhyTVNxWDQvOEoyTGVJaFVubTJuSGpoN2o1?=
 =?utf-8?B?VkdZTGZNcXhUcEIrbGl4NEwxTjlJS2U5Q08zSE5qQnFYZENmcDVKWnI3QVFo?=
 =?utf-8?B?eXkyYXA4aVpZank2ek5NbWtjZ3FvenZ0K0hMckJYWjlwY3NzdGFDekQvcVo1?=
 =?utf-8?B?Slk5d1N0aGsyZW8vbzFVWkFVMWFtNzR6QmRPZ1ZhQmtRNm00Rm1vNHF5YmU3?=
 =?utf-8?B?cWxKN0dXcWlDNHVzZVk0clJLR2VGV2FTN25MSmwzWUZodmFOSlZBc05FdXJQ?=
 =?utf-8?B?aFNDYzUyUitlZlFVaS8wQWIvbUlKK3AwZmgyR1JmYXhFY3RyUE5hcmxUREJv?=
 =?utf-8?B?dUw1cTRDM2hWQmU0V28rcjNBbDh6WFpuOGp2aTdjeldaeXpwbWNDcTNrcE9V?=
 =?utf-8?B?Vi9seVZydnJkN2ExcjVibU9WemRxZmVlOFJQNndMTVMwTWIzSEI2NU80MFdy?=
 =?utf-8?B?VjVPQmF6SURXRE4rNWdscXRZWTJ1Z0VNRCtnRVVkbHA1YUtBME9hcjFkdlBy?=
 =?utf-8?B?RFlFRTJIWWtMM2w2dlF1WmZGUCtJcUZTUGdQUm5XbksycUplYkpMandwemFO?=
 =?utf-8?B?dk94WUxnbVNpREJCU0FFcStEMHRQVllrQjZORTkrTFhraUo2RlJXakY3K1cy?=
 =?utf-8?B?QUU4ZzNzVTJURjVBZ3ovaGs0UWVOcS9Mc3ZzYStDRE5Kb1M2eWpqd3NYMG5h?=
 =?utf-8?B?OXdGK056K1hLejJ1R1VXVnlHZW5LQjRzRXM2WHpESUgwSVZoTWN2Q2RKdEdp?=
 =?utf-8?B?SEMxVEk1V2VUSEg0TWt5NEgwR1pwUmlOdkpBYlhvNG9IQ2J5dTNMbzZrT3ND?=
 =?utf-8?B?dndrTmVHSDA5a0c3ZUtCVHBPaWhON0tRK3RFdVJxdmFwM2MzMHRaMGsxN1Vy?=
 =?utf-8?B?bzF2YzBxMGlwclBNWlNRVlNtSVAwLzNLNU1CVzl3UzVnSWFORy91Z0VESWxQ?=
 =?utf-8?B?VkZnNHVWQ1ZxdzVFK3E5QnJaKzY3Qm9tdHVuQndJWUIwZ1ZGVnBTTGw0WHZN?=
 =?utf-8?Q?Z/vZIMRxzmwafSC+kwwELNg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2l0MHQyRTc1L3R5L0pjaW0zZmQ1dVNwcUJSWkdyaTl3RzVoYTQvdXU0VXhQ?=
 =?utf-8?B?M1NCdmJtYVk0SnFETFhkbTJCWXl1bE13VnpWVG16VnRmRU1DL2t1Z2N3S0d4?=
 =?utf-8?B?Q200aUJsMktHWmdzWjdoai9kdWRHUmdIajc5aW5BV2VQaXFBY3hFSnU5Syto?=
 =?utf-8?B?aC9uR0NtUndudmtHZmlwUW9kZUdpclVISml2QURCY1IrbEpnZzlXRmR5d0Z6?=
 =?utf-8?B?YTlLZ3dDSTl3TFVUVjZraGU2VXFJMUdqZFdycWxJbFV2cHRRcmVQZGJvd0Fj?=
 =?utf-8?B?RHVkTDkwMktvSkVhT3g1Tjk0LzRPQmZ3Y3VDU1dLbCs3R2pVMlVFeEdWak00?=
 =?utf-8?B?azRGMHBHTCs1NXNaaVJZUFFRTWFoNkpQQ0h3ZlNkZ3RTMGlSRHhmTU9QTllC?=
 =?utf-8?B?K3ZNREkyTU40T0FlM2tGYVV6bXJUSUQySzFWZjRTT08rWDN3SU5ZS2piSjVF?=
 =?utf-8?B?OS91T25HRW4yR25XLzE3VVV3YkMvRk44RGhXa0VsMVJBZlkyV2toajFyd3R2?=
 =?utf-8?B?NGJSTXhyV0t3b1BCQkN5RkdjbkpoUVlROHUyVCtmM0hyUE83TWZiYUc2bE5w?=
 =?utf-8?B?Vmg3SE1aTlc4cTBOVnBibG40VnlxN1lkZUFrMmF6Sm1iRS9hQWlBSCtPUzdI?=
 =?utf-8?B?N3pveXpXQ2JvWmNVR0dXaDkzOElTRzBCQmJuNXU4eUcrOGpHNVJSSGVoVXhT?=
 =?utf-8?B?ck1GZzI0WFNxcWU2ekhBMHFiUXg4VjVBeXVIcTBQUmpwRlZVWjFOdGVGRjlw?=
 =?utf-8?B?Ly9TYm1nUEFhWURjWXc5bnJQTTNlTWF5ZGxUai9RY3V3bm52QnJkRk1QSWgy?=
 =?utf-8?B?Lzd6cVZRSzk0TWdHTlJCL2xmQkNIY3ZYY1NNV0t6Y01lbGxCUFF4T0xZRjl1?=
 =?utf-8?B?UEF0MGlmUGZSUXlqWjFvN3lYc3Nuc1J2S0gxU090TUNQR1VocitZUUV3YkZD?=
 =?utf-8?B?NTNoelNtY3ZzbzJrdXBvYUNDczRaVnl5QjJnNHk0NnFBNkg5YlF0YmFTZzNw?=
 =?utf-8?B?anJzZGYrQUJacDViRlBOZDRCZFJ0aFpZUWlpUVd3WjdGeDcyb0prM09qUGYz?=
 =?utf-8?B?YW9qNEFjeHpTeHcramNwWnBMRFpHeWVNbkFkUDdpbXhqNURIREp0M1Q1MDk0?=
 =?utf-8?B?RnBGZ2JEUEhyZ1M4L3V5bUNFektGWklVWUY3UDZuYTl4RkRRT1BDeFpOaDN2?=
 =?utf-8?B?b2lVNUR6Y3ZsSjhBS0dWbENlcFFJWExBRTZEcndCTzZoUytyYndxZnppNjQv?=
 =?utf-8?B?cmxqMlZ2OG1CdVJ4bkJ0ZTlSTmxYMVdRSEFuU2Q5b1VGV1pmZmdyTGVWOGQ3?=
 =?utf-8?B?SDUrdGdsZ0RMRVlGQXpXbU5vdElQY04zUUVUWHp5d2NhZExSZ3BSWmptVUha?=
 =?utf-8?B?aUhiTVBOVDk5cXoyRXAvVXhWYTU0ZnhzcjRweDBrb3NOYVlSSjRSNGl2M2Rl?=
 =?utf-8?B?bDVSNzlaOUQ2LzVzWXVhUTF3REFacDRiRE9FaXNiRjBXSjJiNW9xdk1CdUhi?=
 =?utf-8?B?UnBCM2xXNFdGQk9MU1FoclU3UGVCYjB0QUkzMUxYVEEzTFg1bndYejdjc3dB?=
 =?utf-8?B?M3ZWajBEN2ZkVzJSOGNqd2lZeTdEL3BOWHR0UnFLRUJJNjhIeGR5Q1JVY3Bm?=
 =?utf-8?B?Wk01NHFqTzlMeHZPbStEVjlSUHZRQWpHUkdHOHN2ekJCNVR4Sjk1elJFTDN4?=
 =?utf-8?B?M2srS2VCdTRnUUhwWnUydnhkRjg4YmczZzhFd1M1K1FKb2pqU2NTc0JTcWZS?=
 =?utf-8?B?ZzAxdW1yTHZJbDJwS0lZSVhsSTIvWWZDTjRhQjdjMTVQTlN4RnpJRzY0WmVs?=
 =?utf-8?B?WnVadXY2azU1bUlWNkI3SzkwSzVYVTMwZkxjUlFFaFphbk1zL0pmVDF0YTI4?=
 =?utf-8?B?cUV6aXN0Y1RkR1BHUFZLbllDTEVUWm4reVVGZmJRaXJqWml3Q2s2ZDNDNnp3?=
 =?utf-8?B?RFRCYWVyYTJQZG9CRmp5UCtlT2Z2bEhPWTFkUlB3eFhDRmVLUXo0eFI2WnBV?=
 =?utf-8?B?MTU3clhFbFNQRVJuc3BNS3d6LythRWJTNy9lWHQ5bjBOa2tLOVM0bGZmNmY1?=
 =?utf-8?B?a3pkNkFsOVB0RlJ6Zm54WldpamQ2Z2l5MDV2NjdqaXg1RHh0TFFablVJRUxV?=
 =?utf-8?B?akxRSURaOHc0UkFqMVg4MDAxNEF2ZTBaemlEQmFYSWlsYUZUYzBQa3hYb2ZX?=
 =?utf-8?B?U05aUWtDeElWZzJmVEFXR1NIU3djREFpditEWHhSc00vU2ovcjhtRjlvNTVt?=
 =?utf-8?B?RGlWMGw2MWlzRFRES2xONU1McnZuV2tvaWNVQmRwWWNTeGoxNy83SFNNMkI4?=
 =?utf-8?B?MWJwbGE5RFhsTGZpdlBRZ04yY2YzWllCMVkzSHdFKzV1ajFOWURKdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35041565-f0fd-4b5d-35cb-08de6f3e9be5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 22:39:42.6865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ZhxByE14DipcDRRzPv8C/WPkc7UDlFvb3rPrKHH16jkhPk/DfYtPOO32fZCQ1/bxyFlzuZFKByjpcLc61Z/8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8765
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

T24gVHVlLCBGZWIgMTcsIDIwMjYgOTo1MSBQTSBYaW4gV2FuZyB3cm90ZToNCj4gU3ViamVjdDog
W1BBVENIXSBkcm0veGU6IHJlc3RyaWMgbXVsdGktbHJjIHRvIFZDUy9WRUNTIGVuZ2luZXMNCg0K
cy9yZXN0cmljL3Jlc3RyaWN0DQoNCj4gDQo+IFJlbW92ZSBtdWx0aS1scmMgc3VwcG9ydCBvbiBu
b27igJFtZWRpYSBlbmdpbmVzIGZvciBNb2RTY2hlZCBwbGF0Zm9ybXMsDQo+IHNpbmNlIEd1QyBm
aXJtd2FyZSBubyBsb25nZXIgc3VwcG9ydHMgdGhpcyBhbmQgdGhlcmXigJlzIG5vIHZhbGlkIHVz
ZSBjYXNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWGluIFdhbmcgPHgud2FuZ0BpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYyB8IDkgKysrKysr
KysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gaW5kZXggNjZkMGUxMGVlMmM0Li45ZjVlOWQ3OGM4YzYg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiBAQCAtMTIwMCw2ICsxMjAw
LDE1IEBAIGludCB4ZV9leGVjX3F1ZXVlX2NyZWF0ZV9pb2N0bChzdHJ1Y3QNCj4gZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAgCQkJcmV0dXJuIC1FTk9FTlQ7DQo+ICAJCX0NCj4gDQo+
ICsJCS8qIG11bHRpLWxyYyBpcyBvbmx5IHN1cHBvcnRlZCBvbiBWSURFT19ERUNPREUgYW5kDQo+
IFZJREVPX0VOSEFOQ0UgZW5naW5lcyAqLw0KPiArCQlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdz
LT53aWR0aCA+IDEgJiYNCj4gR1JBUEhJQ1NfVkVSKHhlKSA+IDIwICYmDQoNClRoZSAiIEdSQVBI
SUNTX1ZFUih4ZSkgPiAyMCAiIGNoZWNrIGlzIGZvciBtdWx0aS1scmM/IElzIGl0IG11c3QgYXMg
SSBkb24ndCBzZWUgdGhpcyBjaGVjayBpbiB0aGUgZm9sbG93aW5nIFNSSU9WIElPQ1RMX0RCRz8N
Cg0KPiArCQkJCSAhKGVjaVswXS5lbmdpbmVfY2xhc3MgPT0NCj4gRFJNX1hFX0VOR0lORV9DTEFT
U19WSURFT19ERUNPREUgfHwNCj4gKwkJCQkgICBlY2lbMF0uZW5naW5lX2NsYXNzID09DQo+IERS
TV9YRV9FTkdJTkVfQ0xBU1NfVklERU9fRU5IQU5DRSkpKSB7DQo+ICsJCQl1cF9yZWFkKCZ2bS0+
bG9jayk7DQo+ICsJCQl4ZV92bV9wdXQodm0pOw0KPiArCQkJcmV0dXJuIC1FT1BOT1RTVVBQOw0K
PiArCQl9DQo+ICsNCg0KU2luY2UgdGhlIGNoZWNrIGRvZXNuJ3QgcmVseSBvbiB2bSwgaG93IGFi
b3V0IG1vdmUgdGhpcyBjb2RlIHRvIGJlZm9yZSB0aGUgdm0gbG9va3VwPyANClNvIHRoYXQgeW91
IGRvbid0IG5lZWQgdGhlIHVwX3JlYWQoKSBhbmQgdm1fcHV0Lg0KDQpTaHVpY2hlbmcNCg0KPiAg
CQkvKiBTUklPViBzY2hlZCBncm91cHMgYXJlIG5vdCBjb21wYXRpYmxlIHdpdGggbXVsdGktbHJj
ICovDQo+ICAJCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPndpZHRoID4gMSAmJg0KPiBoYXNf
c2NoZWRfZ3JvdXBzKGh3ZS0+Z3QpKSkgew0KPiAgCQkJdXBfcmVhZCgmdm0tPmxvY2spOw0KPiAt
LQ0KPiAyLjQzLjANCg0K
