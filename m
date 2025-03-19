Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E206C35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 15:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060CC10E535;
	Wed, 19 Mar 2025 15:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhlLtIRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2719A10E535
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Mar 2025 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742398206; x=1773934206;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sUyZtFWDmYqyynpJjglcYYoxlQZsyuc34X+tvsLnBRs=;
 b=VhlLtIRP1on9q06Tsyw+xfkahjjOZaxn0l6CjwbgbyPOdFz9fI1FhcYk
 JsCSoEc0ngb3I28C7a0aOVRzj0xHu9ZRJFbofQ18jVbavDc0yagcdoAjP
 fG+iFBRdKkdGznnhC5E3Z1WsAsCHusKvlu9dE3p3vGQWxeGGEqFG97f1z
 XwYvnRrb1/PzUAQlsu2uhdILDZ+XiOsQHVntYw9y41msm/qblDCGsqyFg
 E9GpyCzBUHwyCDgub9n7m+qFi5Cotq3idkPcOihVf9Acs5/dlVMZD887t
 Jpw4f+yKpWFCIgF+feYsvl1d4wsFh911U1zCSpcnRRN5ojqO7WAc0jVhD A==;
X-CSE-ConnectionGUID: EPNyu0MxQTOYfrLo2q1svA==
X-CSE-MsgGUID: hlDp1DtbSOCLU23EYT3R6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54976503"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="54976503"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 08:30:05 -0700
X-CSE-ConnectionGUID: 28oH8b9CQUGr26WrX5llNw==
X-CSE-MsgGUID: usZ44HlMTfaN0Z0tHdd7fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122600848"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 08:30:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 08:30:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 08:30:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 08:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuB1W4d33mqf5rHeoryQjSOtozoH3JleWfah64kUXAPgf4VeZa94S7yYp80v/Ey8WeYA34KJ/hHM8LWNwO5UXWx6P6lRMDj4XBKZnY3I3RVDFfm24VAo8vaFWZCB8ez/OY12FTnL0SqXIcLJuNggsH6hqGnZ9XrhFyBgr/M7JqazyhqqU8AzbxM9/VOAvfCXvQ6F0Yj3miKvbfW7Ea8+KMFYdG3l8WlkaqBEGMqV7oL7iJ5OgxhcrBAsNaMomnLoQS1yqAJRxoUPi02TxnAKw1N86nYKavRjHGFBNC2xPZHjPLiKLeE1Au+RtXAOeiB7H8FZPORiDaIWHNVxKUXXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUyZtFWDmYqyynpJjglcYYoxlQZsyuc34X+tvsLnBRs=;
 b=C3YFlj2b+CqKi+8yfo3Kmaw7/RugiQ0zWOoWkdxuzWTqTJB9q9GAN5tPjsxD2PFANUk5SDCjl0kSkCKk60XOHxig/LpE9CNTa7ibRR4BW3RMyeQ1zb926QVsc1gh3rIAooWSM4L3D6Fi6ikSsT+pbyCPntpvnFzsOjuAVYHgZ2XClfyqbnPO3azuPPBfqRqKDpqDqJdWfw6ZFzfmAhB3DG5tSy3qrdn48+KwEZ9rnRPeVlx619l7DYy24eXrmanHp8rrPVAUPIghEvVwPAZshBDY11gaM9Ygv+1uWGhUBt4IlalZLXRfjm1araKqQVSX2Te8jsowoGHmtnRRbZu3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 15:29:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 15:29:15 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Filipchuk, Julia" <julia.filipchuk@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v1] drm/xe/guc: Disable lite restore for MTL
Thread-Topic: [PATCH v1] drm/xe/guc: Disable lite restore for MTL
Thread-Index: AQHbmBCUUlfAvhz9gkChlMQFkQKXu7N49eaAgAB1SoCAASuSMA==
Date: Wed, 19 Mar 2025 15:29:15 +0000
Message-ID: <IA1PR11MB82009C2DE3B66DD32ACCB11E8FD92@IA1PR11MB8200.namprd11.prod.outlook.com>
References: <20250318141802.2516616-1-zhanjun.dong@intel.com>
 <4928bef5-a008-4af2-80ca-d7c5bddeb671@intel.com>
 <88cd142c-3369-4e05-9de3-e6970d4c1ee9@intel.com>
