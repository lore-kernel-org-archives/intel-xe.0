Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684E4CCD1BF
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 08:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFAF10E050;
	Wed, 29 Oct 2025 08:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8hVUcIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB3510E050
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761724928; x=1793260928;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oatg7Mfv7OuhWRhrmHLOCyg5oi65MC2VY49775wOFWo=;
 b=I8hVUcIi8st94dLBBa+7JFOdjRYfk8W/IJ5Xhf+jQpFoFaJWatJMXOnu
 3sn2qZSyP3b40JW4jmpQpuxU0wg+CeUhQKpw7WKX8J39gJzhH5IFnHxpT
 j6I1TxhJRIOfLauDA65MRu0BGrunHcaJmdxbs+diiajoHTCDFii/hXQYR
 oAGWdUrqW55j4uoK5HC8kKoraC90PLzI0maS0tJkRo7aJp/oWPMHPobt4
 GpzFAZZhHiTHEu2plsXCr4SzMBLXxUstrGJux91oyJXWTMX2l7WURXQH8
 FjAR7RzA+bS2TxAEuPRBm/SK1+V8frVaoYDp5PXPzXcIG5JPCE6n55fFB g==;
X-CSE-ConnectionGUID: mMacnxu0R2G9ECVFCybQHA==
X-CSE-MsgGUID: G0cilJfHQbqrJiB7jTO1hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63766915"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63766915"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:02:07 -0700
X-CSE-ConnectionGUID: Qa/Yk/LyThOeN38Yoj4ArA==
X-CSE-MsgGUID: 9TYJtpdNQd+Q3B+lhidc6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185930665"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:02:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:02:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 01:02:05 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:02:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhcMO55zzTgVk8l8Igmu2WTucFDukWWYahcWRDW4iFAA8VOEBSR+fgT2+mqKxOogClfbulG2y+7r5rKIVRlRjvXodSR4zUeGvTBOjdlHwP+2b6l+T8c4oyzx6E84vVoWSpGngo3oJ+PNyvzmZPcVZ23kwN2OQHvmbRrm0XculUFH52ezkB/0Sz3A+l4YP4yIq0Gr2KFq7DTvMD8JWAra7gBg4tyauEVMoRPOgeO7LeOaxrj9/9+wRkrQYk3IbVcscW6uhHUUd8WY+hr+entmqZPZRnRtJ8zUNUIqErv6ntcmGUklT5CA6NBbcqBRBGIKGXKIPICziw+fY5X3Jtj4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwXvni04Nh0mqrQWJbQiwSs1cjxpUyYC9qPBilMIjHk=;
 b=T4/X1XNcjCGHJrlKFfljN0Oj8CeRhbUGsZof32FmtAbTYxZs9XUzo+aVgRaz+8ZbAReRQ5FkEcNRzK/AiLX/qBV8QwT5NbrbZdXKZ1xC4SEtnD3mruuQtC9pdwdMN+VJqoTtOCiL+X2IYO0cUYQoF5uh5NFNnQKnTfUGsn37gpNd9j1/DOnJfOqv/fN4mDEsSOaduZIQUeXOHp78IAJWhqhKSvq4GSNZqV72Zt6YGe3HrkKZhbseqqkVP/gKFRwT/fNlIVnYFOmR9DcTuyoPioolR3ZBMj0tKrTJXyScMoVtxyzcMT1t5beDo+2Q9owhm3bTe2Vl4ghgIB4kpRGUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB6890.namprd11.prod.outlook.com (2603:10b6:930:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 08:02:03 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 08:02:03 +0000
Date: Wed, 29 Oct 2025 09:02:00 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/17] drm/xe/pf: Fix signature of internal config
 helpers
