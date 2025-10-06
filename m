Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEFACCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 13:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED19310E34A;
	Mon,  6 Oct 2025 13:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0sWEHiB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0579310E34A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759758158; x=1791294158;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wJg7tldx7ygLboL2GzXLVyIyGwLbZhUQ2OZ10hjQII0=;
 b=R0sWEHiBgHNscMLwJTMwX3O2sy1k3V3WcpTsLcMlL61BtElD5BOZp6au
 MUss2F6CFGqU/gLIJzq6GwoAYv0eqRKPpwKcScvds24fRiC8JHwB0Jz8o
 aKAmzGOdeDj2yASort9O3KjB9JbX+qNm2PzaDDemIo83Q+MGtvYJAAUew
 sQZtWIpRPKcNnCI4kwXP/T92g7HYCeqq36Arfmvcj3PaffAbAVKutfbaN
 41dg5Mr1vmPt7VTMa0imnmZSHIqg6aejl3jeATeyvS9w6rQOU2UX1XOlC
 o5LKdH1SvaZEhTVC5Kz52Q2H1en96KlmAD+o3TypodGalSsQV5x0ssW2F A==;
X-CSE-ConnectionGUID: nvhidh1oSnCZJ3RfJQ60cw==
X-CSE-MsgGUID: aSmRQRo9SUqKM/zTWs9W1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="73284183"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73284183"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:42:37 -0700
X-CSE-ConnectionGUID: ekwxFSekTbG/ba0EhEe/ig==
X-CSE-MsgGUID: 6b8GizaiQ4KYFEsgjjGfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179498392"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:42:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:42:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 06:42:36 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:42:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4JmIiIPZbob1TbPH6Kbn6e2uBTtFP0PTxQxhxqfaKJCIKXxCC7zEk0pDwaU1IF6N0UBPUMXlhUXZz2B6awRwg/viNWMZC/lhG3nrGvRYcHTwpH7w1cIT+MuQiqWSi2PWE62RY1yl4h0OP0M6ZSiGFIHTWoBRJZv7jQdiErGzvJtNL1MjVRcagMO8X16dR58QiSV9ry7xIfKH5R0kI/6YAlg4VMcuRgStGe1aK2rPs0zNldjshXp7NlNFPki6jIJ4gaN0l+6bKeGGLj/J76CHuIIMPwKzQ/N8PEZtCjnywPbe6p0XIfxUyBJxy6o8kP+aO/NipN+RlCWmBXzAy5NFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PjddRhVf/K6BV8bLrobF+O6Wcn2N/zosxMG8xlc/To=;
 b=Vqo7IqBAf17mU8cYCCFLavzJMEXoWXubFh1XNzCQOBQ7lYz7LYKWr3k4YZ9XHMAr3UJIb4rQYtf50xhMljyTRiPui5V/6gGc6dQjzuhHzQ1QtXG2GByOOTQ8lsUSMA913HHoDDPGK+qIgtd6HEYpy0lZUkogHGN0Zrfdrkc1U20Og/ZATyM49oHTxWcPC7UsJCOoYi8KhSmBRDgooX2flP7J6GZZiOEPwo6DuaM116j2mz2a8zttPm257yTSOSCf+LsVfV7J8G0VY+WlSCNC7thZP4YLUKCpAYFQu8DbiDmU02ujNQEj0eXcZtq+bfG+adGU/qJIk/jJHHKonviFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 13:42:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 13:42:29 +0000
