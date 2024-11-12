Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C57ED42BBA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 17:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7F510E610;
	Tue, 12 Nov 2024 17:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlA5fND7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC8810E610
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731434363; x=1762970363;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z6KKwN99MZ8zJ3+6Ri7r6CufRBFW5TSfInS95XiqWpc=;
 b=RlA5fND7PpavQaA2yBx6zEVF77QvkJPAPokUcP7YB7Psze/ChYXeTACc
 5oot6n6GkuIP90eGbW/TGKQRaRh9p69+bu4lhFSi1l4Ql9fsscwmD8PEd
 fgNrbddo82Fe4i4TI3WuEdOhCYIBWYYA4Fqwajnk+dl7hAT3Bzj4Kn7h4
 RH4lazE4ssCOEFCENhvf0+akwOG4QDO1+goVnBW8siJYiFuEpY0m/cnmU
 bEZuDxh3RqZLNzebffg+Mk/CIOEwK2uKI58ft7ys+8KoM6llQoqdv+XRr
 WHhQeOvjQoL0Nl2W42iTgxmBdcEOK6sfbYtS/gRm3uNbLkTHJHeltj8yK Q==;
X-CSE-ConnectionGUID: fKGUpwa6RNKUJPjnpvEkhA==
X-CSE-MsgGUID: dTRFu6z5RKuvenaLrGsY6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31440401"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31440401"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 09:59:23 -0800
X-CSE-ConnectionGUID: dgrnwqzlSgej+sQ/1KtivA==
X-CSE-MsgGUID: q6E+8bPgRzym6WSJj6J0PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="118410571"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 09:59:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 09:59:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 09:59:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 09:59:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkWGs8VTIultCa8Hz3Y2PrgKGSjt6OzPyN4yZpf4BtT3UNHIPqyqDDNcj0fY+krQblSVRwJC0HbBFpuCBZAWgxBdByuRUwfQxs8+HLZ3Y+OPWQ8O6MGdnx0dYvyS30BIax5/AhiO83flyrRiZbSYKHigKml2AfMKoL9fDlcIsY1s0Z24/edKH2Myf7OX0H207NDLhnB+iYV0W1LYPQpz/WeicZmC1EoVGYVH8lbvd22iRm8pYcIrI7pi7/BKzNWTh2UHO/5awKaV2qpkbuKqWCcUo5IEktGr0BXyUkmYGZcbLDffRjGcJdCZ5MWFZLTWQZHFXrx8t2U1LMNtAVeVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtLpGn3N0ASe/BoXUtEMWhBCntkr4yL5AIjXN5QgYUI=;
 b=uHA6a574c1w4TcOIcoObuv/78kGTAVgvDMsgFqf1WRuCD85Rpxrexm7gsWx7lZM6kOV9/kIIXcxYtO6yhQNZtJW75uq9x9ou9z6vsy+2LA5OehHfUVcnpfTifORN/vMTn6ZWCvgmRpiXvtR6D51iZ8CmB0yppkPKapgw1s0vKScXv9EVhaHurMFaHKb4jrPg2+TLAlN60LQqlNZ9Do6NvqMrCucymbksIAFNDQoGuPp4PIITa7cPvJ+28Ivd29qO60mkTk51DKkfzaVCJl0im0mFzsXK4sbcocBtlw34JSifN9lFRID4ah3Okl40lAnWXQfifGm+/aBoc7+u3Rp/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 17:59:19 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 17:59:19 +0000
