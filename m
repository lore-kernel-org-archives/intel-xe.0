Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8073D1CDAC
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 00:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ACB10E19C;
	Thu,  4 Dec 2025 00:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUTFQ6Xz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914E610E19C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 00:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764808485; x=1796344485;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ur6SKvSanRD5k+CNvxyiITCDqj+lKEOIlcTiJTJJ9FU=;
 b=XUTFQ6Xz2/SHsvOS3y0XSQvXbpZ8xW+UBf9GbzykBJGa7wJzMRlf6IHL
 jVxJ2IiL1wRfd4xNAqq2s20eDxRQjwvFzMIkYIOKJb3++N4zexDq6FXmJ
 6/tRM0BfRkO4xElc5+CL68ZHyL/9GQEF/0DBTMGIcVp+E3iKoxRJ+4MJj
 qiARDmNI2Zs86hPovRvXzV4ovtsHctwKosqUU6toEeoi7bE6HcVoQjLUI
 PgJfwuSW2F0AVyD8NfdUmy3pGyeDUBlLXzUf/S10P8abVaEyIhxjQvSAE
 rSkCK2qqotYkyZMCEOas3X/CvjSbo6i1E4qcPBpdYRRgcQpftwl4V+V8c Q==;
X-CSE-ConnectionGUID: T01nOpy9SaitSj/H1mC8Mw==
X-CSE-MsgGUID: VNnBrWIMStKGs1fjGVAcTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77926233"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="77926233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 16:34:44 -0800
X-CSE-ConnectionGUID: PE+cRQBeTWucoZmb26U0qQ==
X-CSE-MsgGUID: YIJz3AUaSU2ajrf+ua5Hkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="195632549"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 16:34:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 16:34:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 16:34:43 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 16:34:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8aU/GH8DmjIERr+U6Rebk4bjdnb/skqYEC6MMQGGOnsS+b1HSao3Cgrlkf2kMpxvePeeUY6dLnrg3Ov1y+eJ8czgXJ50paudalx8bdM6cgmtqExvMJtXY5ndHtXKJm6uypaJ0h+YZhboYU1zoEnOd2WG1fIZi9EeOBgMhchgIa0Fg8weTlKEplrjMPoXrmbbwMYXWOkw4rkznauOCoh9YfpXhBXUJVgveJFNiysuPfh9a5rCxkFbGC9LjYWnRVJkXoXTYk2/EVxB1Wz/xmIILgJboufnhuIRNPY/bdeWvkt0Po57LxWR9tPI4GHy6svx8fW/GMgIZI7xMofcvOv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7oDDaDW7H2eXeZ46I09NJYE7TFUgM/3bsve77NxgOU=;
 b=mzMArtnvaZBzWHmk2tAmHPfBwcZy4oHnNZFAsNgZPrtai74Uy1dR+psHDSsKnXvq5pjK0zVJTOQIoFdRBFHxUG/S3Z57Tm31C2b+tYOohjRiqP/vMhjHa4Xqx1e6U/y6+YRpawiiXSXMurLAWhd1ft5I2MORZFNNEwnO30G4Vet/U6+3FycWgQmAWM1nT10lLMEpX/Y6QLA0UZ4TZ2NNiA5SmdgoDEI0spHg3FljPvURK8p7N3YbT84Gbs5BnzJIbjCiPm7NLTpKBWSaN8vlXLWhXRuO3DmDRsdkkWp090NEchLpO5lOWhPRSeboXeNTcOVRdH0zKvP2Um9upEG8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 00:34:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 00:34:39 +0000
Date: Wed, 3 Dec 2025 16:34:32 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [RFC 5/5] drm/xe/sc: Add system controller component for Xe3p
 dGPU platforms