Date: Mon, 6 Oct 2025 15:42:25 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
Message-ID: <20251006134225.oktwpyr4sisidmk5@intel.com>
References: <20251002171308.203127-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002171308.203127-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL2P290CA0026.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b038634-de48-45fb-98f9-08de04de31b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjhlWDlHeXZneVVnV2cyQnpVZHNXRXRJV0w2MkV0VHVJMWVIT2dlamYzQit5?=
 =?utf-8?B?VVRaRmZmNisxVDg3RzBOazBCQW5CREd6dG9pR3o1Q2Q1U2RNclYxZ0x3bXYr?=
 =?utf-8?B?Ky81MHRoeUF5U2trSFNibURZSDFmUUN5ZzVWcEZjSUNDYzRmTGNGS3hKMHpu?=
 =?utf-8?B?ZXVGdSs4WFluc1grSjk1ZDR5TERNRndLSU5iclprNGdqMTM1ejc2OHdKSzIy?=
 =?utf-8?B?TFVQS3FlTDlZU3hHOENscWNzaFNCM1ZIaEovM0FrZCtVQllIWXFxWjUvcVBh?=
 =?utf-8?B?TStZalV3cXhCSTJwWitwVFhnZjdIOXYycEZqOWtqODhQSVM4eTFDQkd3NENq?=
 =?utf-8?B?bkRJb1dSdWRqTFBuL2JYZ1l1c09WSG9JMS9GdXcrTzV4OGgxMm9KTGdzZXV1?=
 =?utf-8?B?Um1MZGNvTi9qYW5LUGpJaGR0ZUcyTUxKTmEyWGRBWnV6M2RpQ2RmMkxDSlpo?=
 =?utf-8?B?ZXhsQmxHQXV3L0JGSWN3ckxCVGs1Tm1pdXRUSm5qMkkrNEJaUjRCS0pFSzhT?=
 =?utf-8?B?ZnBhZ3NQcTBZcVJlZUNKL25sZUY2YnhlMkc2T0JIL2FiTmtRWHFZUDJ3NFF0?=
 =?utf-8?B?U0NyaENHa2N2WFFiWUZpNCtFdHo3M0oxU1ZMRWdoT1ZTZTFtQ3NXYlNXeVBi?=
 =?utf-8?B?SHRQMXRCc3pjYTFFQ1JZS3J1RG4rK2xYRStkL01TRS9NT3NPcTU4QzhUMHJW?=
 =?utf-8?B?VjUvY05XdStiQlRxSjFwTnFnUTZPYTMyUWhWVS9ENGwrQkdTR3NGenhBY1NI?=
 =?utf-8?B?MVk2NmV0UEpvUFduTm1JNkJGRm8yLzN0UVNjUjBiYkplSG9HZEhvdFdLQyti?=
 =?utf-8?B?RHJpM2RYV2syUEpoYUVxY2dJL2lMUTNQVk03R3hCS2xWTzRwM2ttczh1Tko3?=
 =?utf-8?B?T0JBenZvMkJLTVhwQmFsQ2hmNXY3WnZ0MkZ5Y0d2bm51NFZzaHlnMlpSdmJ5?=
 =?utf-8?B?eFNYQkxmL2E4bHBOOUV5dm9XSEhxdkdzeTFsYnk0YksyeVhDMklJaTVJNEFq?=
 =?utf-8?B?UHdRUVozN1ZoQVR6ZkdveW9ZbCtMbGxwV0lMRE9UN3A5Qno2SmZ1emg2WEhM?=
 =?utf-8?B?ZVo4RGkzdHA3ZGhFQXF1Y00rWm1ndEpDcEtGdGRkeVhrc2srZmZPb3RibDhk?=
 =?utf-8?B?MldzRHFsTiswSFNNOStwanJaN0k1ZG5Wd0Q1RHk2MHg5cmZ4bkRZOXQzcmkr?=
 =?utf-8?B?Q24yZVMya0VScmI4blAzOURJTnNQVm8yRENXYlB6aEJhNnVBNERnOC9KZGJV?=
 =?utf-8?B?SnFwSy9SSVh5UHdkaVFha2p0QUdNUGg0T1NyWk0zWmkzZWw0SnRjQTgvQ2Vo?=
 =?utf-8?B?MHIxSlZQM3NDNU5SekhVYUFjbUVQRzY4eXdUSWs2WGtUT3llVytFNllRKzls?=
 =?utf-8?B?alV3RWpOeHl1QW9acjE3OG5reXU4YjBPV0ZBT0d0Ymk1eGhTRnJCTy8vTVVk?=
 =?utf-8?B?Q0ptaENZMktEeHRjb3d3RWdjK2ZvZHVPVElHQ1Q0MkI1RmZaNVVTNHErK00v?=
 =?utf-8?B?WGFWRzMzWFg0b1l5RC9IdUhHUmMrNXZtS2dMQlNnVFV4RUEwdTJaOFdWWjRQ?=
 =?utf-8?B?b0lSMnhLZVp3b0gvL1IrZmpnZVBCWWFWQmRDUTAyUlVuc0ZrRlRIOVVmQitU?=
 =?utf-8?B?N2p0NnE2T28vdzdFak9tcCthbEFkbGpNcVVxa2I1N3UwV1BtZ1EwUUhBa1lV?=
 =?utf-8?B?U1Bicjd2SFJEVnZVT2lTTFVJcXprdnB5T1hwK3BLSTVsdUpjZ25DKzFsREds?=
 =?utf-8?B?SVV2QVBvMkhqYVVPSzV5UjIvZXN5TXN1emdoMTVqSmRjWVh6NTVlWWFWaFJs?=
 =?utf-8?B?R2d2dFZDMXJIVjFVVWRGNXhXVWY5UnhSZTVyL2ttamlnWWdhaEw1dkx5b2Z6?=
 =?utf-8?B?TDZReG1tSFJzWU8wdlN5MDBzMWlYdFJGRFZxVUtGNU9hajRYRWplQUwxbDh0?=
 =?utf-8?Q?H1Ot9R0fIvoiR2/PxCbk//hSdllKLDPQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RElaMk4yTXY0SjhkOFk5dUlaSjg2NFhtUHNLZ3pHbi95Zk5zSURCaUtnT05V?=
 =?utf-8?B?OHdLNEhqMWJqbmV3K2pNazN6ZWo3M1Z0aWNVS0l1cEliYXhnVlZjMEFOUU9I?=
 =?utf-8?B?cEdLUFQveWQ3WTNHRnVGMTNmYXpvNTdGY0thdHNpaVltL1cwSk1RNnVpQjk5?=
 =?utf-8?B?Qzd4eXUrTldsb3FEMjhETHgwYkJ6eGJEb2RpMUtQWGcwT21XMUxjQmdxclRy?=
 =?utf-8?B?dHpLOFB2amNoQzR6VVVKcDRJd2RCMWRJK0thTzlUdzMxbWdjT2I3bkJXTlhs?=
 =?utf-8?B?bHZkZ3drSGNwbGt4WklWQkVsSTB6SnU4ZTluWnAvcDhyMHFWQnBBdVl4L24w?=
 =?utf-8?B?d3dMdFg4a2lMMzZDNndRak0zM1NWejNJWDVMQUZJSmd1QUdNRHdMMGkxVlU4?=
 =?utf-8?B?MndYQ3hvS1VyQ2ZjcklGdi9FUGxGRXQyMVNuYThLRlk4M3NHRjdqYk9ndmlK?=
 =?utf-8?B?RVpnZEJxTzl5NmJmMkZWbkF5dUkrVnRCNUZucFFjM1d2VkFKM0ZseUViK253?=
 =?utf-8?B?eE83Q1BtRDZNYkRDdTVSMjAvUUFQMGw0Y2RJM3FqcUpvRlUvV2RydU5BMkdB?=
 =?utf-8?B?V3U2SFhzVjZDOGg0UFZHeHg0M3NuVGlhS3RhMjd5dmdjOVVqVUJUVGw2b1px?=
 =?utf-8?B?aUwyODRJMUc1eHJaQkNtODVQT0hyMkVCeUdOUkpMVW9rajk3ZWoxbWJVRG1m?=
 =?utf-8?B?Qy9YaVFBeis2UEVHRTYrUm5rSTdrUDZEeGE0Q0JLbFVLdFRpUzZtaDd5TkZm?=
 =?utf-8?B?YVZVSUdFU3VtUmpHTTJya3NMZFp2MzN4Z0NabnNrMjdsZWgrd1lVUFJKYzdI?=
 =?utf-8?B?MXVhZmJ2eFhBbzQ2Z0M4YWs5OWNsWXB3K2ZNOGs1aWdEbXNSODlRRUQ2Q1lL?=
 =?utf-8?B?ejFIMS9tZUMya21HZFg1Y0RWSlQ3d2dvaWIzRDVEbzJUcnNCNVZ4Tyt6aXQr?=
 =?utf-8?B?Y3diL3FKQVdSbGVtaGNjMGNUSFEzeWZuZko2c0lvdHZSWW1NaExtRUhNWjdN?=
 =?utf-8?B?ZkY5YmhSK2s4NnZoczc0UitHTFFFSVJZczJMNTU1citWK09JcUtjUmhYSUJj?=
 =?utf-8?B?K1VrdEpURE1RdnNjb01iS2gvZituR3ZSR2ZZSnJqMWdLQVV0d2xVcTBvVXNx?=
 =?utf-8?B?aHI2TG83QlV5WnBxUmdrcVpHWldXZGlQTmxDVzdpOGNscGxqMmJjZFNHcVdw?=
 =?utf-8?B?UERJbWllbUFqaWlEYVFjZW8ydGZRV3dIdmZZb0xzaGhhYkJQdWZnOFJsTERO?=
 =?utf-8?B?YzVydlQrU3drc2hoL2pPWjZzUjhDRDJ6UVRPT1RIaXp5bWt1VEZlSCtLRW51?=
 =?utf-8?B?aysyNnMyRExOcHkzUzI1SXBWLzhiN21VRmgrYmlkNnhYRmcwT3F5WkVhNVNO?=
 =?utf-8?B?OXQvbEZUNWFNK0pHNjgzOVlmQ2djaHlnUFNlckJnaU5aemxKMEhUVDFRbHBZ?=
 =?utf-8?B?K1o1S1pVL1RmZUJkOW5hS29Eek92Ky95Wmxka3lpT0puN1hEZ004UHUzL09R?=
 =?utf-8?B?OUVWZXEyM29PSVVUMkc5RHlSRnVycG1HbHRsanpMRDcxWWdkdUhhY3lIZU4w?=
 =?utf-8?B?RVd3RGI4REt1bVpXWmJXYnZFUGV4QjExMmVXSGlCQlUyMkFBNGR6ek5rTmZQ?=
 =?utf-8?B?TnhUYno2S2lIRVZHN3RXSU9FSjB5MGVwT251dGNBeHJFNnA3bDQ5T1R1NlNs?=
 =?utf-8?B?dHYyWndOM2hwNFN4NEwycTBrdHFVS2E5WUF4Z0RmTHl5dThkWXBvbWNCMk44?=
 =?utf-8?B?MzhVcXNFQWJEMGlHcExOcmpoT29NNjNTbHpEUHVmc1U4TnZRK1FtcGJmSUJC?=
 =?utf-8?B?aXloN2NBY2ZNalBqaVVmYVpveUViM21weEVaTzFEVndSQzZIak5yN2pWeFBN?=
 =?utf-8?B?aGt1S2NYMVV3Q1BvbndUTWREOUxSNGpleWV2UmM3WFVHcGVpc05jb2xMeWNP?=
 =?utf-8?B?cjQyRUdPZCtJL28zU1BDRGpGNlRvZ1E1OVVNRW9XL0QwVmptUWhHRlRTSUdm?=
 =?utf-8?B?SkdHQkdhYktHQVRuYlpzZllvd1pTWkNPQjJOTVBsSVlEUUZGNXBTYU1CSWNa?=
 =?utf-8?B?V3VPUzllTXN1WXJaZkVJQXIzYnh5WHhpYnpNaHp0VTFIc2dBTmxPWW5MUGtW?=
 =?utf-8?B?MHVycjFKWFVOZDdpUGRUcjZvSEExbFRSMkhiQmhya3NYdkR1eXhtaXpDbGkx?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b038634-de48-45fb-98f9-08de04de31b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:42:29.8882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDyAVMGoM1lp0jvXWo5bNck3qR8JOk4WW6S23Xi/R59HHS8LjyEg2b9Xa2S9KLy46EOuxv8DHCPPwpvDINN349bVBuPEQLnVlM6LyvV0DTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6952
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2025-paź-02 19:13:08 +0200]:
> For pure SR-IOV debugging there is no need to select already
> separated config for the debugging of the memory based interrupts,
> as the latter is also very noisy on its own. Change config order
> and use a weak reverse dependency instead.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 87902b4bd6d3..01227c77f6d7 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -40,6 +40,17 @@ config DRM_XE_DEBUG_VM
>  
>  	  If in doubt, say "N".
>  
> +config DRM_XE_DEBUG_SRIOV
> +	bool "Enable extra SR-IOV debugging"
> +	default n
> +	imply DRM_XE_DEBUG_MEMIRQ
> +	help
> +	  Enable extra SR-IOV debugging info.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> +
>  config DRM_XE_DEBUG_MEMIRQ
>  	bool "Enable extra memirq debugging"
>  	default n
> @@ -51,17 +62,6 @@ config DRM_XE_DEBUG_MEMIRQ
>  
>  	  If in doubt, say "N".
>  
> -config DRM_XE_DEBUG_SRIOV
> -	bool "Enable extra SR-IOV debugging"
> -	default n
> -	select DRM_XE_DEBUG_MEMIRQ
> -	help
> -	  Enable extra SR-IOV debugging info.
> -
> -	  Recommended for driver developers only.
> -
> -	  If in doubt, say "N".
> -
>  config DRM_XE_DEBUG_MEM
>  	bool "Enable passing SYS/VRAM addresses to user space"
>  	default n

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.47.1
> 

-- 