Message-ID: <9d829b21-4327-4cbf-ad72-b3e47d57fa74@intel.com>
Date: Tue, 12 Nov 2024 09:59:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:303:b6::28) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW5PR11MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b119218-0426-43e1-4b59-08dd0343bad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFdTZUx5Y2xjU2p2MklGWlh5MUFDRUdGOVJtbTV6eTN4Y3FidzlRZ2pIMS8v?=
 =?utf-8?B?b29TaG9JM200bExHVjM1VmJ6T2RtZW84bUxhcTVHdGUrV09XUG5LdmM2U2ZX?=
 =?utf-8?B?eSsyQzdlM3VERG82WnZKT0ExZFM3VjU3b0tRTFl6QWNQM2FhM3FNN0xPRDU5?=
 =?utf-8?B?M2hnQVJxbG9aaE5NcFJRd3ZKWEhXTVpnakp5SG5jdzQzcGM4V0RHSFl1bFdo?=
 =?utf-8?B?MFlkcGpYS1E4WVhMdDlFWkdja2JkbDYvODJNbkVXS3Y0TUZHUkNsWjhyM3BY?=
 =?utf-8?B?M25UVnZSdXZzYnBjYURQS3FiTDh0UFlCM2hBYU00bVVFQi8rTW5LbDYxemxI?=
 =?utf-8?B?b3FnR1FQSSt1R1h0eDI2SWI5SHZoUDA3YmFMTXFqb2tsbmk0MzNaUGdrMlZX?=
 =?utf-8?B?alpRTlozVUxPdHV6OFZSSkoycEFlVDhqTWFHak5VQU05RFlDMmE3T3JXNVFN?=
 =?utf-8?B?M3l4SkZmS3k3Qi9RY0F4cEoyNWY2aUNWK3lKNWlPeGNXK1JuanNNS1JiR0hr?=
 =?utf-8?B?TTlCMXFtQ0gvTXNMNmd1azl6N0VEL2JiS1lzYnVBVWx5dnFsQ3NGY2V6bWJj?=
 =?utf-8?B?Qm5pRThHVWM1UUZVMG91T0VTSlhwV2cvWXFhUzlNVHZaNmMyR0ladXp4Q041?=
 =?utf-8?B?SjJHMWFqcUJmaGZsQitvNlpLanVPVmZmWjBBTWczSHcxVlFpMkVLRVcwSndD?=
 =?utf-8?B?aEN1SHdYdzdqa3FIMmdsN21FU244cFlIanplOHpDS2JORTRRVGZ1R1VOKzR3?=
 =?utf-8?B?MkhDSXJMaVRFQnU1bUIvb2dnQ0NyMnZDMG5sNFdvanBTL2xCUkZQR29mV1hO?=
 =?utf-8?B?TFZrTGQ4Si9Xc0tGUDQxNWNPYlEyd25YOWRPay9hQUMzcXB1RTdyVXRPdmNC?=
 =?utf-8?B?QVZyZkRjSFp6cnI1bFRWZG0rN0FlUXBQNWJ0a1FDWVoyZlY5bFRqbm1mVEpC?=
 =?utf-8?B?Y21meCtoM0FiNVk5cUw5Y2crVHJDVm5tUUxlRGZKMVNNY0phSXUrYXIxYk9n?=
 =?utf-8?B?U2NWbVRmc3JSWWlxY2lhL0hrdzdNTVJob08zRXVZR1hvUGdLNFBQOUlqdTZD?=
 =?utf-8?B?REcxTjltQ0xNSU1EY3lxYmRXTVRUUG05RUREOE92MmowOVVWNElGQTlQM0FG?=
 =?utf-8?B?WE1WNTdWV1hOV0ZkbXdndUZTMXlHVGo1L3VVVFdFRGhhemY1ZXRkcFBSbFUz?=
 =?utf-8?B?LzFnTDdIUGcybkFENzM3TUE0cldHTWU4SVF3UjBvcFJHM0JKM3pPT2t6blUw?=
 =?utf-8?B?YVlUVUdkWWpHQjMxcFBDbTZmeXFqNTV4OTkvaHVHZkU1SjVDcVFOelp3T0Y3?=
 =?utf-8?B?KzJ0QjJIQWl5YmVWN3h2Qnp4SnRoY1Jxb3hSbjUwMXBFR1ZqOTZHRmlBZ0wy?=
 =?utf-8?B?WWJRVWh6TVlFYzdUdGtvNVBqNUxic1cyS08rclQ2Qm1ZY3l3ekRTaXZzSzJL?=
 =?utf-8?B?cGRKUkMrSVpmMlNkSTdsTndYTnBlUmFmRngxOCtzMVZRVTFYMkE5ZjNmekJW?=
 =?utf-8?B?bXRuODBrYk9OZmtNcHpZV1BWS2svWTBZbzBPMHAvbU1CL3ljRWQ2cGVuQkg5?=
 =?utf-8?B?VTRZTXpMSjkzdU5PakpZbzBoVE5DZ0N4WVJ4TDZTVHAzQkdxVnA3QU1sY0I0?=
 =?utf-8?B?L2ZmY3V3RmZOMEYrdDVqTHYxYVV1ekV2aFQzVCtkcW1aZ0k0Mk12MUtYQnQx?=
 =?utf-8?B?dXZRMjV2M0lnbHNFbzZ4b2drNml1RTRDUFViUElpdUV6QlBkK3F2YXFnc2pJ?=
 =?utf-8?Q?g0My/+5a5TowQgCfFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1Z5bFpidXdhSmJaSUpRSEY5NEZ0S3MzUkxvRmgvNXdHSkpNR0NDbkRJNmhF?=
 =?utf-8?B?SDhRZHVlRkpKNHF6d0NXRWlzRGd4OVJ3M01qbDZkY09FSDF3UW01eHhDaVJa?=
 =?utf-8?B?cFJTcXVDdHQ5NGhpemhsQkord3FLZ0huUHFQdmkrV040NWJyck9HZlplcnlH?=
 =?utf-8?B?RjlhYWk5RTVpS1dKVkZBOFlmd0JJRUk0VlhWeWdFUDFhOWdrZUNjRXhoWW9M?=
 =?utf-8?B?WGRHcGMzcVVOOVVjb0VsL3REV3NmYkpPQUt2cGYxOTlJTGtTaldYa0Fra3px?=
 =?utf-8?B?TEdhU1o1NS9uWkREekUvR1dmdWFRWHN5THMyV2lhQk1FVXMzS0NtbFdZSGJO?=
 =?utf-8?B?SDdCOUl2T051OHFzNVdLZkw3ejVVWlV3akNGNFQxV1dyN1FSNjNLMkIwOEl0?=
 =?utf-8?B?bnFWWUJjOVpsc0NINWxuSkoxOVB5MUxXM2h2amZVd3R4TFJlMlprdGNBY3pU?=
 =?utf-8?B?WTBjVVo2NUJ1WWNlelVnKy9TYXFwcXpMMlA0UHl3aVIvSmlBbFVUcERJNXNu?=
 =?utf-8?B?MlhoNEc3VDlTT3o1N2J5K05MVFNZYXZwcElLZTJiSHVmSk5aeEhuWjFMZHoz?=
 =?utf-8?B?Qm9CVTBRQ3pwR2wrei85ZjRrbjVRS0NQNkdYdXB5QUVJRkJqN0pmSWJBTzlF?=
 =?utf-8?B?VnBXaUJ2ZEpBbFJuN0lRZXBTK1gxWVJRY2FLek5qSDVWSkw2UUc2SHdmcThn?=
 =?utf-8?B?S1FRaTErYjZncmNCdENoUGlZUGx5YWhVNUFUMHdLSmd0bVk4Q1pwMVU0WG51?=
 =?utf-8?B?ajJOa2s1QldRamFLcXZiUkhLcVorMzIwdnJJbit6U3NZb1FSanA1bVN2Ymti?=
 =?utf-8?B?WGpjTXdnZDJUZjZVMmM0V0FKY2hXT2VyMk45YW5PWFQ2V0hMNnM2RUZQMHhh?=
 =?utf-8?B?bVhPTGJCTUplaGo5azdraWpIWDEzUlBiRG44SGNBeHNMYy9ycXZnR3k2WURr?=
 =?utf-8?B?bTZCS2UzTUVtd3B2eXNzL1hwNzU5ckZQbEhaN1JHODdMajk0ZEZORm9hTVU2?=
 =?utf-8?B?OUE2cER4OXQ3ZlV3R3o1b1VCU29wd2pIQzQ2NnVJTDlScDU0SlNCdExoMUNK?=
 =?utf-8?B?Q3RDTEhGMHppM0VBNkhOdlVoNmtncElaWWFmUk9ORVlpSUJQemFVK1pTczlI?=
 =?utf-8?B?bWswN0V1blNCME00WGZ6Q1prcTlhY3JlK096alFZTElpTjRJYUJzaVl5TjNu?=
 =?utf-8?B?Y3RyNi9XUDc0SGswQkN3QURXNDhSWG8zSGpoV3JTRlhGYlpxZmwyc3UrNzdE?=
 =?utf-8?B?VndJaFJJVlJNNXJORnkvSFUvWlFQMW9RallHM0k5cEYvejFFK1c1K1d4MmZM?=
 =?utf-8?B?R1VxaW9ua3FTbXc0dUtjTEppL0xTS2tDTlplTWZOZVlZMDhBWmM0cTRRVXQx?=
 =?utf-8?B?OThieG1aWGhQbFJKbkNmU05obXZmQTM5SGlVbE1CaXhLUkJsZlM4ZlZ4eks5?=
 =?utf-8?B?Z0VpUlJvLzZaVUZPYVQ4dlppajFZYTdYZE5pUWh6TDZiejlHWkdidGl3V0Fs?=
 =?utf-8?B?L3BZTWVCNFJXYnRHcExMSHRVNlNwL0pXZnpadERzWHhNdnJNS0E4aytVTFJr?=
 =?utf-8?B?RmpDS08xRitDVUxLVnJkSnR6eGI4MHBLbS9EYkNaMlhHdWRJVHRKbmZxM2dn?=
 =?utf-8?B?V3BVeTh1NmM1NGFoS2tQTTN5Q3VvT1YvQmpMRWE5U25wUXZ4NWxHOUZnK3lz?=
 =?utf-8?B?L21lWEQ1MDAyZXVRbUF0NkFRemN3REoyZHZYelhqQjA2dnBZWUVVNVJTTGZu?=
 =?utf-8?B?ZHNROHNPQU5ldzRvTGdUdXlYYlBDcGQwTmQ1MHpJdHhjZi8ralpZUmgvK2wy?=
 =?utf-8?B?d1JIeHRtTWhYT2x4QVJwMjZ0OWZ3RmhaWVFUZU95dmY0aklWVzA0K2tSbmcy?=
 =?utf-8?B?ZlJJcUxjdjZnS0VCN1c3WWthMHZ6RWZNcGZkRGNxUlVEL2ZyY3IwZmZ1V2dU?=
 =?utf-8?B?Q0xwMW5wMzdPcXZsV2JQSzFVUkROY2xZalNwc2l0YTV0SGJKSjZkUnNrbjJu?=
 =?utf-8?B?VkxsZG11MXl5R09iU1gxOEx6RXc1a2pEQWk1ekJhT3F3c3RTRU1FNTZQdWxU?=
 =?utf-8?B?SlYrYksxMEVJMnpKckhhR0U1SFN1bjYyeTREdy9RZjE2VnB1ZEVDTUdnNUtq?=
 =?utf-8?B?TzJrTUFIQ0RwaDhTTmd1SW1PZUpHb0pmNTJ1b290WlB2bHRqRlVaSjNBeHFC?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b119218-0426-43e1-4b59-08dd0343bad6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:59:19.0568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ILBuJAB9FmxJvNNOCc8KgxeIp/osbYhEK1giWX3qst+oelZcdpZ8Pu7zd4xXqw2aVKsCVnWcK4CetBs5UFQRfhHXDqyIEu/Jq2rY3lO7wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
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