Message-ID: <aTDXGBuN+fXdWu+V@soc-5CG1426VCC.clients.intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
 <20251122045803.3616201-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251122045803.3616201-12-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0382.namprd04.prod.outlook.com
 (2603:10b6:303:81::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 17aa0af1-643f-4b7c-289d-08de32cce872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1ZEQjlKZW9veDNKREtVUXFSRlUzODBmYWYva09mVzJrVXBVVmhwUFlBRUU4?=
 =?utf-8?B?Tm16OXduUVFSK0xGRkZWc0FQbTlDYTA0clVNU2xwTUtsLzU4R2pFUFhmdUV2?=
 =?utf-8?B?RFJjVGpINW9VWTFNcUliRzNZWFl2S2kzdmlnUjFhcUpHbEVtM2h0VkNwK1hI?=
 =?utf-8?B?VjdteDRPNENIN01ZUTBuWVlIMzFFZHNpaDJUblF6Yk9Ud2pZb28wY0RQN1c0?=
 =?utf-8?B?KzRBemRXMWpOSnZRWTNkVlVVckhLM3llYWRtUFp4bDJiRmo1WktSQktucDdZ?=
 =?utf-8?B?alNWNDQxV3hFT3FxSWdpUnd1ejExV3pWdmFjdGpWbjdXbkFvMm9tT2wxUzBN?=
 =?utf-8?B?aDlhOUJRQ3pwdnp1MkUveWpkd1FpRml4d0Q3dG9xYnNYZk5FelhiNzF6a2gr?=
 =?utf-8?B?RE9rckJadGZYYk1sZHRPQTlVV3hWNDNYNTl5K01nem5mendlc2dGM0d4dDha?=
 =?utf-8?B?STNzQ3VUckNtZUdiVzNwZjdkYW1MczluVnFnV3dTOWc5Nk1rWXF5bGFyZDNF?=
 =?utf-8?B?QzlielNibkl6bi8zcTVDdTdGemN6K0F0eS9XSVZPN1RBaVRLV0NHY1BsM1Rs?=
 =?utf-8?B?TmpJTjdYTDlvdW5jY3EzZS80MnlPUEtwK2x2Z0FER2RhUjRNK2pJMUtqV1d1?=
 =?utf-8?B?b0c0VVU2eHdlcDVXbGJYR3d6WEZObDVkK3pVeTcrcTA2N0I0eHVPZ2NKT3VS?=
 =?utf-8?B?OE9UZlZqY1hnSFJ4V0QwRzNoazQzU0tDUWNjL2I5aE1CS2pnR0xhVFBBZE55?=
 =?utf-8?B?RWZWUjllOS9NUDZKTExlcE5kWXN4TWN5aiswZThtbkhRS1pSbXNIbEt6Skp4?=
 =?utf-8?B?bzgrbGVxKzhmTU8rZm5SRkxlYnAwakJsM2tPN2ZrVG8xNzRmS0JxZmlERXhE?=
 =?utf-8?B?ZFRzOTQ5QWFSUnhqOCtscTZsUXBsbG4wWlBmQmZPK0M4TjJ0TXNRdmVGVWk0?=
 =?utf-8?B?eUlyVFNRKzNpZCtPSGZYbGYvUHRXK3BKeVJ0S3drWW5vc01nb3RTWDZBMWh6?=
 =?utf-8?B?b1lXaktjaFpEd0xZMkxRRm43S0lJRXpiR2ZVUlRxYXVZTmxMNzVITlR0SHY0?=
 =?utf-8?B?SVc0a2dLL09kVElqWHJRcVloUHp0ZVF0NWs5R3A5SFdkV1NSM3VYS1BpU2JF?=
 =?utf-8?B?ZFBLMzlDUVdjUTl0bEFaYXpmTDdZRXphbGQxWFAxM0xLVXN4Y3lnVE94OG9E?=
 =?utf-8?B?QTRUN1NjMTBJOUIwUE45WFlIZlRHd2N3eXkwNE5lcGtrM0tEalJNZlBIaWJF?=
 =?utf-8?B?OENRYk9HV1ZmUmFheG40cTUyU2t4WU8waXc1dmZTdnRBcko0cngwZ2M5SU56?=
 =?utf-8?B?YmtEc21LczRCL3FFL1c0MUMwWEt3czIwbHNjU1dDSDhKdHc4NVpqc091Y1B3?=
 =?utf-8?B?ajRRSXl6b0x4WkFsSGxSVGtrdS9kOElIUy8vK05wZVJzU2pCSVdwelJteFgr?=
 =?utf-8?B?MXhrTWltWEVocHZ6TXFmbXRSSXh6UEFNaXRla1hEdXpEQ2pMRVpicWN2SERB?=
 =?utf-8?B?YmVZcEQ2SURLNFFRVmtweFR1OHk0ZGhXNi94ejV2U0pQcWpNbHdGNmxhZmVB?=
 =?utf-8?B?YkVaRXN6aEJHakxOWUxwUHVMRzFSZUdBOFVpdGZEbTMydjNYaGg0V1l6RHh5?=
 =?utf-8?B?ZFgrSXB2eURSdWxuaDE1MjhUZEZaeFFZNU0xOXdHYVlSVVU3MVN5OGFVeHlU?=
 =?utf-8?B?NWdDaXBMQzJRaXJ2UGEwdUt5cXR4R0hjeVV6Y1FLeXIvQW9qdXRsbDBNZlVu?=
 =?utf-8?B?b0tZcEVRYTdVdXlzWWQzVXl2WmREV2xrdE0xb3FEc05UdDFaZWU0RWh1VWRL?=
 =?utf-8?B?UUJQOWd6QWJJaktXZUtrZTQzRFFQSldHbk5rM25MTXM4aG9YVnZJU2hGVkhV?=
 =?utf-8?B?ZGVNdjFtSzl4SERWR1M0UWl5QU1tMk14a3JIclBqTjR1MEp0UU5yZDZKcXI4?=
 =?utf-8?Q?aaHP5G9cdrfH2uCYzOadQZKuwuJ3eGja?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M29xdFYvYit1YitOOEVRNnR2a1BhVVo0bFNOVTFkb3BYZmFZWU9DNFB1UnF6?=
 =?utf-8?B?VThZdFNrZWtxeVpDdEx1eVFTMXVnREV5cURzK0VuekFoKytzS3BtYlloQ0VC?=
 =?utf-8?B?NVRuZ24waWFaN2ZHUG1zKy9lbFp2OU5IVllzZHVhYkFFWHduYlplTFdZWEhY?=
 =?utf-8?B?S1YvWnZ5bURJZkY5cHJKZ3RtUDdkRVB4dmh2WHN3dUFMU3crMDd5emhHZmNo?=
 =?utf-8?B?NmVkblI5UG9nNjkvNVBWL2Y3aUt2d3MzWEVXay9HWUJ0SWxIN1F2bmFTTGFG?=
 =?utf-8?B?MlVkcStNT2JLUjRUZXZzRmFzWEgrakpWbG5IWmVpNit3SktDcW1HRFBuaC9i?=
 =?utf-8?B?OFFZeGZuUnNaaDRUUzNmV3lQQ1RVTzQzaVg4Tnp6T2U0MzQ5ekUyVk5XakFo?=
 =?utf-8?B?cTJRRkVWZXE4dFgvSk11SStEYlFpaTdnNjBJLytTWnVFUEhBUitMSkczeFRJ?=
 =?utf-8?B?UUUvNEwvMExPeG1JazhWWDl6M1kybE80N3psU1ZobUtBL0MxZWFZNkVDTE8x?=
 =?utf-8?B?WmpOOG1SOXZjcjU4akJVRXJjQmVHMUVRdjllbjB0VUlhMDloUGZpbml6ekgy?=
 =?utf-8?B?bk4raWVUbmhPaFVkL0YxZ3kzWVhIb2dFUTRkRXZIbGNNbXErZHVOdWpIZU1m?=
 =?utf-8?B?aUphTW9FcEpYNGtlbGQzUlQ5dFlNTUJHT2RSQlhTWTkzQjZSOHlCTWFndFlx?=
 =?utf-8?B?dUZULzR5OGEyUURTUnlCaVFlRjQ2RTFXRE9NTUVuQUR3K1V0bDVucTgyRXE5?=
 =?utf-8?B?VnA4eU9YYnpiTzJidWNjV3NzMnl5WE1VMnYrTnBDbnJ2cVZrMlE2a0s5aUxu?=
 =?utf-8?B?aVhheFJ3SW96Ry9MK29YTmgydVIvWDJrRXVhRE1VSm5DSW9FSWdZSjBacjBr?=
 =?utf-8?B?V3h5ZWNNSS8xaVFyUU5vSjlMTzlZSWJnTnVtZnd3cG8zZWo2UWlPdWQ1RTJI?=
 =?utf-8?B?S0VpSldUMDJYTklRMVpQR09VV2QxdkVFWlVhT3huUmJ2UjgzaDR3ZVgraDl5?=
 =?utf-8?B?d3RROFo0L1grL0l1S0p0Z3JwRklzZnJOMFV0aHQrZlh4THBCM2hycnBBOUpV?=
 =?utf-8?B?TU9qVTF0ZGV4QXBUQm4wUTU3SktSZE01TWQ3QU5TVmEvVC90dDhZRU9yYzR4?=
 =?utf-8?B?ZG9SVjBzRXBYdkovVjVadXRBYnVnNWVwOEkwb1FEVGRINitDTGhWYXVrN29Y?=
 =?utf-8?B?NEE2WnJ6b0hUZVB5c0IyTGVhaTIrYmpIcDRwZUhhazV6NnROY0xZWE5JVzFT?=
 =?utf-8?B?aFpMTEVtb0JtTTdXb2xzQmRLcVdFR0VSM2xXZW1kYURPRVhZZ0pjZ0k5YVBL?=
 =?utf-8?B?K1A3a2ljcGVVd3QyNWNwaWpWZDNmM3dMNFVWTUp0THdvZlcrSXZQOWZMRzJV?=
 =?utf-8?B?WlRtOW9PMVJEbUw2dnk0SFVId0czSFIxWGhCTG1RMW9wWFRrRXFIbTh3UHpk?=
 =?utf-8?B?dnJwa3dJZmcrMGdnMWJVNWZyYy81MHU2M2JZNjdmUkdCbEk2WFh4ckxXTWxa?=
 =?utf-8?B?QjB0SmVwbmdiOU8vSFNIelBYaXZ5U1o4UEM0SnBhZCs2N1FuOHJvMzNGR1Jp?=
 =?utf-8?B?SVkvdTFRVlFNdmhZK2gxYVJhdXhCaFFMNDlrNnZVOGxJaGdNZTlxVEx4RW5F?=
 =?utf-8?B?R2JCb0lKcDBtakg4cTFEcEVrUjlweXM3N0RyVU9lNzVnV1hEYlJTSGRTY1Bm?=
 =?utf-8?B?bXZHQWovSnNWTFppS0RaVUJIUFk4a21GWmFlbHpNaVRtb2xjdEdZRlJhZmI1?=
 =?utf-8?B?MDVpalBJd0JRNWxOSDVkRVorS2p2S3ZFTDdKYWFrNWRpb2Z0UGZpOGIyK0ZJ?=
 =?utf-8?B?aVhoNStOQmRmS0JtVXYxdDRYcTZRL29qcHRZNlhtR0lVd2ZLS0RRY1JOSHlM?=
 =?utf-8?B?T2hYUUQwWm9reE9CV3BVNzRaTG9VUWpKVWJkS0NHZnp0NzBBYkMxNDlKUG9q?=
 =?utf-8?B?cE1hWm9Vd3g1U2xqTHRWY2pXSXFsOGZDSGlUVkdQTnlEWkMrUEFzZVpyZm9z?=
 =?utf-8?B?S0E3Tlo1Wkp6azFERlYxZDQyR2VSZVZHbVpDMTh5eW1Kd2gzNHhVelk1SVlk?=
 =?utf-8?B?UGVHaVp1MzJCclRGKy9nSDh0cWJuQjZEZnVTcFg5RlFwU1ZHbnZJejRsMyto?=
 =?utf-8?B?SXNzaEU4ZjkvWml6c2JSRjBxMGhsY2JNVFFSbjVmcWxsQjlqaGg5aE92dDdZ?=
 =?utf-8?Q?QXFu9kuN0+SgfMhx8btoPKs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17aa0af1-643f-4b7c-289d-08de32cce872
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 00:34:39.1456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjZqtpZCByGvTiBe3U/BB14UM9+91OKMvBPl8o2456pAvIyCPoHyRYV1mjgEsr1C4xivekHiEH2L46pZ/Ac7fwQl1Zm0f0Z68SEwZHUaaEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
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

On Fri, Nov 21, 2025 at 08:58:07PM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add a new system controller (SC) component for Intel Xe3p dGPU platforms.
>
>This component provides the foundational infrastructure for communication
>with the SC firmware using the MKHI protocol over a mailbox interface.
>
>Key features introduced:
>- Detection and initialization of the SC interface on Xe3p dGPU platforms
>- Mailbox communication with SC firmware
>- Fragmented message transfer for large command payloads
>
>This implementation establishes the base for future SC feature
>enablement and firmware command handling.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
> drivers/gpu/drm/xe/Makefile          |   2 +
> drivers/gpu/drm/xe/regs/xe_sc_regs.h |  49 ++++
> drivers/gpu/drm/xe/xe_device.c       |   5 +
> drivers/gpu/drm/xe/xe_device_types.h |   5 +
> drivers/gpu/drm/xe/xe_sc.c           |  89 +++++++
> drivers/gpu/drm/xe/xe_sc.h           |  15 ++
> drivers/gpu/drm/xe/xe_sc_mailbox.c   | 374 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sc_mailbox.h   |  61 +++++
> drivers/gpu/drm/xe/xe_sc_types.h     |  35 +++
> 9 files changed, 635 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_sc_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_sc.c
> create mode 100644 drivers/gpu/drm/xe/xe_sc.h
> create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.c
> create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sc_types.h
>

[snip]

>+static void sc_mb_clear_response(struct xe_sc *sc)
>+{
>+	xe_mmio_write32(&sc->mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT);
>+}
>+

... continued from previous review

>+static int sc_mb_prepare_command(struct xe_sc *sc,
>+				 const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
>+				 const void *data_in, size_t data_in_len,
>+				 u8 **cmd_buffer, size_t *cmd_size)
>+{
>+	struct xe_sc_mailbox_mkhi_msg_hdr mkhi_hdr = {0};
>+
>+	mkhi_hdr.group_id = msg_hdr->group_id;
>+	mkhi_hdr.command = msg_hdr->command & 0x7F;
>+	mkhi_hdr.is_response = 0;
>+	mkhi_hdr.reserved = 0;
>+	mkhi_hdr.result = 0;
>+
>+	*cmd_size = sizeof(struct xe_sc_mailbox_mkhi_msg_hdr) + data_in_len;

I recommend using local variables for command size and command buffer 
and update the pointers passed (cmd_size and cmd_buffer) just before 
returning success from this function. That way, when you return an 
error, cmd_size and cmd_buffer are untouched.

>+	if (*cmd_size > SC_MB_MAX_MESSAGE_SIZE) {
>+		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (max %u)\n",
>+			*cmd_size, SC_MB_MAX_MESSAGE_SIZE);
>+		return -EINVAL;
>+	}
>+
>+	*cmd_buffer = kmalloc(*cmd_size, GFP_KERNEL);
>+	if (!*cmd_buffer)
>+		return -ENOMEM;
>+
>+	memcpy(*cmd_buffer, &mkhi_hdr, sizeof(struct xe_sc_mailbox_mkhi_msg_hdr));

why not just use a pointer for mkhi_hdr and allocate cmd_size bytes for 
it? Then you can just fill that with the mkhi header values and then 
memcpy the data_in. Finally you can assign that pointer to cmd_buffer.  
That way only one memcpy is required (for data_in). Something like:

struct xe_sc_mailbox_mkhi_msg_hdr *mkhi_hdr;
size_t size = sizeof(*mkhi_hdr) + data_in_len;

mkhi_hdr = kmalloc(size, GFP_KERNEL);
if (!mkhi_hdr)
	return -ENOMEM;

mkhi_hdr->group_id = msg_hdr->group_id;
mkhi_hdr->command = msg_hdr->command & 0x7F;
mkhi_hdr->is_response = 0;
mkhi_hdr->reserved = 0;
mkhi_hdr->result = 0;

if (data_in && data_in_len)
	memcpy(mkhi_hdr + 1, data_in, data_in_len);

*cmd_size = size;
*cmd_buffer = (u8 *)mkhi_hdr;

>+	if (data_in && data_in_len)
>+		memcpy(*cmd_buffer + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
>+		       data_in, data_in_len);
>+
>+	drm_dbg(&sc->xe->drm, "SC: request: group=0x%02x cmd=0x%02x payload=%zu bytes\n",
>+		mkhi_hdr.group_id, mkhi_hdr.command, data_in_len);
>+
>+	return 0;
>+}
>+
>+static int sc_mb_send_frames(struct xe_sc *sc, const u8 *cmd_buffer,
>+			     size_t cmd_size, unsigned int timeout_ms)
>+{
>+	u32 ctrl_reg, total_frames, current_frame;
>+	size_t bytes_sent, bytes_to_send;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
>+	if (total_frames > SC_MB_MAX_FRAMES) {
>+		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (%u frames, max %u)\n",
>+			cmd_size, total_frames, SC_MB_MAX_FRAMES);
>+		return -EINVAL;
>+	}
>+
>+	if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		drm_err(&sc->xe->drm, "SC: Mailbox busy (RUN_BUSY timeout)\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+
>+	drm_dbg(&sc->xe->drm, "SC: Sending message: %zu bytes, %u frames, phase=%u\n",
>+		cmd_size, total_frames, sc->phase_bit);
>+
>+	bytes_sent = 0;
>+	for (current_frame = 0; current_frame < total_frames; current_frame++) {
>+		bytes_to_send = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
>+
>+		sc_mb_write_frame(sc, cmd_buffer, bytes_sent);

if bytes_to_send is less than 16, you are still writing 16 bytes in
sc_mb_write_frame. Wouldn't that go beyond the command buffer? Maybe you should
pass bytes_to_send to sc_mb_write_frame?

>+
>+		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
>+			   FIELD_PREP(MKHI_FRAME_CURRENT, current_frame) |
>+			   FIELD_PREP(MKHI_FRAME_TOTAL, total_frames - 1) |
>+			   FIELD_PREP(MKHI_FRAME_COMMAND, SC_MKHI_COMMAND);
>+		if (sc->phase_bit)
>+			ctrl_reg |= FIELD_PREP(MKHI_FRAME_PHASE, 1);
>+
>+		xe_mmio_write32(&sc->mmio, SC_MB_CTRL, ctrl_reg);
>+
>+		drm_dbg(&sc->xe->drm, "SC: Sent frame %u/%u\n",
>+			current_frame, total_frames - 1);
>+
>+		if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			drm_err(&sc->xe->drm, "SC: Frame %u acknowledgment timeout\n",
>+				current_frame);
>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += bytes_to_send;
>+	}
>+
>+	drm_dbg(&sc->xe->drm, "SC: All frames sent successfully (%zu bytes)\n", bytes_sent);
>+	return 0;
>+}
>+
>+static int sc_mb_validate_response_header(struct xe_sc *sc,
>+					  const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
>+					  const struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr)
>+{
>+	if (!resp_hdr->is_response ||
>+	    resp_hdr->group_id != msg_hdr->group_id ||
>+	    resp_hdr->command != (msg_hdr->command & 0x7F)) {
>+		drm_err(&sc->xe->drm, "SC: Invalid response header\n");
>+		return -EPROTO;
>+	}
>+
>+	if (resp_hdr->result != 0) {
>+		drm_err(&sc->xe->drm, "SC: Firmware error: result=0x%02x\n",
>+			resp_hdr->result);
>+		return -EIO;
>+	}
>+
>+	drm_dbg(&sc->xe->drm, "SC: response: group=0x%02x cmd=0x%02x\n",
>+		resp_hdr->group_id, resp_hdr->command);
>+
>+	return 0;
>+}
>+
>+static int sc_mb_receive_frames(struct xe_sc *sc,
>+				const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
>+				void *data_out, size_t data_out_len,
>+				size_t *bytes_received, unsigned int timeout_ms)
>+{
>+	u32 ctrl_reg, total_frames, current_frame;
>+	size_t payload_size;
>+	int ret;
>+
>+	*bytes_received = 0;

This function could use some refactoring. Maybe something like:

do {
	ctrl_reg = xe_mmio_read32(&sc->mmio, SC_MB_CTRL);
	current_frame = FIELD_GET(MKHI_FRAME_CURRENT, ctrl_reg);
	total_frames = FIELD_GET(MKHI_FRAME_TOTAL, ctrl_reg) + 1;

	if (frame0)
		process_first_frame(ctrl_reg, current_frame, total_frames);
	else
		process_other_frame(ctrl_reg, current_frame, total_frames);
} while (current_frame + 1 < total_frames);


>+
>+	do {
>+		ctrl_reg = xe_mmio_read32(&sc->mmio, SC_MB_CTRL);
>+		current_frame = FIELD_GET(MKHI_FRAME_CURRENT, ctrl_reg);
>+		total_frames = FIELD_GET(MKHI_FRAME_TOTAL, ctrl_reg) + 1;
>+
>+		drm_dbg(&sc->xe->drm, "SC: Receiving frame %u/%u\n",
>+			current_frame, total_frames - 1);
>+
>+		if (current_frame == 0) {
>+			u32 temp_frame[4];
>+			struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr;
>+
>+			sc_mb_read_frame(sc, temp_frame, 0);
>+			resp_hdr = (struct xe_sc_mailbox_mkhi_msg_hdr *)temp_frame;
>+
>+			ret = sc_mb_validate_response_header(sc, msg_hdr, resp_hdr);
>+			if (ret)
>+				return ret;
>+
>+			payload_size = SC_MB_FRAME_SIZE - sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);

sizeof(*resp_hdr) should do. If payload size is always a constant (16 - 4), then
#define it as a constant.

>+			if (payload_size > data_out_len) {
>+				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
>+				return -ENOSPC;
>+			}
>+
>+			memcpy(data_out,
>+			       (u8 *)temp_frame + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),

same here sizeof(*resp_hdr);

>+			       payload_size);
>+			*bytes_received = payload_size;
>+		} else {
>+			size_t frame_size = SC_MB_FRAME_SIZE;
>+
>+			if (current_frame == total_frames - 1) {
>+				size_t total_response = (total_frames - 1) *
>+							SC_MB_FRAME_SIZE +
>+							sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
>+				size_t remaining = total_response -
>+						   *bytes_received -
>+						   sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
>+				frame_size = min(frame_size, remaining);
>+			}
>+
>+			if (*bytes_received + frame_size > data_out_len) {
>+				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
>+				return -ENOSPC;
>+			}
>+
>+			sc_mb_read_frame(sc, data_out, *bytes_received);
>+			*bytes_received += frame_size;
>+		}
>+
>+		sc_mb_clear_response(sc);
>+
>+		if (current_frame + 1 < total_frames &&
>+		    !sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+			drm_err(&sc->xe->drm, "SC: Response frame %u timeout\n",
>+				current_frame + 1);
>+			return -ETIMEDOUT;
>+		}

