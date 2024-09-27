Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C46CDD1B3
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7899110EC53;
	Fri, 27 Sep 2024 14:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2Pf4FQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9764110EC53
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727446222; x=1758982222;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qZ/sK3/o+kIYTdvCy/Hx2wR998y70BdQ02SUnA33W6M=;
 b=S2Pf4FQOOhJu6IPgggqYzUsqCx6oiYcl5GLYkk8QXhbfJg6WP/9ykb5m
 G155QgYD50auuY9y2bgWqqJ/N46SI0K8l5wlfwVOFPgUNugsa1keskUDm
 uNjOU38V+TERHwo7+dOXvXiX0guaOTPyUuP28VBoTBDhvQKaIJV5W6xVP
 EWa0MtFB18tcMnP0LB4x2y55oNE3Dx5DJ9cmsuw8N9d1q90hJtxUU82xw
 WbTYM4WB2HYfvwqJJjkNADKlv77beuTp3tYlcpaurO2pPn831N3khYbyj
 t3wqB+eMuU2gveBs9Fjv3vcYA/05JlbudHYf9mWP0p3KB3Jqmy2hHSsqp w==;
X-CSE-ConnectionGUID: G7f2bcZOR1i4SQQjh5LlCA==
X-CSE-MsgGUID: 4DmNrigMRV+E3Oe5CBu74Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49117815"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49117815"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:10:22 -0700
X-CSE-ConnectionGUID: fUjUeYGkQCGpDGYd5rLTkA==
X-CSE-MsgGUID: v8MnCo+uTyub6ksa6vXnaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72852749"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 07:10:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:10:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 07:10:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 07:10:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKq2ihyw+lCnh93jh43JXw3yUrMa3bEcgAwUBJMCmjpDgcirbQb0+Rgiz+P41Isy5fGdTlLVtG1TlV16gcAv4AFbXGky6WvQZ7epRcq5QP1zMjZX6EdykJdYlrNGp0MqSk9Z1ImuJefxoGFke2FFvHP7p8jB9zbWSqRjcKj8vXiaPObu/B76qR3OOfLALUsMQN70IP075bw97lTpZwDGNJmLDyAhYGcoBaOWE7EoMFJBnn2ahq4mTHCG9okW7PtxeB8s4MzQr4MwUCFCZxNWoMR4Zo1g8dq0pl9vqZ7NL68HZHoNSSNwGUsJ+QXAzvTy3309rYN5Hr/XqRrZJOpPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HgXbI/9syTLOasVO1xRKU3//UKT24U9oTpJXq4Lgds=;
 b=QcefvnsVEN/Bn7ABLstcSsquBySb8BikBf7k6RMfdJ5Q808uUc96aRMyc6X8AAOxH39wUGFUw22ffxyFID4szUEWQuxz6ZOU4hf8BBu+VWDOe67BW8Q8ossXP0H3vaQVcNweJuBqO/iOoyl7S/Ew+sqSKQj6+pbdrkQLWt8w05D1iXdkN1QVom5kd2de54NmrO0AaJjAiArbD1o5E3+HJpzrsVWx3u2UMc7tJTKWJiu1hdbYyjq7JWsa3p8PnEMewnzN7vq60VAHfl+hhSUnDrrEHM+NVKbZNq0/kALpi3VPuv45FRM03LdX67sMN8W1RW7beE8P5q10Dg3INKQQOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Fri, 27 Sep
 2024 14:10:16 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 14:10:16 +0000
