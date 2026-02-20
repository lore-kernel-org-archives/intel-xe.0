Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9127DC5516A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 09:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DBF10E056;
	Fri, 20 Feb 2026 09:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPNkeroA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D222710E056
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 09:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771578375; x=1803114375;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eGcOYbx/Z5k8u6qBqu4p5CAJSHi4P2R/VppthHGqETs=;
 b=fPNkeroAPx00ajrybnRBJfngjQpDsZmtmLahOdh0J89bSMKellydcb9V
 8WwEyCq2UjoL4Sec62INDPbomlaj4rXuraFC2y6dPVxMme4FBG0+hPWLR
 3WqRu2t/oVWTtRZ8Oxbo+KM2Jhijwy5+1TtdYGJeocnzOGvP7PZk4LNI8
 pX9B7rPEDfDRfWsmIvKuL7riSrpxTpJwem8WUZTows3hdSLgKleyOJXrN
 C6ycYFWZbXMwoVucRqmppEMfGRZNSmpYZc+IaP6xxdlrHXWok8mkKj1zF
 Gj+V7kQ7wjMD/rnMMohrqAI4FLQE5l6+yB+F6bs3Hwe1tW3OqqV4XgKYG A==;
X-CSE-ConnectionGUID: 03ApT6WnS96XpVvZopcVMQ==
X-CSE-MsgGUID: VqaB8YwjSk2K10CMT8VB2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72654132"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72654132"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 01:06:14 -0800
X-CSE-ConnectionGUID: xF5v2HrWRiOCCkg2lkH0Ng==
X-CSE-MsgGUID: 7hZ1S1kGTbO0fK1U86jbxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218932679"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 01:06:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 01:06:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 01:06:13 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 01:06:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdAGcH9ifQ/Ij5jWJkDnFbUN0IThQgK+qvBGDNjnJKaBiYjMJXR0nw/szlMRtmYrs6dLvU2FNc7pSJ7dd8RNbL61e40jSTrtcKjsmalpCcfyTPS0jPKCROAX+JA/20Nr5hBX4yczU98B/UZ6yd+YbgOMx8jbHKmTvwmPfhUgZFXbTOkWB6v+CP5ePzk968UpBKbvh32Lh65DOVDpaMWiSWbwjhEOYMBjziaeRpKc1BVsJ7cEC8I/uqWz5wofE/Tkopvb/gftz//em6JgrL0Kc35l3C22+vPLjGrl2ccLAqNyKnqWYYqAXHWVdRS7ZX7m8R/r2aFFiHZP2AE413KZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGcOYbx/Z5k8u6qBqu4p5CAJSHi4P2R/VppthHGqETs=;
 b=o7JbWJSPyIY1M1jGFTfTQuekl9izHo5FIPviYT8V1Q0CGsqCJj6+M1+3fiDBGegVLEnvnBgXE2OVMoTrMo42ghg0Yos+s/O698YIIxonz9DtOMBNahAZyV8OoUJGatMgr8bTGBHm0iVQvNdIIKjVNWVtzNCYxMPFkK64JcF/8GH9dpz0y+g2aE8wK4OVnV7AsBuKS6H6aVAa7E62DBXZoCuQtCLBHt0dUbh+AoSnVfpYfplwW4KssIL7Hg0/Pb/YXbJk8TRxLXmvQrx5gexRSkwYhKkOMqC2tvKneVBcA1prydY+X/An6QI47QVtQD/Yq4tlM7JbhzcbLASNGBEMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Fri, 20 Feb 2026 09:06:11 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 09:06:11 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar G,
 Naresh" <naresh.kumar.g@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Shah, Ankur N"
 <ankur.n.shah@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Thread-Topic: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
Thread-Index: AQHcn0w0JZUjpGabA0yL08Ptn+mIFLWILJ0AgAMkrxA=
Date: Fri, 20 Feb 2026 09:06:10 +0000
Message-ID: <DS7PR11MB6271DB9AB3616DD4D89FC9ECE768A@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <20260216135107.3148167-4-naresh.kumar.g@intel.com>
 <4603e26486bdeeafac19dc8a4d0c64aa3fa988bb.camel@intel.com>
