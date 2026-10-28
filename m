Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEEE606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VhjFc63U
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A60B10FD49;
	Wed, 28 Oct 2026 15:23:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4708710FD49
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793200990; x=1824736990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wMtXVwx/VWDEpqJswGx692LPG/3daU4CoAj4z3PeOfU=;
 b=VhjFc63U3aleIZ3qO/O0P5+UprAAa+o8cD9aA7b8xdeSAmIshbVCpKk4
 pHULbtT6Mwel4rTKxK3/eup52Ber2mXNSJARDn6Ktk56d2RWYi2MqK3gw
 muuuKvMBBQr9bVD4yXhwsWZfFUTygSCyuTqPJv5r3xvLDNr90hKOYgGS8
 brNyiS16iEzYFhjnrfKCRgaNrN0HFHbHHAGZ0hGwzWw0jgMTDnACrY6nh
 fdy9FDlBisrwn5ilYlz1n8YihO3Z1s5d3TsUIOZGwaFeG8tjrjAdfyTlp
 YtdggkYtx7JWKC3WHItEklv8r/P2IwtVXHzp79ffzTjsK8VCFuU4meS3I w==;
X-CSE-ConnectionGUID: JhR0JqjnTe+cxx6IV79ivA==
X-CSE-MsgGUID: 1ZfbfPM9Q4GsjmGGmRo1ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1807457"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1807457"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 08:23:09 -0700
X-CSE-ConnectionGUID: k48DW+nCSzK59kir9tz8NA==
X-CSE-MsgGUID: 08sBr7q5QHOk3Mjc1Dfqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5240302"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 08:23:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:23:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 08:23:08 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 08:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNrrbzYboLHnC14E+QIafB7baLgY/AXfWdjFnxOrPgQ+myjEVtbB1thXT+Rh+EjzEjE4aHf+9cD/k/ahk5/Zy00kqRlwdPyPVB5Kze/432QgUrQWzi+H4YdVpWqNHN7BVbfAmwBSrWTavQBEA/UTXPrz2+cZWEwi8ErX3sgBApB2QvVhUOXIGqoD21P0jPikwQaB80XLOYAZFHdQ2AfdKtkluPhM0TG0ZEux3EDpBurw9MfSMUgyNjZj/eFutGWS35xEJh2DECewW9BLKrI7vZK60r52qTzbaXXHMyDCOgMB3Azu8IPVBt/67zIzJeM8esLl0pG7cok6XbFY5WeuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wagHhD9Tj0Ri3BLLvLraWQJdAV+j634sHYZSbpPrebc=;
 b=BVyg1VrIPRSpU76zY+fQ7a4DXfsgOvTYyio6B5CxNpj7PtAcJ6qXrcoNP6ehZIa3kcMkZI0baYQ4ZJLM8dwEUYi6LgYykJUjADlwQXhASdQqum7EW3bkKZd0k3xLTW/+nCGuJ0s5BGeZFAlC+uksf04vtcM+Hw3XQii5VpvmmBrTn+0r111snvwoZnMRjPuXNu8MosmIbEfugaOOmuYF6+SIiK67GBREoFqWC/CyhAv/whYRDQmppBlE+p3CJbzwLk1rC7GnSEb2TexrecdRJ0YpLNr3b1SpVkD6JHT63s5qnr52DUwNL28Hxhl7z3Pi9oLPeH4u24wNvecx4Eh/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 15:23:06 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:23:05 +0000