Message-ID: <8f18b7d1-a2b8-4749-9680-c2cded2c4bfc@intel.com>
Date: Fri, 27 Sep 2024 16:10:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_submit: improve schedule disable error logging
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20240927133535.548793-2-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240927133535.548793-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b89ad5f-de4d-4166-2bed-08dcdefe1c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDZSa3VuRXk4c1dhOTlrRE9yU3dubFJWWXBGSkE4MzR5UW9wOE4wTUR4ZmYy?=
 =?utf-8?B?czdwa3l3bVhaVXdaaTJJWCs2QUZNYWtadWVBU0I3cjB2dXBqaXdzTWdkQllB?=
 =?utf-8?B?V09GRUxSV3I5aW9iZUNmOWxpQ2xzNkp1ZkNhSlNzaUk0ZmlVVllnVU5iaFJI?=
 =?utf-8?B?cFlpM2dTZ0dNVStuOVliWXR3bUYzdWRkV2JiVnphZmJrbTlBOVdpM25JZ0xC?=
 =?utf-8?B?TFAyczBxVXJzN0RyaW1mYnVMLzdDTExNV3lMcnBkZUdCQXB6bHFsR3EzZGF1?=
 =?utf-8?B?UTVlYXZZdGlPdHVlTmtXbFdIUWZuNmRMWnJuaGJkRU5yZGhOMDNGU3BlaU9O?=
 =?utf-8?B?VkxLWThyaHF5cVl6MG45NXpGZVpDUEpMUEtrT1lBZml5cGZId3l0djlJYTBv?=
 =?utf-8?B?czVyWGdNUjQ5bTFDQ2U4UThOTDRpTElGS2VEb0s2NVhpTndrUFNkRkFRUEt5?=
 =?utf-8?B?aXkydGxaZlhDVVB1OGpkaUVITUVoMjQ1TGNiMFpRNVpyWFFFVkF0SUQzRjc2?=
 =?utf-8?B?ZXhNZGJlYi81M1lqejhoRVNuaWxIdlllYThsNFplZlFXdDhaUUR6NWNWTU04?=
 =?utf-8?B?SDlXTVV2WVppQlJjZWU4dUpEaElXKzhJMS8rZTVrb1Q4YTQwK0lKOU10TmVy?=
 =?utf-8?B?UStHV2UycmZWYWxoWXdVd05EWGFqcDZQblY4M3NjRmJCVjZGWTZnRGFQeGJm?=
 =?utf-8?B?Zk56ZURNczcvRy81QTM5K1FpbzNlSEZadUpBNWNOTjVaMlJjbUNJUG5Ia0RR?=
 =?utf-8?B?ZU1pcTcxaGtIdFVpWlFDL2s4bk5Nb0VvVjI1Q1FtOTdlY1hyNTJ3S0ZMYVU4?=
 =?utf-8?B?dzRNSVBuR0RaK09VZGVHMk52eUgwY2J5RDBSUnBqMGJZZ3BJMFA2ejVGelVo?=
 =?utf-8?B?azk4OGtMVDRWQ25PTWt4NThIOUxueWl2cE0vQlpnTWJ6eGQxVlZoK01OK1A4?=
 =?utf-8?B?S3hVSVV0ZTRuR2JqOTJKcGlueTQ3VHgzZUZwNjduTXNjUVIzOXBRQkcvSFVk?=
 =?utf-8?B?elZKUUU1Z2dnemFlb3BBZ2duby9XV2NKYnBlVFRGaTVGZEJsSlk1QWRWS3V3?=
 =?utf-8?B?QnIrUDQxN2pNR0xoZmIvZW1IeS9acW9FRXZwTzFFd2h5OXFRd0pCdWZoYUtj?=
 =?utf-8?B?ZGFaOHZCMGE1SU1OM1VWK2RGWDl6RkVZbUpZMndzUFg4NjB5STJ1TDRCVjgw?=
 =?utf-8?B?K1FxWFAzQk5LNWgvanZSL0kzNUNmTlB0d2lVZnB3T0Ixb0l3WG9vNXpWdXdB?=
 =?utf-8?B?RjBCWlpKSEdOVkg3dG5JZmF6eGZ6cmRHZlFOTWk5eHNwYlpyRVBwc1h5Umli?=
 =?utf-8?B?bXZ4TzYvZ3hGQXljdkgySHZLVkhXL1IrUnJENnFVMGxrWXVvSElDV0N1UWp2?=
 =?utf-8?B?ZGt2KzN1OGJqV203eko1QUhLcjg4ZVlwUkV4Ymt5Yi9pVFltMnpyUHJnRVJX?=
 =?utf-8?B?Y2RGVWNCUzVSdVo3Sm1pKzJZTGdwTnZpbGhTc0xoT0Y3c2dLQ0x3K0h0c3Yv?=
 =?utf-8?B?NmNYc1NIOE15N2g0ak9FeVpiU3N6ZUpYWGFCcHhBR2pvT2RobklSNkNBNGZL?=
 =?utf-8?B?Q2RveHdkV3B1TTdUVGorL3doOU1nMTlUWUtveG5IQmh0SEtZTFd2Nzh6RmJv?=
 =?utf-8?Q?7/GotVEXasTrfxzJgW5PwUj/5jDen5M4gLme73ORsr9o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2gwNkljNG5SY0NjL2FLZS9TU2dtZmlSd3FnVm9BWmxEME50c0Erc29rYTlC?=
 =?utf-8?B?bGY2YVh3SFE1UEVSVGZVd2FZUGhnUFpkRjVXRVhOVm5udXdhemplaW1ZQ2NC?=
 =?utf-8?B?azM0VWpZTDdkdktVSUVvR3FvTnFZY3hwY09DVnMzei9OaWRWMmdQWjZCMHhT?=
 =?utf-8?B?WG5tUkRYQm92SllLK0RBSEVUelN1cmVQUG9SeU9ucEFNV3Z3aUF0M3hLVjBw?=
 =?utf-8?B?MWpZQjZsR2t3b2JTK1pMdXZjYy9GWmF1cmd2eGNYSzdkRDI2Sy9Ec3BHQVgy?=
 =?utf-8?B?RHU0U2RBenJSN1BEbEJFVityOEJUNERFdWRQOUtvVGYzak11V1Z6dGY5Zjh4?=
 =?utf-8?B?UmtiWWRKRS82VzZzaDdWbnM2Q21jS1ZuUXRmelEwd09qaXZnZ3FnbUUvNFVH?=
 =?utf-8?B?aUpwa0Z2eU1lTkowa3dWcERaVSszWnc2MmpuODRLSDZITlVVNlBGbnNFbTJ1?=
 =?utf-8?B?SXVOWU1vR3VNcVM1NTdueG5PcWE4c3lnYkx2VVRjd2ZQb21zT2dzWlo3anYr?=
 =?utf-8?B?Y3hON3g4NU1BejlubDc4V0NPdDRaMElwanNMUzk2bzhkL2RiS09FdGhUZ3Jt?=
 =?utf-8?B?T3lraWhlRG9sVHlsd1BONmhQajBuY25YcU85TXY1T2ZRRHU5K253NmRMd3ZN?=
 =?utf-8?B?UFR0ZEJzTlhlSmxtQ3RkeWVHbEV1YmU5bUpuMG90VGtZeHQvcW1yajZMeHpx?=
 =?utf-8?B?MGthelpQMXplaERHT2NwWkZLaU5pN3pnK1c5Mnl2c0UrN3lVZ0daM1JGcDhV?=
 =?utf-8?B?RlU2N0M1VXN6Nkllb1kray93YnRGUE5EWExBUThxWW40cEpVZHR4UjJDMm1C?=
 =?utf-8?B?Q2NqSk4rTUcrb3ltbmN4L1pJMmdGdlNDZ0U1K3dRbkk4Z3l6LzdBNmhIT01l?=
 =?utf-8?B?VkZSSW9vZjB1ZXdwUC9pVUlCbWh5ZHk5S2s5NWs3a29IZVowM0pKL2RLbXRl?=
 =?utf-8?B?dXNKRlVHUkFPdmlJbHVOVThkN0Zya3pTb1VCRys5SytKeFdlVVZpUEFVRHFN?=
 =?utf-8?B?d2l5a1Jtd2ZnbTBZaEphRVowY0gvd2FYOG1Cc042YzJOVUI0Njk0KzNpN3Vs?=
 =?utf-8?B?c1ArVTU3dHRUK29NOG45Yk9xVzMyY0lEc05YZVlCY3JSbVhlMmlhQzcyMzRG?=
 =?utf-8?B?MkJodGpCVnBvYXF1WVM2cjR2RjNBdURVVVpJU3dXdHB6TGcrVm9nNlEzNUkx?=
 =?utf-8?B?VDZTRGg1RUR6ZUt1cmtjMFY2VTJkNFJSR3ZNN3dCNzRUZ3JMTnNaUWFLOCtn?=
 =?utf-8?B?TlkzVFdqT3I2ZmxCWU5RUnpadzBhekR2NlNjWW14MjRFb2N3aHdQNlluT2lU?=
 =?utf-8?B?eDNMMEtwRnpWcU9RdS9JMjdXRTlsQS9oaldZdnVYNWl4WlJLeDlzVjA2dVJj?=
 =?utf-8?B?MUJuNldrZkp2TnFFUjhQSzY3QkhmcDVLUWd5NktOQ094MW5MZHFqbUpRcjkr?=
 =?utf-8?B?QVp4WlZRZ2gzMllqYm5WbXRQbEc0c2t5RW5kRzE0aDhhZjRabHV1UTNxSjBI?=
 =?utf-8?B?Z2ZMdXNKWWtIZHJRdlV6MUd4KzE1VkdJNTRIdDIvRzFlc3ZXTWd3REMvNG5L?=
 =?utf-8?B?UUJTRko4OHJ4UjJPaTJHdnJZejFqZkZ4aUtMdFo3UkdLL0h0RHJwM2VoNmdq?=
 =?utf-8?B?VjlNR1BZMHZJL1MyS2VxNzZjYjZ4bDhqOWZkcGhnQXhpN0RHdmFGZ3dCYjU4?=
 =?utf-8?B?cUNMZm5DSkR2MVlldGxnRmdxeUYyYWlSVS8rVDFDa3lpK25valJOR013RGRF?=
 =?utf-8?B?bU1xUmMzZWl5Z3JEa3NsWldBMDUxcFRhWU95SXAzbXh1d0V2V09NZlo1MWZ1?=
 =?utf-8?B?aWR3NURSbWJuWkJWbWRwVlA3NmJYbHV6U3BRQmZNZEJLdlJ1UW1TMWFSUm51?=
 =?utf-8?B?TU8rZHBFVGNUSGpkai8rMk02SkFYbERxbzhGaUNnRjREaGhyQVZkTGVRaU40?=
 =?utf-8?B?bmp1eDU0WWQ5YmphUXgrYmdROTMxR2ZxTmlmMzYyUTMvWU8wNFZQa3ZkU0ZN?=
 =?utf-8?B?dkM1THdRSjJka0FOV2svT2NEMmpEYnVIVzFERUJGVlkyNzU0R1IyR2ZFTmdO?=
 =?utf-8?B?K2lPR3d0dE5KczZtaFR1VHBnV0V0TXdlNEN5R0VNYXJaSWFRdWNHNXBOVFNa?=
 =?utf-8?Q?VYmsBM0HfAUX5Ap9l8eF24Nos?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b89ad5f-de4d-4166-2bed-08dcdefe1c81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:10:16.3852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRr6NAE0I8bcJ9r2cBtwSl9S3BYfe812VKu8oaLZRl/2BA1i7KKsxNjxPRiXbMJiYRms03bXYaZTq8uPlpqCnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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