In-Reply-To: <4603e26486bdeeafac19dc8a4d0c64aa3fa988bb.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|DS0PR11MB7411:EE_
x-ms-office365-filtering-correlation-id: ce189c17-3053-47b5-790a-08de705f4aab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cGdrQ1NYaFN1Q2NkcU1YUHpGc0hZV3VwNmJNRzM3Y3QyU0Ztc2d4L1dSbC8y?=
 =?utf-8?B?ZzdnTCszaXJSR1BUTzhmRk9SUXBKaDYvaWNoY09XL1YwczNHRFcvb1BTWlFP?=
 =?utf-8?B?aG5sS0pTZk0ra3ZyWWJGQ1k2aDVmUWhMTVovNmg0ME95Y0hUSzhjaFNIdUtL?=
 =?utf-8?B?dmJkQW5FUVBqclJsQkk1bXBSSWxtT2xQOEd5R1Z1T3RiNjNrc2V1WlRJUktv?=
 =?utf-8?B?ZlczS1VmMmxlaVk4VnYvdlRpb2dEWGxiellzRE1jM0VKQ3kzN3NWNFdUTXRj?=
 =?utf-8?B?TXFKYnNwZ0pib1QwYVhTa3orOWU5MklsV1Uwd3ByRCtMR2x6K2FCUWROZVVy?=
 =?utf-8?B?ZkFLdnB3blFYQzJGVTdiQ1BhbkRQdTlaS3pmTjNIN3FQbGNzaFlqOTExd0hy?=
 =?utf-8?B?RTg0RGk1MkFzU1duVFQ3Qk55Q21pajJyK3hOQUY4T3lXU3YxUFhjWkRSN2lS?=
 =?utf-8?B?cUFSUTNTdWxHei9lVGdPOHUxK3VPa1ppWFZ4RXlEVm51RzlUeHBtZ1JPT0JR?=
 =?utf-8?B?RFdpREttWm1FM0lsbEhjd2lmK0hPcmEySlBnWW5aQ1JVSWxKcGh2NUxGL2hj?=
 =?utf-8?B?MVJqNk5kZmVHczJmSDQwdGRoVzd3N2ErZ1BiaE5xK1FHREFidzVjazM1Skw0?=
 =?utf-8?B?SW4zRlhpQWF1Q3hwZkIzamFPU2xRQjVlaFM5SFBYVS9UWmtxTHpUT2FwWGdi?=
 =?utf-8?B?UjZUS0VEcStjVHN0Sm9OdURpdDNsY0ExRlMra3BKZ09aKytHd1VJZ0JFTCtj?=
 =?utf-8?B?VlVPRnVCZXViMnY4MHpuUmxPMTRVd3M3UndwY09wNysyUkF4eWEyVlloZ1VY?=
 =?utf-8?B?SEl2WERCVzBXUFdxUEwyeVdzMTQrd29McERvVGZVTHZVL3BuTExzaGM4ME9n?=
 =?utf-8?B?V2VDRSs4V21tVkxROEs0Q1pld0dJT1FVODBSN2tOWk9DaEF5dW9tb05XSUQy?=
 =?utf-8?B?M3RiS2NjWDZuRlE0cTNuUEZzM1FqSEliTEFrYk9oZ3gyb3Awb3dUNlFIaldU?=
 =?utf-8?B?d1laajhSNTdYQUxNZDM1ZUVrNWpvcGRNWjVGdWFFMHhZaWZtbWg0SzlmSE9Z?=
 =?utf-8?B?ZGQ0TEd4Ukd2MmNRK2puVmN5K01VaUc2V0hIbnVlODViVElKb2V6SE4veVcw?=
 =?utf-8?B?cXZabHRLWGUvT1lmL1pzNUNXaWtUYjMrdkFjTnlKK3BSSXpweUVYVE9KanRN?=
 =?utf-8?B?cElYT29HNFJnVkx3ejRzRURKZjdvMFF4bWtMTFg1ZlU2a3FvVm1EYjVPMFA0?=
 =?utf-8?B?VnFxblVJNzlManpnYWl5VlNBRzdwYWVPSFdmd2NTUkQ2djFrVnJhbk0rQ3hq?=
 =?utf-8?B?UVBMNnc2ZGFpb2crMjVUNSsraWNFRXZsNE9MSjhneDlkS3BoQWpsRmtxbU1z?=
 =?utf-8?B?dExUWExIclVSZlJYRVNUS3AybWE3QmVVS2dEVkEvNk5HbHEzR2xTZDY1cHlo?=
 =?utf-8?B?bU9WeEZXenFXMEc0VFNjZ2h6MWRnWUJXVURaZWd4MmM4MDNubHlYa0JxUnJ2?=
 =?utf-8?B?Zll0TEw2dzBKT29wc1pQdDJ6ZXNteVBreWI4VnBWYk5JZnF4S0orZU0rNk5K?=
 =?utf-8?B?RW9EMlpkR2ZjUEhIY0VVZnM2YmFVYUppYjU1ZXBrVTZDMGRTZEZCeW5LU0o1?=
 =?utf-8?B?clZKdWdzaDRWK1BUTVpRV295NmpKNjd4WWg1dHZNQTJ5dDI5bmVJYThYUjBG?=
 =?utf-8?B?SisxcTg3d01jVzdhR2JQM3ZzVjhtaDVsd29BNFZRY2lSclp0TmcyMWVORmd5?=
 =?utf-8?B?ZEZWMnR2MzFsOWU5b0pDUjF4SUZ6UGZGNmJiNjNDbC9DOWlRNEJvSHl1d2RJ?=
 =?utf-8?B?OUFaMzNiUE9oV01xNk95QXNXdlpjbG1NRVFuc0pSRTh0MHVST3JQcUR4Mklk?=
 =?utf-8?B?OVVpOXg0MXdnOHNkRTFBTTc5dkhodGhaN0dqRkdYWFhIKzFRSmxuNU5NdExp?=
 =?utf-8?B?L1djeW5nN1lpc20xQkpqUGgvUXZoNG9uWnUrbmRwZmxrMEtBaTh2ZEVHeDFV?=
 =?utf-8?B?L3ltUGhtRzRRNGxMQnMwRS9GUTIrS09lWlg0elVReDBVNit5Z1F0bnNDQVR3?=
 =?utf-8?B?OWpLQTlMQjV0dXA2Z1gwdVhkS2gwNWVxUTFTUUdVRVFNTVREek5uMGZrU2ZT?=
 =?utf-8?B?Mm1odXJGWElmZ25JdGV4Nk8vZHBnYlo5dlRWY1RkOFJhZzJuWitmWktDYXdX?=
 =?utf-8?Q?G8KerJQASgS9FvMWSLA6cG8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVo1aWw1Sk9DYVpLZXNVYmFHL2ZuZlJUT0N3Vll0dGdvR1JYdkRTWHJkaFBK?=
 =?utf-8?B?a3habjlrSFEyRnU0UmcvWC8vTDVJRUUwRGpQa2NmQXZtVlFFU0hTM3VjT1lx?=
 =?utf-8?B?MC9WcVhnUFZpelZXOEZpeW83V3dJbFRWaE5rUmFvS3hrZVJCcUpRVURFYVAx?=
 =?utf-8?B?K083UjZ1KytlbHhzVTk1aFkyYm5mc0ZGY2hEdXlOOXZ1VWo3QUxQcmxOS1JY?=
 =?utf-8?B?aTBDNVU1dlNoZ0NTU3RNRXJmbytaZ3hFa2cwWmxxNWlmSmRld1Iwa0p6VHFG?=
 =?utf-8?B?Qk0xV2VMSVo5bHNUbDYxTmVUQVRLQWJOYnRuVUFWMXBaWUpySmdLL2piLzdZ?=
 =?utf-8?B?MGVZVC82a1pqUVlRbjhzYVlybmJqL3Y4Z01ZRTdBQnp2SjFMMmYydzVaZFp6?=
 =?utf-8?B?cHpuOU5hakVBUEliRnlhaUxRZEllQzE3VW9ObG1rL3lIMjM5aStneExBbEdv?=
 =?utf-8?B?eEYva3d2UWRGaEFlSmloM2FRdVF1blVKZkR5aTlXUjArQ3JEVWwxOWxpNW5Y?=
 =?utf-8?B?cTBLS2FGc25OL1FXVXlRNzRkaTY5YVdGdGp2OVA1eXZTZ29QZmwwTWZKZGFn?=
 =?utf-8?B?VC9leFladGJsVFdkS1M5YlBQeXpDZTY2VkFvMUlFdGRvT1AxMHEwVVFXRW02?=
 =?utf-8?B?RWEwM0dlS3ZpM1h1YmN2bEw0c0IrVzdJLzllcUFlYmNkdE5paUxpVnpNbXdZ?=
 =?utf-8?B?U2JIUUIyNWZDQUwxc0JCR2ozSVJWaGJ0UXd3SlpmamppTndxWU0zVzg3aVZZ?=
 =?utf-8?B?N2YvWGhINzVROUlld1E5ZzFqUjR5czZuU3MwU21ra0dkTkNBMDNFTzhndUZr?=
 =?utf-8?B?VWFwcEJMWUFwbEduMmtVSWtMNGhZL2JHUHZpajQyazJTVzNWZmdKWlR1dlFE?=
 =?utf-8?B?VktPdFhmdjFKNHc0dTFZSml1dWFSL2JvMmpnOEhndFJWc2d3WGJzSmt0c0Y2?=
 =?utf-8?B?UXdTbGt0SGxBOWxLM2hFUkk0aWtqU3l1dHI5UHpUWjVFS0ZOSVpnc0MwZ3Fm?=
 =?utf-8?B?aTE5VGlpbm85OW9Hams3WnpacEtIWDc2aGRHOXlIVlJxR09qYUtNUWRMbmIy?=
 =?utf-8?B?d0R3ZmdpMTA3NXhtQjgrM1ErV1B3QUNUb2FQTnp4bG9pd3YwR0xUTDRscHF5?=
 =?utf-8?B?a3h4YzM3THdQSGtRaXdjZ1JZNkQ1aEpjWDhUS1JMQjAxeDZPc0liWm5jR3JQ?=
 =?utf-8?B?ck02ZVlSaGRKQll3RmM1dmo5SnZkZHpDTm0ydlpzeDdTZ08zZFI4b3hYUlNS?=
 =?utf-8?B?bXFRT1VuYS8xamNqT3lYOExMWVRKcnJuaU1nbTlCdW95eTFESVNjdFJtSVhF?=
 =?utf-8?B?RVhUbDFXQ3piMTBLOGZCNXorbGRWQUxZbmw1YXk5UTM3VVB2NFE4TGJjUVgr?=
 =?utf-8?B?ZVJBL21JblRGR3NOS0p4OFZkb3pCdFlQZ3RJTDJ2YTVDN1dJSVpESzdSM2Nv?=
 =?utf-8?B?eTI3OXBXV3pNWWRhOG5YdkJFRXZzU0JaamhnWHlhWGZlUGtqdDUxWjN6RXpj?=
 =?utf-8?B?VlpHVGl2SGJjSkQyNXZrdTBaNkxUZUM2em5rU29ZQTBzNyt5dTEya01qRjBz?=
 =?utf-8?B?andsMjNkcnJDdzNIV1lyc080TGtOOUFkRDYwSGtJK0N1VGZrdzlPanM2RjZq?=
 =?utf-8?B?YmJkcTg2NGM2R2xjSmwraXlVckdvZzRhZEJuU2sxbkYvczFtUFk4ZGZSSkhv?=
 =?utf-8?B?dnZwMFhuSW1IWEpJdzM1OXh6c1c1RHFKK3FqQ0NpZjdhaFFqaWpReHFVOHVw?=
 =?utf-8?B?UXBFWUl5SE9EclZ6WTdqVDdMaCtaM3hxZitoUXZQTWttZG10KzBLM1lSVmdL?=
 =?utf-8?B?dE5CYjAxVjBMdnVzaVk2dEQ4RXlRbktoc2cralJmNDVPanRPZ3dsR0RmUU03?=
 =?utf-8?B?NlowOFZvdlVhVTA3UFE1TDh3MXY3bDJKNHdEK1Jja3VoMEdLT0w0NFVJSEFB?=
 =?utf-8?B?VUxZK3Q0aWhTR0EzTS9UUUh3Q2RxM3oraDNGbUVWVVRqMVFZUm9wOUJ5WXZi?=
 =?utf-8?B?T1ptc0F1WU1HNzhJMGplNmgvNTAxYWp3aU03TjdUcHRwbGNoSjM1TlFzT2xK?=
 =?utf-8?B?YnNJZXFreWFaVTYzSmVNVHFyT3IwSmVJMFBqUmxHQWZBTzZaWFFWbXNySHlt?=
 =?utf-8?B?dXZnWUVmYkR3QlZudlMyVTNCNTd3MmJvUFVDSk9LM3h6N3c1alBGVFA1SGRz?=
 =?utf-8?B?VVYvMFNhbUg2YUtleG9WZENsWnNDRUhPaFdvWk5MYmZYelh0YnBTMWNKSHBh?=
 =?utf-8?B?b0NmK0NGNXJUNUFTNDhUYUo3NzMxRzlRWFl5dkRMeXV3T2FxRHdlYS9oMXM5?=
 =?utf-8?Q?pQSWsXVtKTfOHvtOtm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce189c17-3053-47b5-790a-08de705f4aab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 09:06:11.0045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZmaIKWmpg6ntWN+WXec1XSjO2rnBggG6zusqx+qQ1HucDSxIm03Gs0yQ74IdOaYxcLtJ14jSi75/LK5sM2yCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
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

U2NlbmFyaW8gY2FuIG9jY3VyIHdpdGggYW55IG11bHRpIEdQVSBhcyBpdCBuYXR1cmFsbHkgY3Jl
YXRlcyBhIHNjZW5hcmlvIHdoZXJlIG9uZSBkZXZpY2UgY2FuIHV0aWxpemUgcmVtb3RlIGRhdGEg
b2YgaWRsZSBkZXZpY2UuDQpJZiB5b3Ugd2FudCB0byBsaW1pdCB0aGUgc2NvcGUgdGhlbjoNCi0g
ZG8gdGhpcyBvbmx5IGlmIG11bHRpcGxlIGRpc2NyZXRlIGNhcmRzIGFyZSBkZXRlY3RlZCBpbiB0
aGUgc3lzdGVtDQotIG9uIHRvcCBvZiB0aGF0IHlvdSBtYXkgYWRkIGNoZWNrIHRvIHNlZSBpZiB0
aGVyZSBpcyBwZWVyIHRvIHBlZXIgY29ubmVjdGlvbiBiZXR3ZWVuIHRob3NlDQoNCg==