On 11/8/2024 15:34, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, November 8, 2024 3:10 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
>> On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wrote:
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
>>> Sent: Friday, November 8, 2024 9:43 AM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>> Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
>>>> The ring is currently in LRC BO but this may change going forward.
>>>> Include the ring address in the snapshot protecting again any future
>>>> changes.
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> LGTM, though the terminology we're using to describe the various ggtt addresses
>>> as "descriptors" is a bit confusing, even if it's consistent.  I wonder where that
>>> terminology came from?
>>> This is just a rhetorical question.  I'm not suggesting it be changed.
>>>
>> LRC descriptors is name copied over from i915 and may even be in the bspec.
>>
>> But yea, indirect_state_desc and ring_desc are bad names. Will change to
>> 'ring_addr' here.
> IMO it would probably be better to leave it as "ring_desc" for now as it's
> consistent with surrounding struct members.  We can do a pass of the full
> XE kernel for inaccurate uses of the "desc" qualifier in the near future and
> fix the naming scheme here as a part of that fixup.
I strongly disagree. Just because A is broken doesn't mean we should add 
a broken B and C! It makes no sense to add a name we know is bad just so 
that we can change it later. Anything new should be done properly from 
the start.

John.

>
> My RB still stands either way.
> -Jonathan Cavitt
>
>> Matt
>>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> -Jonathan Cavitt
>>>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_lrc.c | 3 +++
>>>>   drivers/gpu/drm/xe/xe_lrc.h | 1 +
>>>>   2 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>>> index e219657535cf..afb0f4f44748 100644
>>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>>> @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>>>   		xe_vm_get(lrc->bo->vm);
>>>>   
>>>>   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
>>>> +	snapshot->ring_desc = __xe_lrc_ring_ggtt_addr(lrc);
>>>>   	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
>>>>   	snapshot->head = xe_lrc_ring_head(lrc);
>>>>   	snapshot->tail.internal = lrc->ring.tail;
>>>> @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>>>>   		return;
>>>>   
>>>>   	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
>>>> +	drm_printf(p, "\tHW Ring: 0x%08x\n",
>>>> +		   snapshot->ring_desc);
>>>>   	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
>>>>   		   snapshot->indirect_context_desc);
>>>>   	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
>>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>>> index 9d64cedc4d14..a2058a501353 100644
>>>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>>>> @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
>>>>   	unsigned long lrc_size, lrc_offset;
>>>>   
>>>>   	u32 context_desc;
>>>> +	u32 ring_desc;
>>>>   	u32 indirect_context_desc;
>>>>   	u32 head;
>>>>   	struct {
>>>> -- 
>>>> 2.34.1
>>>>
>>>>