In-Reply-To: <88cd142c-3369-4e05-9de3-e6970d4c1ee9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: julia.filipchuk@intel.com,Michal.Wajdeczko@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB8200:EE_|MN2PR11MB4567:EE_
x-ms-office365-filtering-correlation-id: 055d6544-9e75-42e6-a492-08dd66facea7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?blp1U05QanQ1OWY2aUZESWtlTXUxYkRmR2JtaHJiQ1o3RWZLRFFoa1NZbUcw?=
 =?utf-8?B?QXNWUjloT1FTc091bnZXbTN0em1PSG4ydHpmZ2ZYR3V3KzAyZWNqbFZIOCs2?=
 =?utf-8?B?enMrazB0c04ybFN6amFTRVBBamYzTU9ib1VOcE1NVGQwRnZTREFyZjAyOStm?=
 =?utf-8?B?bmlxYngwVXptcUxJb01Qb3FZKzZHZFFoSk1vZzZsTTVXQXEvL3dIZWVIMzNW?=
 =?utf-8?B?a0RLaC8wZFhDUkVKQmkyN0VGcCtoREM3czhCbWdIMGNQa0g0TDdKeVhNRUJB?=
 =?utf-8?B?MlRMNzJBZWRoTHVMTUFad2h5bkdZaGJUYkxHRjBFc2tiSENydDRQNUtzb0pI?=
 =?utf-8?B?dnBsTStMRExzby9KWEYzWUNWNUdQNmdTdlF1NDVWYnNvaXRmYk4wS3lPdUlk?=
 =?utf-8?B?MURIVlFLUzlQa0hMRUFMd3ZaSzNBNSs2YVBCYXpNMGtCM3JIS3lqRkxIRU5Y?=
 =?utf-8?B?MjhRT3poUmFqM29Bc2RVMWwzTXNTOHpzd3Y2ODFLN1JVbnhrMEY5bHYvUk9a?=
 =?utf-8?B?UHhYSlYwVGZ5NDlydFhKSmFoQkRtSFVaalZ2OEcrSlFmc1BSZ0lXQXBDdkxW?=
 =?utf-8?B?em5wcWJvZXhsSWduV21VZ3pkZFdFRHpwd0FGL2NTZlhoeUhaZ1Ftanp6bWc1?=
 =?utf-8?B?dWtJUnE5T1VRUXNPYlBzNUdrNUNGSVJiaE9QU2pMZ0g3WEJnMExKVFRJbzdw?=
 =?utf-8?B?WllTQ0d2UDRiZFZ6VnpoejB6N3NZbnNrQ2hqdm9JSTFHbnVxbDdhYjVKV0dX?=
 =?utf-8?B?QWorOWRsVjhWc2praGpHYXFuM0l2UGJVK09saFhaSTY2YWJ2UE5mYmhJaURw?=
 =?utf-8?B?azZMRTkweFVUeHpVMUplUnJ3aWpxQmZqU3hJd1hRaU9GdWVQQVJVL2YzWlZp?=
 =?utf-8?B?VXkyVU1UZlJFL0VtNG1TUGo3cTBZMlErVVRZV0ZrV0xDVERFUDBBQkNMY2Nw?=
 =?utf-8?B?VUorYm1WRTIvWTA2cEVKZmgzRW5PUWZCODg0ZEtZN24zT1pteGcvYzdEL0ds?=
 =?utf-8?B?a3hFY2E4Z0h5NWpFVjVIZk5MWC9HdGQ5Qm9TWmZ1THVpQm8zd3QvOGdEaHlL?=
 =?utf-8?B?ek91cmp6QW8vbzVwMk5rOWMwQkJUQzB0SU5LMHJ0OXhXUm9yd21lNlpiRmhv?=
 =?utf-8?B?Nmt6VktZWDRKb2pxY1FSVjVTODlkWmZ4cmw2WTAyWVNmZnlaMXlaL2pRWUh5?=
 =?utf-8?B?TUs1a3kvUjJaVWtwbnBBWDZ2bERxUnVodjdQM0JLV2ZCWFNNSG9sT3l2QVdP?=
 =?utf-8?B?S3A3cjZmNWlVUFJCKzFuQzZoYVFEWEQ4RFk5TGwvQXMyNFRhaGJBbCtxT0pO?=
 =?utf-8?B?ZDBVaEVuKy9ERWY2MWdEckt5N1JNWWJ2Rzk4aTNOcndPbG1JaGRYalY2ckFy?=
 =?utf-8?B?OGdGUVk5MkppQThkQy85eU9mRUZ4MlVFdzgza2p1bk1qQ0NIWEdITUJoSlFC?=
 =?utf-8?B?UWpsa0p3eFp1djc3dFhQTXF1aU52eFhuaXlXUUFDYUxQcU55MXB2Qmx4L2p5?=
 =?utf-8?B?K21YZE9mM3BZSlV3UXdJV0luOEtCbkJjdnprcXBOdjAwTDFGcUpDZTlmWUxZ?=
 =?utf-8?B?M0YrSGZyWVUxTEdobE54SEtJQ01wUUs2d0N1SzN2a0xSMmlCZ0NjN0c4T2Nr?=
 =?utf-8?B?dVA0cGxBWGk0MGlJUi8vUStmZFZmVE0wOWpkZTNIeTRpakg1b2RWR0JzaHFm?=
 =?utf-8?B?cW5UVlgzQTN5RmdmdTVUR1FXQ0JkcHpFMURqMDhyakpoQWg5RlBjSkU3ZFI1?=
 =?utf-8?B?Z3dWcTljTjhyMG9TU2Nsa2NwWENqRW54Q0lhWjlFcUh5MGMxNGVWZlRBclJO?=
 =?utf-8?B?Q21UQVphS3NTUVBOM25UMGx2RGx0TlYwcTFxb2JPakRVb1FUSXFmOXNUV3hp?=
 =?utf-8?B?ejAvSHZBcjFLdmx6TmxSQmJwcG42cE9EeS9qcndaaGUrUUxLZFUyY1hDWmt4?=
 =?utf-8?Q?qbFFOYb0sGUKkvwXVhPqvbiBF63kyHJI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVo4c09venhKTzRwZGpkSEhjTXRtZXNvV1VCemtsb1pqc0tobGJiM1JhV1Vj?=
 =?utf-8?B?SnI1V1VTV1pOay9pVEZvMEVuRkRyeldrRmxKeHVsS3ZTRUZhaXJuanFTanpo?=
 =?utf-8?B?dWc3azZqeTQwRHAySHFqVERVQ0gzMWJuTWJReURxZTNhMGdmMXFza1I2czlL?=
 =?utf-8?B?Nk83NVFFMXloWTVhV2VTU2xJNUZsVHhDeHJQN1BSK0NVVkZnSHc0MGVuQVk0?=
 =?utf-8?B?MnRvYTlrUGtYaHFUNGFTQ3RXL1V1Ri9WaTFNSnArSVdQZi9kbEdlRDJiSU9G?=
 =?utf-8?B?TzJFc0RXQWhWSWYvR2dmeG1rUVplZFd4WVpjTW5tU00veDN6SVBiS3dMRk9H?=
 =?utf-8?B?WUV2VUhKeTNhWUFwTytGTFBpbGtMemZrQ3hSemtCUzhFcWxzUThTQVRvREhR?=
 =?utf-8?B?NkVMek9mT1U2ZEU2U2pGZ1ppbUFBbkVCSlJMMjZiRXFWazFGRGFkUXdvZW1m?=
 =?utf-8?B?dEp0ZDFKOVJGZlJEK3BLNHExVHE1SC9wVnlTa3lwR1duc2FpQ0VkUkhneXhF?=
 =?utf-8?B?aXpBRjFzWXpBeGp5UzNjYWMrSkRtVGJmNmJKUElFc3BXOXhrdDQ3Z1FjdlU0?=
 =?utf-8?B?U2Y0emNBR1I5MEdUYkprUlZFT2VWRTFSVUFhY1NzbEJWanhmVWV5M0pGTkxB?=
 =?utf-8?B?OG1kdXZFUnlqUFpHNkcrK01mbGJwUW9qMnNoTzNyMUN3UDFVcGJGVGhuNWZx?=
 =?utf-8?B?U3NtNWVEV2FmcjVZVVhOR0JtM1hGUkFnUU9HK0VHWWhyT0dNVm1PN2FYWHo0?=
 =?utf-8?B?b0UrNFRUeFNCbjgybTZPaWh5c281cmtOd2oxMHh3MjJyT0ZlK25jT2h2TXMz?=
 =?utf-8?B?NjlMQTR6VXpvMlN4MHdEOVlsNTh3WGRUNmFFMnY4UVNLalhBdTRocGtWS0JE?=
 =?utf-8?B?eHhPOFZUM3pPNmpNVnptRXlOU0ttbFdtK1lmRkdMSGpqTk9HcG5OQWhHS1E1?=
 =?utf-8?B?YVZFc1h5ODFmMHFJRXhvczRGSUVmT1Z6YzFaZk9mUjNrQkdqUXlGejRJbzZC?=
 =?utf-8?B?dE9PTFZPdlF0WWdkaldCZ1NCZE4vK1d6WVVGb3NzY0ZTWGttb2piYXZjcHFr?=
 =?utf-8?B?MVYvQmphTFNNRmR6TXIxRnpHZXpMWGdkUlRURkI0cnJnclFCb054TnVmRk5U?=
 =?utf-8?B?elhVanFyOGNyQzJISHNHSEgxVjdSQks0SzFlWFp5TFZNZ2xHSDUwbERPZUlt?=
 =?utf-8?B?aVFRbk16U3MybEVFZnd0bnYzdEtvU1A4Sk5xN3hKK1oyc0JqTUdDcWk4QnlI?=
 =?utf-8?B?QXJkd2lKQzBCSVB1OEJCTzFKMHkvM2tRNmxZMlRrUTZpY3BPcnJzQ0krdmc3?=
 =?utf-8?B?TlRJbmJBUHh6UGtDbWJJMXA0YTBWeGxwWEYwTlNXZGNIdkxkdXVLTksyMXpl?=
 =?utf-8?B?bzBUK0cvMUFzMG5xQXJiMUtqY28zRlh3NmdmV3E3a05nM0pOWVhKUXRuYVlO?=
 =?utf-8?B?UCtZdHUwbnJYZFJCSGxJbG5qdG9vK2JSVVdDUEl6cS9oR2N3VXFqM0g2YWJx?=
 =?utf-8?B?OGlLbUdldFQrTmp0TC82QU4rekJYUEpkbkFRMG9vMVhmU2QvWmszeVFSK2Z2?=
 =?utf-8?B?eTZ4NThySTBsaDkyOG9GRHRpMzRjUFFscEc2bEN1TjVIaStTZEhUbzdtS095?=
 =?utf-8?B?TWZ1SUJST1dHZmtXV01IbUxMVjNIZFppVDIySUNKWTVIZHlmeW1jam1GWGpL?=
 =?utf-8?B?WGZ6K08rdmJ5SmF0alplNk44cDFBekhCRURxYmc5d3NKbytsaDNTeDEvcmlt?=
 =?utf-8?B?U2NLTHdpZWMyR3dUOHVOV1pkUSs1ZmYyLzJTVTF4VjBaK1NpMnR4Qk9qeXJK?=
 =?utf-8?B?MXczNDVMN2VqdGJFWUlIdGpabWJMUFU0VHd1Ymt2b1V5NjZUZVRlN2Y3L1d6?=
 =?utf-8?B?QlhFdUNNUTh0WWUyb1ljTkl2T0xPbUVLb3FpemExMGlIalh3d25TeHAzengv?=
 =?utf-8?B?ODNzanc1L3FuYmpIYWxWcVVlSGh2R2VHWUlGOC9QeEhNcThob1o1V2RNbHN4?=
 =?utf-8?B?ckZZL09LRkp2QUVTcURka2JMWlhtTjBLSHVZcUZmOXc3cnpVTTFLU2JIMGI0?=
 =?utf-8?B?RU5PUDgra2FFem1IcFpIOCtDbTJBT09vaEFCcmhFb05EcjMyWnFLNElWcnRp?=
 =?utf-8?Q?maaeHNh+ixtGQz4MZlGij0Iar?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055d6544-9e75-42e6-a492-08dd66facea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 15:29:15.1278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQTJ9lLzearnbll7lu9/6A1EcUHEp7fA9zMflQQqDFdDdJFQx2uRnOp0Js/EubQCIkH2uAKk+XWLM07dnZqf7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
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