Message-ID: <4e1c6939-f54c-4dab-ad3c-35f7456f72f5@intel.com>
Date: Wed, 28 Oct 2026 16:23:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
 <20261021085716.709503-5-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20261021085716.709503-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0042.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:356::17) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 340e93c2-308b-4fad-d7bf-08df35075d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|261022105027099003|261022075727099003|261026121527099003|261026140227099003|10067099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: E/1Ov/z9L/JrlozLvM2yBMaCW+4EMBNn30cDLarwmmOytyTJy2B8Nj0vkpKBixD4wqZO68OOcfXibQNjdtSBcQiBNaR1tCDyWdBIaz4b87hXuPOp7X1fYGygiq8h+FCa9x59/aZPNugen4H57Ix80Of2N8WSoKJbG89swQR0fZSAJ71Pl0BpuoIcYVQ7J7758NswO1sOHyP1LhE4GFM92tT2zjL7rXHty9dSnrepKKkaL1yNk2jSJbteNAZFAqdTySSZj9hweOCusR5t14wzrDJfNreF74bWBJGOnxw0PLbbNVitiKPbdDq5D3/0goyoaAtnJGg2vZa4/Htl1HVxsDgJT8C2rkfyIPkK1iBRhXup2a49Y5vBM+GLHtFPytErHz2rcRZW62r4b+3elizHTn1m35Qc4n+xVde6JcNBVcBG6OJtB3EXh59UMowHxsJxEoIBBjxoL/28mnz+sKk7FvbxoiBrXOZmYJoKZw0Mq8vopLX4tHloOWC3+M9YaHdHtTuxW8S5AkrZQECQImEyoejTCif80f5kYkd0SNDrHbOHsqVMGNHZq0bn9xFu0Jfoigby0i7e6wdSq75IZn5eVdI9sR+Q+UlM2NALK0N+cIDi3GIxy5ZZXRdnCbJzGo+JbtHhXLXR8sjt1oBt93fOC7xNDy+j2DFGfHDIok8guk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(10067099003)(261021123027099003)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VaekwvNGp3clZSZzUyb1NtMG5zL0ZrS0RNMDExcFlzTytGdXZGZ0tPdWlC?=
 =?utf-8?B?Y3RQWkFBcEJwVnhrbDdNK1o4NHlEc1E5Qk54TktkcEdIWm1wYzRZcXNyVHRI?=
 =?utf-8?B?SXFhZDBnMFFreEZDaVZBKzNZSENpUGxWWnVZSW1iNTY3Z0VJMVFWMHVIN2Zx?=
 =?utf-8?B?NUlJemUxdldwbk9BZEwzeDFsbDdEcXYzcmIvWHNVVzZia1hId0dRRVFvQjNI?=
 =?utf-8?B?RXkzcFJHYjNaOUxFMVJ6MHI5ZkVTVUVYTnlRMkdYNnFQS3o2VmRLNkdrbVIr?=
 =?utf-8?B?RW5aRFMwTjV2Qmp0bE5rR0xTaUp6Z0FqUXEvQmh6ZXBkQVVOL0RCMjd3ZzJ1?=
 =?utf-8?B?clliMUZ2Z01vQmhpWnhjYys4ei9qNklyOER1alNzOFVjMmljSWtTVU9aOVhP?=
 =?utf-8?B?Y2NHSXFJbGN3YXNneVBQS21aUEp2TjBveXRJMndlNWptMC9JZEdxMDBveUxR?=
 =?utf-8?B?NlFScGtyZkx5YlYvNWxtQ1U2ZlNWb2VNOU1XZmoyaUIxdmxnSTVNcFRUMFgz?=
 =?utf-8?B?aGdYNVQ2K3ptaHBHd2U5WE90Sng0dEdnWTVjYmFJQy85WnZHaVk1YnZGbkFE?=
 =?utf-8?B?TjR0eHFINFBZblVTSVBhTzNEYzFTeS9WZWRLTTl0cFN1V3dkVWE2ZXJQYUJN?=
 =?utf-8?B?T1hEaloxNnZWd0lmK3FGR2hiRDRneGR0NzVKb0N0RHVwU04xTzREVzU4SmtU?=
 =?utf-8?B?TmdHM1NoVGlIZ0gxY2lxNHh6UVdLSC96NGFpT0ZaWHdoVE5YY0x0eXNheEtU?=
 =?utf-8?B?TEVZN0M3eitSTC9rRzBnUWVuV1pLK2s0QUFGTkdIaGRpQ0ZrY1U4SXZYUE9Y?=
 =?utf-8?B?LzVFUTRwa2hYRFpTRFZxbkVvUVRCT0NqRWZOdmJpWE1McEJiTXY3c3NBeHJo?=
 =?utf-8?B?RFBjREFiK3JLamlNVDhsQ1JabUlIQ2pyN04xYU5sR1hFdG5MMGxETHBlWldD?=
 =?utf-8?B?N21VaWtPMFZ1b0tXeUxhNlh3ckNWMzFRQVhDK0V3aEhhSkRWdVVISmJ6UC9U?=
 =?utf-8?B?enp4MG9BNzVIb211YnpjSGl3dXh5VmEzY0gvR0I1RzdDWXVoaHVjMzFzSkMz?=
 =?utf-8?B?UHAvUm9OT0xVa09FUWpYZ0kzbTFjdEVxd25tWXduM3ZTanBYV3FZc3gvTnA3?=
 =?utf-8?B?eEQ3cVRLVjFlZlltVjZ6T2FMYjNUOTVFTmhDQWFTSWc2NGZPSnNHNlQ5VkZH?=
 =?utf-8?B?NS9qTE9tUXQ5bkFzN3dhUnJDZEsxRlVzRWpzT3VOQ1lHZmpEOTBkYlRXR0lO?=
 =?utf-8?B?eDhhT1VPK1l0dHp2YUNtd2pvdkE2Ym5LN3RCM2ZlU2lXdHI4NnZ2Skh0Sjc2?=
 =?utf-8?B?VVdGdXJVTytVMmtOZUZiZGNrMHpEbHF1VFNxcXJHR1ErSVMyTkZ6S05vRFgr?=
 =?utf-8?B?M0JkNGRBQS9pVFl6QUw2cm5oZXQ2OTBVWGNacG9pazlCWkRWWlBEQ3hPV0cw?=
 =?utf-8?B?eGtETFVTdnczWEl5ZFZybXdYZlJmNEpXNFZrQVc5RHNTMzdtd1dYVFpmem84?=
 =?utf-8?B?QWxGRTJqWC9ObGdrZ0wreS9PYXRueXh2VmZVNW4rd0d0Z1FOLzNqRlExaVdi?=
 =?utf-8?B?b250OWJ3dFlOT1RtUkREa1Q1Vm1mOER4RFA1SWw2dk8vcHJZYUZYaDgrZm9j?=
 =?utf-8?B?RmhVS042R2pjTzBzelY1ZXJFMDBlYUZQWHFZekVrRTFRVVY0SFNOWFk0VEN5?=
 =?utf-8?B?ZXdQR1diSmNMZm1nVGs2VVowYzZrWnFyckFsZXA5SjU4aE04Q3FiaUxxVktx?=
 =?utf-8?B?Q1NEZlo3ek1POWpldEl2QWE1MEFWSGxjNFQ2ZWdXdk1Xc0NLb2ZIVGZnc3k2?=
 =?utf-8?B?aDhHRjB6Uk1mNFYyeW0zamJLaFdWQU10VFBTWU8zSWpjZkx3OGl5NFBYdC9S?=
 =?utf-8?B?cnc4UDM0QVJhdmk5dzUyRC80Z1JiMUlUZTQ3QWlUK0JGWjR4T05TSlUzdytj?=
 =?utf-8?B?R0duaVhDd2dHdENFaW43eHU1dHQ2R2U1ajEzdzMybnNFUzRISW5wRHlmTG1E?=
 =?utf-8?B?U1d4QXMyYThpOXBxdGh5djFpNmxidEVlWXpZbXBoYmdvY3lGeE9oeFNOKy96?=
 =?utf-8?B?bnAxVEx3SUV0VmZrSlBCODVnZ2ZvNEtVdXRTTElXaFNHYnZoUEZ5MWVGL3FW?=
 =?utf-8?B?ZW9ZRFk2Y1BrbjRvcTVtczNyTTI1aFc3TG42bmdpRGo1MGtROXdNNDVUUnFk?=
 =?utf-8?B?R3o0dEtzemRkTlRtV01qejhaMmhmMWdWNUFrS0NLZ2FSTkdOcjBCV0I4d1Rt?=
 =?utf-8?B?ZFBWVUVXZHlPcVRxTW1jbmV5ZkRmUk53TUkvMlF1N3FzSVhqNE9nSURDenNL?=
 =?utf-8?B?d3J3RDJIeGNIeW5lVnp2R0wxT3krOUN2RHJUeFA1b2NrRjVJdytmdz09?=