Assuming that the FW is not setting SC_MB_CTRL_RUN_BUSY_OUT on the last frame.
OR Are you intentionally skipping waiting for it? 

Umesh

>+
>+	} while (current_frame + 1 < total_frames);
>+
>+	return 0;
>+}
>+
>+static int sc_mb_send_command(struct xe_sc *sc,
>+			      const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
>+			      const u8 *cmd_buffer, size_t cmd_size,
>+			      void *data_out, size_t data_out_len,
>+			      size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	size_t bytes_received;
>+	int ret;
>+
>+	if (rdata_len)
>+		*rdata_len = 0;
>+
>+	ret = sc_mb_send_frames(sc, cmd_buffer, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out) {
>+		drm_dbg(&sc->xe->drm, "SC: Command completed (no response expected)\n");
>+		return 0;
>+	}
>+
>+	if (!sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		drm_err(&sc->xe->drm, "SC: Response timeout (RUN_BUSY_OUT not set)\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ret = sc_mb_receive_frames(sc, msg_hdr, data_out, data_out_len,
>+				   &bytes_received, timeout_ms);
>+	if (ret) {
>+		sc_mb_clear_response(sc);
>+		return ret;
>+	}
>+
>+	if (rdata_len)
>+		*rdata_len = bytes_received;
>+
>+	drm_dbg(&sc->xe->drm, "SC: MKHI message completed: %zu bytes payload received\n",
>+		bytes_received);
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sc_mailbox_send_command - Send command to System Controller via mailbox
>+ * @handle: XE device handle containing the system controller
>+ * @cmd_buffer: Pointer to xe_sc_mailbox_command structure
>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>+ *
>+ * Send a command to the System Controller using MKHI protocol. Handles
>+ * command preparation, fragmentation, transmission, and response reception.
>+ * Optimized to move memory allocation outside the critical section.
>+ *
>+ * Return: 0 on success, negative error code on failure
>+ */
>+int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
>+{
>+	struct xe_device *xe = handle;
>+	struct xe_sc *sc;
>+	struct xe_sc_mailbox_command *cmd = cmd_buffer;
>+	u8 *command_buffer = NULL;
>+	size_t command_size;
>+	int ret;
>+
>+	if (!xe || !cmd)
>+		return -EINVAL;
>+
>+	sc = xe->sc;
>+	if (!sc)
>+		return -ENODEV;
>+
>+	if (!cmd->data_in && cmd->data_in_len)
>+		return -EINVAL;
>+
>+	if (!cmd->data_out && cmd->data_out_len)
>+		return -EINVAL;
>+
>+	might_sleep();
>+
>+	ret = sc_mb_prepare_command(sc, &cmd->header, cmd->data_in, cmd->data_in_len,
>+				    &command_buffer, &command_size);
>+	if (ret) {
>+		drm_err(&sc->xe->drm, "SC: Failed to prepare command: %d\n", ret);
>+		return ret;
>+	}
>+
>+	mutex_lock(&sc->cmd_lock);
>+
>+	xe_pm_runtime_get(xe);
>+
>+	ret = sc_mb_send_command(sc, &cmd->header, command_buffer, command_size,
>+				 cmd->data_out, cmd->data_out_len, rdata_len,
>+				 SC_MB_DEFAULT_TIMEOUT_MS);
>+	if (ret)
>+		drm_err(&sc->xe->drm, "SC: Mailbox command failed: %d\n", ret);
>+
>+	xe_pm_runtime_put(xe);
>+
>+	mutex_unlock(&sc->cmd_lock);
>+
>+	kfree(command_buffer);
>+
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.h b/drivers/gpu/drm/xe/xe_sc_mailbox.h
>new file mode 100644
>index 000000000000..d5ca43c40f1a
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sc_mailbox.h
>@@ -0,0 +1,61 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef __XE_SC_MAILBOX_H__
>+#define __XE_SC_MAILBOX_H__
>+
>+#include <linux/types.h>
>+
>+struct xe_sc;
>+
>+/**
>+ * struct xe_sc_mailbox_mkhi_msg_hdr - MKHI protocol message header
>+ */
>+struct xe_sc_mailbox_mkhi_msg_hdr {
>+	/** @group_id: Message group identifier */
>+	u32 group_id    : 8;
>+	/** @command: Command identifier within the group */
>+	u32 command     : 7;
>+	/** @is_response: Response flag - 0 for request, 1 for response */
>+	u32 is_response : 1;
>+	/** @reserved: Reserved field, must be zero */
>+	u32 reserved    : 8;
>+	/** @result: Result code from firmware */
>+	u32 result      : 8;
>+} __packed;
>+
>+/**
>+ * struct xe_sc_mailbox_app_msg_hdr - Application message header
>+ */
>+struct xe_sc_mailbox_app_msg_hdr {
>+	/** @group_id: Application group identifier */
>+	u32 group_id  : 8;
>+	/** @command: Specific command within the application group */
>+	u32 command   : 8;
>+	/** @version: Protocol version */
>+	u32 version   : 8;
>+	/** @reserved: Reserved field, must be zero */
>+	u32 reserved  : 8;
>+} __packed;
>+
>+/**
>+ * struct xe_sc_mailbox_command - System Controller mailbox command structure
>+ */
>+struct xe_sc_mailbox_command {
>+	/** @header: Application message header containing command information */
>+	struct xe_sc_mailbox_app_msg_hdr header;
>+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
>+	void *data_in;
>+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
>+	size_t data_in_len;
>+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
>+	void *data_out;
>+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
>+	size_t data_out_len;
>+};
>+
>+int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
>+
>+#endif /* __XE_SC_MAILBOX_H__ */
>diff --git a/drivers/gpu/drm/xe/xe_sc_types.h b/drivers/gpu/drm/xe/xe_sc_types.h
>new file mode 100644
>index 000000000000..5ec2126cebe4
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sc_types.h
>@@ -0,0 +1,35 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_SC_TYPES_H_
>+#define _XE_SC_TYPES_H_
>+
>+#include <linux/completion.h>
>+#include <linux/mutex.h>
>+#include <linux/types.h>
>+#include <linux/workqueue.h>
>+
>+#include "xe_device_types.h"
>+#include "xe_sc_mailbox.h"
>+
>+struct xe_device;
>+
>+/**
>+ * struct xe_sc - System Controller driver context
>+ */
>+struct xe_sc {
>+	/** @xe: Back pointer to xe_device */
>+	struct xe_device *xe;
>+	/** @mmio: MMIO region for SC registers */
>+	struct xe_mmio mmio;
>+
>+	/** @cmd_lock: Mutex protecting mailbox command operations */
>+	struct mutex cmd_lock;
>+
>+	/** @phase_bit: MKHI message boundary phase toggle bit */
>+	u32 phase_bit;
>+};
>+
>+#endif /* _XE_SC_TYPES_H_ */
>-- 
>2.43.0
>