DQpUaGFua3MgQEZpbGlwY2h1aywgSnVsaWEgYW5kIEBXYWpkZWN6a28sIE1pY2hhbCBmb3IgdGhl
IHJldmlldy4NCg0KWWVzLCBJIHdpbGwgcG9zdCBhbm90aGVyIHJldmlzaW9uIGFzIHJlY29tbWVu
ZGVkLg0KDQpSZWdhcmRzLA0KWmhhbmp1biBEb25nDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogRmlsaXBjaHVrLCBKdWxpYSA8anVsaWEuZmlsaXBjaHVrQGludGVsLmNv
bT4NCj4gU2VudDogTWFyY2ggMTgsIDIwMjUgNTozNSBQTQ0KPiBUbzogV2FqZGVjemtvLCBNaWNo
YWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPjsgRG9uZywgWmhhbmp1bg0KPiA8emhhbmp1
bi5kb25nQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYxXSBkcm0veGUvZ3VjOiBEaXNhYmxlIGxpdGUgcmVzdG9yZSBmb3Ig
TVRMDQo+IA0KPiBPbiAzLzE4LzIwMjUgNzozNSBBTSwgTWljaGFsIFdhamRlY3prbyB3cm90ZToN
Cj4gPg0KPiA+DQo+ID4gT24gMTguMDMuMjAyNSAxNToxOCwgWmhhbmp1biBEb25nIHdyb3RlOg0K
PiA+PiBMaXRlIHJlc3RvcmUgZm9yIE1UTCBpcyBub3QgUE9SIGZvciBYZSwgdGhlbiBkaXNhYmxl
IGl0IGZvciBNVEwuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhh
bmp1bi5kb25nQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjLmMgfCA0ICsrKy0NCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiA+PiBpbmRleCBiYzU3
MTRhNWIzNmIuLjBjMjYyOWU1NzhkOSAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Yy5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiA+
PiBAQCAtODAsNyArODAsOSBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfZGVidWdfZmxhZ3Moc3RydWN0
IHhlX2d1YyAqZ3VjKQ0KPiA+Pg0KPiA+PiAgc3RhdGljIHUzMiBndWNfY3RsX2ZlYXR1cmVfZmxh
Z3Moc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+PiAgew0KPiA+PiAtCXUzMiBmbGFncyA9IEdVQ19D
VExfRU5BQkxFX0xJVEVfUkVTVE9SRTsNCj4gPj4gKwl1MzIgZmxhZ3MgPSAoZ3VjX3RvX3hlKGd1
YyktPmluZm8ucGxhdGZvcm0gPT0gWEVfTUVURU9STEFLRSkgPw0KPiA+PiArCQkgICAgMCA6IEdV
Q19DVExfRU5BQkxFX0xJVEVfUkVTVE9SRTsNCj4gPj4gKw0KPiA+DQo+ID4gcGxlYXNlIGF2b2lk
IGxvbmcgY29uZGl0aW9uYWwgaW5pdGlhbGl6YXRpb24gY29kZSwNCj4gPiBhbGwgdGhpcyBjb3Vs
ZCBiZSBkb25lIGluIGEgc2ltcGxlci91bmlmaWVkIHdheToNCj4gPg0KPiA+IAlzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSA9IGd1Y190b194ZShndWMpOw0KPiA+IAl1MzIgZmxhZ3MgPSAwOw0KPiA+DQo+
ID4gCWlmICh4ZS0+aW5mby5wbGF0Zm9ybSAhPSBYRV9NRVRFT1JMQUtFKQ0KPiA+IAkJZmxhZ3Mg
fD0gR1VDX0NUTF9FTkFCTEVfTElURV9SRVNUT1JFOw0KPiA+DQo+ID4+DQo+ID4+ICAJaWYgKCFn
dWNfdG9feGUoZ3VjKS0+aW5mby5za2lwX2d1Y19wYykNCj4gPj4gIAkJZmxhZ3MgfD0gR1VDX0NU
TF9FTkFCTEVfU0xQQzsNCj4gPg0KPiANCj4gQWdyZWVkIHdpdGggdGhpcyBzdWdnZXN0aW9uIGZv
ciBjbGFyaXR5LiBTaW5jZQ0KPiBHVUNfQ1RMX0VOQUJMRV9MSVRFX1JFU1RPUkUgaXMNCj4gdGhl
IGRlZmF1bHQgc3VnZ2VzdCBqdXN0IGNsZWFyaW5nIGl0IGZvciBNVEwgaW5zdGVhZCBvZiBhbiBl
bmFibGUtaWYtbm90Lg0KPiANCj4gCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3VjX3RvX3hlKGd1
Yyk7DQo+IAl1MzIgZmxhZ3MgPSBHVUNfQ1RMX0VOQUJMRV9MSVRFX1JFU1RPUkU7DQo+IA0KPiAJ
aWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX01FVEVPUkxBS0UpDQo+IAkJZmxhZ3MgJj0gfkdV
Q19DVExfRU5BQkxFX0xJVEVfUkVTVE9SRTsNCj4gDQo+IAlpZiAoIXhlLT5pbmZvLnNraXBfZ3Vj
X3BjKQ0KPiAJCWZsYWdzIHw9IEdVQ19DVExfRU5BQkxFX1NMUEM7DQo+IA0KPiBBbHNvLCBpZiB1
cGRhdGVkIHRoZSByZXBsYWNlIHRoZSBhZGRpdGlvbmFsIGd1Y190b194ZShndWMpIGluIHRoZSBm
dW5jdGlvbi4NCj4gDQo+IA0KPiBSZXZpZXdlZC1ieTogSnVsaWEgRmlsaXBjaHVrIDxqdWxpYS5m
aWxpcGNodWtAaW50ZWwuY29tPg0K