X-Exchange-RoutingPolicyChecked: qjejD4gzlvqW0eKHMlopW6b3w66PLG74OQeF6rR4/b7gdgHIV+EUd/UpGRWoLDjkh+dmMh7kCQGiY1zTwVq2FPj6A8RYhfqw0Fw89Ukut6DreDvH8/y8DZ3wef9iFvXVXaur6KRMhLvUrVLioVJygYION0JuClJ9vR4QNLxI7Nk98hTv1lpWSQOvaUnGacNwnuORZUsGTo4CMwbRTt7+YVWZr490sLsSPVVLoVWEe+wkD3AsLWK2z9osqz7QU4NwwjfWiNjXLFKKvxP2y7h0xt55OLkG21tjZ7gs/sbHbPWQpJuESQ1LkqBAlztQW2IqP2u/1lWWaX362/lerZ10NA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 340e93c2-308b-4fad-d7bf-08df35075d4b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:23:05.8744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FABD2C3CQZLDdlwD25hB5wALF51NicB96q3IzDBV+g9CWcZBsIUCRM2fiNzihIrd24g8lFucA4+LIsL8oRzEYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 2026-10-21 10:57, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> GGTT initialization currently uses the full available range for both the
> usable and shareable pools, regardless of the SR-IOV mode. The range is
> read from hardware on native and PF devices and assigned by GuC on VFs.

Maybe:

"read from hardware on native and PF devices, then distributed through GuC to VFs."

>
> Separate range discovery from pool setup and initialize the pools based on
> SR-IOV mode. Native and VF modes use only the usable pool. Shared PF mode
> uses both pools over the same full range, so they fully overlap.
>
> v2:
>   - Rename the native range discovery helper to ggtt_probe().
>   - Treat out-of-range VF GGTT as invalid instead of clamping it.
>   - Move GGTT range logging into the common initialization path.
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>