On 9/27/2024 3:35 PM, Matthew Auld wrote:
> A few things here. Make the two prints consistent (and distinct), print
> the guc_id, and finally dump the CT queues. It should be possible to
> spot the guc_id in the CT queue dump, and for example see that host side
> has yet to process the response for the schedule disable, or see that
> GuC is yet to send it, to help narrow things down if we trigger the
> timeout.
>
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80062e1d3f66..52ed7c0043f9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -977,7 +977,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  					 !exec_queue_pending_disable(q) ||
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret) {
> -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> +			struct xe_gt *gt = guc_to_gt(guc);
> +			struct drm_printer p = xe_gt_err_printer(gt);
> +
> +			xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
> +				   __func__, ge->id);
> +			xe_guc_ct_print(&guc->ct, &p, false);
>  			xe_sched_submission_start(sched);
>  			xe_gt_reset_async(q->gt);
>  			return;
> @@ -1177,8 +1182,14 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret || guc_read_stopped(guc)) {
>  trigger_reset:
> -			if (!ret)
> -				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> +			if (!ret) {
> +				struct xe_gt *gt = guc_to_gt(guc);
> +				struct drm_printer p = xe_gt_err_printer(gt);
> +
> +				xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
> +					   __func__, q->guc->id);
> +				xe_guc_ct_print(&guc->ct, &p, true);
> +			}
>  			set_exec_queue_extra_ref(q);
>  			xe_exec_queue_get(q);	/* GT reset owns this */
>  			set_exec_queue_banned(q);