Message-ID: <20251029080200.utxcii2ea2sxjss2@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2PR04CA0303.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f55814-5e32-44e5-b595-08de16c171b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVpuaHBHNC9rdmR1UVBuUHJVUXQrS1RldnoyYjIrdkVSWDZ4R1UwQUxQR29t?=
 =?utf-8?B?T3VqSlJKMHVIaFYwZHVYbkJRYU1oY1crMkFyeGVMY1MxNmcwWFJKVmZuaWZa?=
 =?utf-8?B?RG1VRGoxVSt5WWV2elVpZ0ZKQm9zbnNTT3UyQVFVbG44SXVlQ21TRXBkSXVa?=
 =?utf-8?B?UWRYQ2htM01FbTJIK0hxN0JhWDhBNkZWT2pZYTJPaTBDUzJxSXRpU2dacjFU?=
 =?utf-8?B?anROdktNdHE0OW5rSDN1QlYzQjZxWkpTVis3OGV1ZmJhSjlad3N5Ni82dDAv?=
 =?utf-8?B?d0hldmFEdGFRa1A2Q2F5NG9RUnZaeVlmai9IOVdHbFNjaVFqTjlsTDl6SVF1?=
 =?utf-8?B?QzJnK0JiMFdUY1JKTUtTMnJFTTJkUWtNK3BKNmlqR1plWlY2djhSTVNpU2Va?=
 =?utf-8?B?cmhta2xONUh6SWpuTTlTNzQ3ZTBXcFRwTzlFbHFHd0srbXd3NFJ6Q1IxUWV1?=
 =?utf-8?B?MW54ZmJlb1JZSXlFWTAzUWZER0Z4dGNPaythaXN3NW9XUVl0NHZOMi9kSnRO?=
 =?utf-8?B?Zzcxd282MVdYNkUvYUJvbE4vVEs0bUFjL0RLWG5LYit0SitxandtNkx2MWJP?=
 =?utf-8?B?Y0VLekNVSjgxMWRkRGMwbGRnTmVFUERWWDRjM1FWZ09zS2tDbnAyd3JsdHRs?=
 =?utf-8?B?Ukd5WG1jeDAya25VdEhnNWJMekdkcmJLMFJzT1JIdHlCWUVLaS83UEpqQ1R0?=
 =?utf-8?B?TXhKSmt5T1ZiZGhua1JjaTd5MFdkQ0N6WVgwM0dTdHkyZ2hiNlhPYkFQM2lo?=
 =?utf-8?B?Mm80VmpLTFkwSEFCaWV2a0Y2aktCOEdPY0RLbVBKaWxmYlM4QVJRM1ZVMHJr?=
 =?utf-8?B?Uk1id0lla005dHRyRkZ0ZU9zRFdnamhzOC9HcnFHeGxEek1OdHdaZDRHdTQv?=
 =?utf-8?B?eC8vVStlSVlRVDdmOHZwZ0plSGVNc3hjdUk5aHBKOXlsZWtZVHlOL1pZRUg5?=
 =?utf-8?B?WkRqazlmdXZuTmR1aUxUbmxqbDJNUjh6KzdNZ2Z5RTllK05vOUlkRDRENVZj?=
 =?utf-8?B?Vnp1SVVnVGllS2lXNHkxSk5zUXBneU8zdGkxLytzSTc2MlNYZmkweVhsWEh5?=
 =?utf-8?B?bHZnZlBjNFBpTVJCZnRab2JiYU5YMXhOS0hvMERJbll1VytMa0ZKK2J0RHNR?=
 =?utf-8?B?WHFLamEwWHdCQjg0azNCVTl1QmlBMGFna2NoSGE5L1lEa0VxRm1GWE9sNWhv?=
 =?utf-8?B?UEUxN1VMa25OVUdqdis0Z0ZUdHpPb3RYZEgvSU8zSWN1TGFDUjFySmE1bUV5?=
 =?utf-8?B?TGd1VUpCMDN6VUl1R0tvdm82eTd0Z0d4RG1wcnFpNGpLVFVKRXYvbXFVamRT?=
 =?utf-8?B?QWsvY1ZHdEF5eERwZkU3MCtRaktUVnFGK1E2ZGZKUDBxMDBVamtIRGZCdTNM?=
 =?utf-8?B?Wk90NVRRWlkvTWNrb2krSG5kUWZEZmRYblNsSU55dWtzMERpSUVvYzJwbGYz?=
 =?utf-8?B?cStFSVl1VzRudHVqUXlueDNhckdBSXNOYlVubE1qYXVvYk5VVHJWLzM3aGRv?=
 =?utf-8?B?OG4wOXg4Vmt2Zy9SSmV2NzBpZjI4Ny81YklIRExIUjc0MWx4R3F5bUlGVW5S?=
 =?utf-8?B?bEZManRFZ1E5TXBnTDV1RjFIcS84WHF2WHRxREhxK3N1SEZnM0FxczQ0bTMz?=
 =?utf-8?B?clBmSEowR295Vys1eGVwQndjK0cvRlRoejZrSFhkQWlPMHh2Q1VXZ0p4c1Zu?=
 =?utf-8?B?Q091ejhyV2c2eWFFbTRsUzI2eWZUZ28rSGZNd29MRlZ3dFJ0MDZiVmxnd0oy?=
 =?utf-8?B?YnpaVW5wMW0wNFZ4Y1gzR2N4bTllWGtiTGQ1SFF1bFg1Mm1MOEJNUllPT2JJ?=
 =?utf-8?B?OFQyR0RCMUQ0K0VHZFV2c0lKVGY3YVl6QnEvK2ZYR2VTeGR3ODFBQllzZHpm?=
 =?utf-8?B?RnVDbWgrWDZkVk5McEdzZWkvcUZjdkgxQ0VueG5uMlZHV1pKMktGb2RhTWN6?=
 =?utf-8?Q?XP9Nn0BBvV7KO8tFiOhDCYmvl7Ba6ZkK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGRYTEkzV2lkRUNOZ1ZYcVZpVWJCWnNvdVFTWHJWYW5sajc1dUNqT3htUSsw?=
 =?utf-8?B?aFpNTVBzUnQzclZiSkZxYTVRb2xOUXI2RFg5cUcwTk94RkdVSzQrMGtmNTEy?=
 =?utf-8?B?aHdhOHhjZFJaVzh1NkgzTXpEUzJ6NzNZc01mUldpREdZRmhUMkZsRmFUK2FC?=
 =?utf-8?B?MXRaWTBjbzIvN0pkOEUwT2FhK3oyY2tyRVk3MXlvTk9ZakFYazZ1alNkUlR2?=
 =?utf-8?B?UlNNUUhPOEpncC9leHh0TjNzNjI0em5ubW9ES3pERnp1clBNTUNYQ2hRRWdi?=
 =?utf-8?B?NFlxMWpuVHljeVZLdWNCa3Jod3BBVkhlcHpuSjl2MjVLYk8xUHhaR3VPYWIw?=
 =?utf-8?B?YUxMUjFJNk5WRytlaXlHeXlzNmh6SmN3cmkyMXZlMjBBcmV2dDVwYVhxTUlK?=
 =?utf-8?B?L0hMZzhpQlltbFU5U25aOEZsQnMyRFYyMnpsbnFidXdiSTQ0SFd3Q3IybnQ1?=
 =?utf-8?B?Rjg5azljelN0TTlxS2FRU1Y4ZjNyUUxRcWJiZkU5NVBQeWMyTWFkM1gwbkV0?=
 =?utf-8?B?UDV4bHhzZXFOQzl5R3VRTGh4bGhLMFJyZVVKYThmN0EvTU1zSk5BbnVBckYx?=
 =?utf-8?B?QUV4dXhVTlZ2bWRHaitPaXZ0Q29wczcrQVV5aE8zVEpCTlFNOXF2dk5pR0RC?=
 =?utf-8?B?SmRIR0FwOENvQ3gwTUZla0ZBZFp0ZTdNRGFyUi9FR2xIMk9Zd0k0bHcxUHFk?=
 =?utf-8?B?eXFhOVVlY25GcTJ6R0RmVFoxL1lhaGFaaWs3M3lQRlpnTHJDSHRxanlOS3Vv?=
 =?utf-8?B?cS9NOTJtaFpPa2JFWWtCWktKcE1OTU83T2ZxOFhjc05rZnlIMmpwZUhsdGU4?=
 =?utf-8?B?SVZjYVFtQllNWENuSUxVOVFmL1owcjJwcFhYMU9DQjI4NVRYY2pGR0VnWG0y?=
 =?utf-8?B?Z0ZveVR0eSsyeitUYXRYMXB3UXhiOTFsZ0lTSHpMNU4vRmtja1ZNVlNLTnRm?=
 =?utf-8?B?NFN0RktEN1NzaGt1RFlSMGQvQy9TNE0yTHB3SWZhZVRpRFIzN1JGdllwcnBr?=
 =?utf-8?B?WlpWdldic3FpMHpvVDJnTFlESTZ5M0VSblE0dm9JR2NGTjk3MjN4YmNIMlIv?=
 =?utf-8?B?MW42ZDlqekhaczV0U095TjZMeEFDS1ZzSjRYU1FiTnZ0blduTkRtaDMvZmUr?=
 =?utf-8?B?ZGxaUUIyZUJzVDJLYVB0b3MvNFRCRDFSSm9GYlg1dE56SG1GbWlxbkMvMGQv?=
 =?utf-8?B?OGpudVZQNWlJdTIvZWtnZDRsZFNZZytIMlZCTkFBQ0x1RVR4SmRMbVhjVy91?=
 =?utf-8?B?bXV6REFFM043aXdhTWVCc0M2UVZHM2R3ZTNRWit3eVBqWmtsdk9CaWdBbTBa?=
 =?utf-8?B?MWgxNVAveDdvVUVPeE9ycGNIYzFHTjhISXdROWM1dDZFM2RpcFh0YlRoMElE?=
 =?utf-8?B?Ri9kVkRhNVU2QWdhNDBRaVg4S045dUxMd1JHb3pnbFZJMW5pMmVURlkrbE1y?=
 =?utf-8?B?WllueFhldzBqdHdwMzcxM29ueVIzU2pKSEdpMUJBbDRBcGQyYUgyR05TNmtB?=
 =?utf-8?B?UFN2MDg2cG91UVVYN1ErQTdFL25pcCt6a0xwVkJ4UmxsRUt6bldxVHhoWm45?=
 =?utf-8?B?OExpekxEd1U0KzB5T3BUZi9hZUJFZTVwZnByR0pVeUpvckJBVVYwQmtORWRi?=
 =?utf-8?B?K1V0NWo0T1pWMWljL1N2RTdLUnR4YjNtNU9oY2lJaDd6NkNPYytZemFuc2g1?=
 =?utf-8?B?aWphM1NVbjBLQWVjSU1LSS9ZQ2MraU01V0tzRDNDL3REUGNyZTFxOWtzeHY2?=
 =?utf-8?B?QW1INHNicW1EblFLc0NUVnlqK2s4Z1RCMUszaW9MRUwvR2R5bUtyVG55eEdo?=
 =?utf-8?B?dlpYTTdQNVFjQVJZOHZzTnBhYXRtekFSVHJVcHJ5Uk9NV3IvQ2ZLakoxYjk5?=
 =?utf-8?B?em53M0RVQUVvaHZyTHM4VldRcmpSTTQ5aXFqK3B0QmRldU00VzJUWUdlaTh3?=
 =?utf-8?B?ZStRYUpFaXFFeUFpZ2hXTk5LN2FZZnYvQldyT2p0TXRza2g0Mk9rT2ovMUoy?=
 =?utf-8?B?VEZ1bUFHOFd4VDdKZGdjcVdXNnJoaWlWREZFUWRVWTJMSTZwMytPd2ZiNkxN?=
 =?utf-8?B?VWxSU1BOQW52bUt1SGFodHl5UEFlYjkwODBiOGJuOVBHeGtwOVZGU2JuRmNu?=
 =?utf-8?B?SmkrMytNK1lWUGVmS05vRmxVaUNnRGZ6K21BeGVRQUhLOEp6MFlmZU9PeDVy?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f55814-5e32-44e5-b595-08de16c171b9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:02:03.6566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cig8YNFCe/GHHX7dfmyuoWmrOM+DFNCyIg9Bed4F7xRKnSnWR62iL8G8/GJvqN/oAYlgZwIM299e8wvKa0aXa5NlXoLHgWBRVeAhTwFqDbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6890
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 18:58:21 +0100]:
> Both pf_get_exec_quantum() and pf_get_preempt_timeout() should
> return u32 as this is a type of the underlying data.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 343ab4a32cb1..6365d5f2ae98 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1727,7 +1727,7 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>  	return 0;
>  }
>  
> -static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> +static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  
> @@ -1830,7 +1830,7 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>  	return 0;
>  }
>  
> -static int pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
> +static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  
> -- 
> 2.47.1
> 

-- 