One nitpick below, but regardless:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 129 ++++++++++++++++++++++++++---------
>   1 file changed, 96 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index ad4180400a8bd..b7e3d626e8cb8 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -397,9 +397,99 @@ static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
>   	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
>   }
>   
> -int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
> +static int ggtt_probe(struct xe_ggtt *ggtt, u64 *start, u64 *size)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	unsigned int gsm_size;
> +
> +	if (GRAPHICS_VERx100(xe) >= 1250)
> +		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> +	else
> +		gsm_size = probe_gsm_size(pdev);
> +
> +	if (!gsm_size) {
> +		xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
> +				 "Hardware reported no preallocated GSM\n");
> +		return -ENOMEM;
> +	}
> +
> +	*start = xe_wopcm_size(xe);
> +	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
> +
> +	return 0;
> +}
> +
> +static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	u64 wopcm = xe_wopcm_size(xe);
> +
> +	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> +	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> +
> +	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
> +		xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
> +				 "Invalid GGTT configuration: %#llx-%#llx\n",
> +				 *start, *start + *size - 1);
> +		return -ERANGE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ggtt_read_available_range(struct xe_ggtt *ggtt, u64 *start, u64 *size)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	int err;
> +
> +	if (IS_SRIOV_VF(xe))
> +		err = ggtt_get_range_from_guc(ggtt, start, size);
> +	else
> +		err = ggtt_probe(ggtt, start, size);
> +	if (err)
> +		return err;
> +
> +	if (!IS_SRIOV_VF(xe) && *start + *size > GUC_GGTT_TOP)
> +		*size = GUC_GGTT_TOP - *start;

This condition was unreachable for VF anyway; I'm not sure if stating it 
explicitly helped here.

Now the condition looks out of place, as we have a separate function 
above for the non-VF path.

It barely matters, but my aesthetic sense gets triggered here. I'd leave 
it without `IS_SRIOV_VF()` check.

-Tomasz

> +
> +	return 0;
> +}
> +
> +static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
>   {
>   	ggtt_init_ranges(ggtt, start, size, size, 0);
> +}
> +
> +static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
> +{
> +	ggtt_init_ranges(ggtt, start, size, size, size);
> +}
> +
> +static void ggtt_init_generic(struct xe_ggtt *ggtt, u64 start, u64 size)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		ggtt_init_native(ggtt, start, size);
> +	else
> +		ggtt_init_shared(ggtt, start, size);
> +
> +	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
> +		     ggtt->start, ggtt->start + ggtt->size - 1,
> +		     ggtt->size / SZ_1K);
> +#ifdef CONFIG_PCI_IOV
> +	if (IS_SRIOV_PF(xe))
> +		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
> +			     ggtt->start + ggtt_shareable_offset(ggtt),
> +			     ggtt->start + ggtt->full_size - 1,
> +			     ggtt->shareable_size / SZ_1K);
> +#endif
> +}
> +
> +int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
> +{
> +	ggtt_init_generic(ggtt, start, size);
>   	return 0;
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> @@ -427,43 +517,17 @@ static void dev_fini_ggtt(void *arg)
>   int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   {
>   	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	unsigned int gsm_size;
> -	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
> +	u64 ggtt_start, ggtt_size;
>   	int err;
>   
> -	if (!IS_SRIOV_VF(xe)) {
> -		if (GRAPHICS_VERx100(xe) >= 1250)
> -			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> -		else
> -			gsm_size = probe_gsm_size(pdev);
> -		if (gsm_size == 0) {
> -			xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
> -					 "Hardware reported no preallocated GSM\n");
> -			return -ENOMEM;
> -		}
> -		ggtt_start = wopcm;
> -		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
> -	} else {
> -		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> -		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> -
> -		if (ggtt_start < wopcm ||
> -		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
> -			xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
> -					 "Invalid GGTT configuration: %#llx-%#llx\n",
> -					 ggtt_start, ggtt_start + ggtt_size - 1);
> -			return -ERANGE;
> -		}
> -	}
> +	err = ggtt_read_available_range(ggtt, &ggtt_start, &ggtt_size);
> +	if (err)
> +		return err;
>   
>   	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
>   	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>   		ggtt->flags |= XE_GGTT_FLAGS_64K;
>   
> -	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
> -		ggtt_size = GUC_GGTT_TOP - ggtt_start;
> -
>   	if (GRAPHICS_VERx100(xe) >= 1270)
>   		ggtt->pt_ops =
>   			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
> @@ -476,8 +540,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   	if (!ggtt->wq)
>   		return -ENOMEM;
>   
> -	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
> -			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
> +	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
>   
>   	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>   	if (err)
