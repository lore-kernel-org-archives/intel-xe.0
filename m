Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42113606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n/Cwv6SW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF65510E343;
	Tue,  3 Nov 2026 06:20:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EDB10E343
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686806; x=1825222806;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z1iKXI+T9FD1iBG/YLOS2zXruRABKX4AYAEWQwIGdow=;
 b=n/Cwv6SWj1rSipIUmFbIOd9sKrP3gIFg7xFOcNjG1Rie3EOw0BJk+OoG
 v+gJnjbVom8u4kEybLeZuaSEQyOt/JF1wbeJGDtcl0mt7orMftwRWZgOz
 zmvln5i6re6y+M1cbJTPf18FG5kgQ2esAYdgtquaMV30Uftx7IAUp/sib
 gHMsN1teU7RWrbRe0FhYCFtPWdgB6GHg0FLRmKsTemgiaKtkrKKS9AkM0
 zuapxzNr0dsTMtisjnZOG6fThO61nye3MDPdDNynO0TmFgM+7UuA9NLdT
 nm6AYJjubrdanRzMK/jVAx81uWiWH/dIiD0K50mMCAug9jWwd+wM7qLzn A==;
X-CSE-ConnectionGUID: 1dDWrwfWQmyFH1eAMeZ7qg==
X-CSE-MsgGUID: orTIiAJSQPWBgTr+E02HGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2285992"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2285992"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:20:05 -0800
X-CSE-ConnectionGUID: ngq4sI+8SzCws2leNnEfHA==
X-CSE-MsgGUID: fEhdKZuyT8mF0UMDgxqNvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6181363"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:20:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:20:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 22:20:04 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:20:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOApK1ctaf/TT3p7pws9tKYP5NP+kW82MqWLq/2FdX14to4ykTGZ+mlHC0B1XsggrRjsgdSfGGCzUpFCdwz5I5PkuyPYP8SO8TyzUfloIp4PpgYbnmXZQCvhm7OhntSl5YbR0c8+cV9ler4Bt9PK0W0xmXMQWl69lzdc62touSNaxBME3dUVR6GSW5ZP2y5/FcCMYIVvSV2RXXAnU7OVcQNoqtdFLsHzS+PVcJC6MX6z1y57xItBIjhTC3c89Mh2KAx2qacAGCjnyybVCu72PfDmtAinQ82vuGW1CT09WAiXTWOshz6Ppk1Kdeg9BZ2iK1g4/IXo8pBCK//7IvFvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cDPWiXlci6WW3rmSjaHOHxF29X1Ojgx4EY7keNiLDI=;
 b=NsE1xbyaSC70JcNCuJIBJLSMx/FEuIQs7AUz+BSGanTHuL5qp5KaEW40Xe07QQP4pTCxP8vOMRscQfMeYqgGGc9GebXGWCYRrioTIFd07jqjs11Cq0YToqUEPO4NiQzzIe3B98/ZwL1EseDtQyO9m8Nf1oxZsQnaPQHGR7re1yN63NlNpoc2rz6YX8hkG4LaWo3Rm6NTmMmlB3wm614uzIlVZJ1G2/opNHj6z8ufXWxRWzD0RdJXidbP6A4riB49HGALxnmAoJIzkpj+NGeAblGjn9wSIGYF32lN8iyjUkgc1xwfszBJiseN0WY1SdJ/nI3Eno7iGMKZkFo1KyIgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:20:01 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:20:01 +0000
Message-ID: <263a39ef-58c2-4acb-96c5-a0edb06c4272@intel.com>
Date: Tue, 3 Nov 2026 11:49:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/xe/ras: Treat non-fatal PCIe errors as
 recovered
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <tejas.upadhyay@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-12-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261103060929.1586783-12-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::12) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|PH0PR11MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4ab37a-8462-45a4-8bdc-08df39727dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|4143699003|56012099006|261009223027099003|261102123227099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RCn3/bFJ0gaWsbQEocbqcqqgGpbqlNExKt15RLZX1jTnx01OtdtliWQV6GOGiU80VF9T7EMEm8QeC5ToXkESBM0yPgOV+b1RDJvKAe7Yl6Xw9AkzH7BvoAjITIUvqVsQmusATJBEhHBAMyECBHPmSQv/S5F9SEkmDY6P65lpJck0MuwCpqpDDkyRc/zYO0XY8awNgh3OfHmgXuVufVj9jn7tjSbmL1IJgSrkzEJHMPIhZvwySGKz2FzHqh4sAFYi636TGsgcji1WwVvPtK8hOY9fUR1HHJ+syfPud9RM7Cp39NB1pIcqncISGSAlYknapx4WRyneJbeFQJXscPLSBJrToR4pkH2vxjqwfquZgRvDQ3xj7ccPe6EDR14ebi7y+P61AZvhbu9OOwUqvt1db87rtfxtVtTwzMAWooIb9BhD9n0kqfUxYb9R7zQkWxtool2mkHtw/Oy965S9FaIidIglyOPDdoYbtjp4jP8r2YHfoz+qT86dl9n7LG3AOrYiZP5VOsfBm9b7T6QqwFU9vTSUzoxPTJthszb2IAtvzOJl8/7VellEauJcJeziMbpPvh6D+AxBT+n3hpo5vtDE/PwDcFp7DxIxy23LyaLdu573TDIYpUm09I6mv9Wn2jqWtZUcKSBH6KNx6AtHZrYZqNuk9TzgipDXhWnLK6jeXno=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBNTjlSOGVqUjJiYTBMVWR1eHhEVzRWLy9uclVNOXd4RUNxK2FkaUMzTXk5?=
 =?utf-8?B?ZXRQRzN5TjJtc1JHdTNoWUdYMmVseFVpSzJ2bVlNK1NPcC9jK3lRQkdRVkw4?=
 =?utf-8?B?b05EVzN6ZzZCTFFHQWo3S1VLZDFadGxRT0Zodjl1WmhYQ3BUUkFjWWg5VVp5?=
 =?utf-8?B?NEFMRmRJUnNqOXhENmtuZkd0Y2RJWEk5R1A2WmtBTkkrM0JZWEFydXZtSFZF?=
 =?utf-8?B?d1BSSHY4Nlo5M3dTd1k3bjBjRE5pVTkydjdQL05MOFdWVHJSZXA0YmttQW1J?=
 =?utf-8?B?dE1QZnJOOUdldTFnYXhoR3ROa2trSmJCNFUvdWtzOERxVmxmdW12ZVZBM2Nv?=
 =?utf-8?B?SGZ3aUljcGVGc3k4WWoxYkxvRHVkVmtueVhXYXRNSzVCYjVtaG5nbStReEpz?=
 =?utf-8?B?ZGMxR05jTTJLMVM1a3Y2OTZPOUlhc1BPM3Y0MzY0N1JIbnJkSEloc0Jic0xH?=
 =?utf-8?B?TjFTVXdlcEd2TG1ETXJNZEltaEtHWnlsZXRVWU9SYzBuWXJMRUdCRDF2Vkc4?=
 =?utf-8?B?cWhBOGRzcGd3Q0dqcGQrZHlpUzdFTEtZc1pMVUtzb2E2cExSYmFXNSt6cTVo?=
 =?utf-8?B?U3R5ckEybFNTZ0MwTHpPZG95eWE1WGRGb2tWYUd5NGhJV0tSZXlacE1hbXRW?=
 =?utf-8?B?NmdEbnpmdXhraldZTkZUVmxMRHlwblduYlhNNUhRY3Vpa1BPTENWd2wxVWdE?=
 =?utf-8?B?ZTdIUEZpN2RpOVNmeDZOQWFhZ1pIcnZ2WUx6Yk1BSTU4ZkNweEgybTBtTnVw?=
 =?utf-8?B?VkUzUU1temNFU1ZCK1JoVTBGQzgvRnhrd2tkd2FCOG5TWTdYc0JLUHRUd1FV?=
 =?utf-8?B?V0lEWHNVK3RNeXF0QWhBeXM4azdMRW1rMGVITW1IS0pLaHdBa3E1UFNjMXFa?=
 =?utf-8?B?ZThjRm5NalllYjVOY2xUc2JFQmJQU3gyZTV1TVlZNFRocTR0aDZpNGFWWWNr?=
 =?utf-8?B?NG45by9XeC9xZzdZYituWDF0WVV0NEs0L3RUN3VIdlJ0RVUwclJyN0VkSlIw?=
 =?utf-8?B?bFBZUjdleUYzUkNPRG5zTWduQXdJamQ4Tzk1VnJXRk5UNzFHVzAzdlIzQkJk?=
 =?utf-8?B?cDZaYWI4V2x5bk9DQVk2cmU5aHpwZTc4VDdIUVhBbzJXWDBCUXJBVzZoZjRn?=
 =?utf-8?B?bUtEVm9yWEFiRzN3K1UxcGtPSmNIaSt3TFA4K2huTmx0NDJiN2MwUm14cmhO?=
 =?utf-8?B?SXlTYTN6ODlSTVJJTk9jVmV0ZjdjRDFrdnBndzVlN25rNlFidm16Z2xYZXM0?=
 =?utf-8?B?MVk4Y0NNNHlxWUZHNnpWM2xZZTJTYUlEWWV2SFh3QkVOZjJmREloYkpDc2hO?=
 =?utf-8?B?dmtsdHlVUGxXL3JlcDVhWWFaM0JXTnhlVlAzWkR1aXcyNGI0Ty96QVJJdk9j?=
 =?utf-8?B?Q0dWbDdVOHpqUXpvZVZka045RU91MDArSjdhcmt5TUhSVFhoQVZHUDN3cXh2?=
 =?utf-8?B?L1RlZTByd2V0UDFML3J5dWZTWGNwYnozRGZtOERQY2JMcXZna0w4REJxQTh1?=
 =?utf-8?B?QmQ4dDlYMUZRdVJaL1Z2Z1NMaTlkejNJbGZHR01iWjdEWHA1ZWFNR213MUlR?=
 =?utf-8?B?aXA0Zlk3d01KYzJhUUVXdFJxeWJWK2RtZ2pnWU1MMWFvOEpHMWt2akpFVGVy?=
 =?utf-8?B?UEFnZXNyemRzbzNoNDdzaFFKYk9sZlp0azVrY0t6anZFeEFFdjR2ZHFQOGVx?=
 =?utf-8?B?WVlEd3YrdDMxNlpoank4bjd4T2dONjAraHAzWmErU3hTV3NsSE10eXEvOC9J?=
 =?utf-8?B?cnk0V01odG5heklTUm0reUxacC9MZ1NNK2w2VWlwUENFelllWGQ4WWFUVXdL?=
 =?utf-8?B?eUNtTHladTlSdHpveEJyWjVBOWtiQkZEaUtCNHNhS0ZuNTRNVFgvcFNkNytC?=
 =?utf-8?B?Z2E4WUFJUUNNUUxCZkxWenE2S1U1SGdCUzJPUENyU29Kck8yVm9hQkZsbVpy?=
 =?utf-8?B?TDVBSDBzR3RNQnhYMlVjSmVzV2cvanZvb2RyUFppZUdndHV5cmhUNTVtWjEv?=
 =?utf-8?B?azlzbldkMThBdkRRV2F0SWhmTWlIYmtvMDVYcmYyUEZKTGRqUGlBMDljWUFS?=
 =?utf-8?B?UTJWbzlPdnhkWVJwWjRPa2FSWC9lL1dBZmhHaHMyQzFpVTgxQTk0WXYzTVAx?=
 =?utf-8?B?dHh5NDRmSjdpOHc1d2FxUjV5U1hPNFhzVllWUGU1MktCUEwrS3lWb2k1djc4?=
 =?utf-8?B?NWlnamg0SDlWbXRGRjNSaFA0cVUrOTExMzJTNktFYk1rVkJOcHdxVVEwajJF?=
 =?utf-8?B?dVI1ZVFmZStDd2kyY0hLOE5NaWV1dFhhRkhSTVN1b0tnUTg1Z2VQd3VVc2FQ?=
 =?utf-8?B?VWN2VFVnalc2bEYvcElXSUNRU0c0OHJTaWtNWFl6b2l1KzRrN2krOHFCbHY3?=
 =?utf-8?Q?azZK24SevbkEB7Xc=3D?=
X-Exchange-RoutingPolicyChecked: EfO6xxSz1ATtDb0IjZ1sc/OV1R2i2VU4fCKrc3+cqSVhuM+5/r7DkwuS9/jKARbXIk0CBmEIA7QZaAm8gC3CI1YbhhnjPmca7sJFhwwKemsctEtbxFweXwG/YrAT66sxIkuDXfke+qd5vIKbK/xgeGLhvyHrjKfS34WZGx7h8LoLGYabuVt31MuzO5i7rwZLO/i9tBixxQyKfAc3rpKw2u+4jyyfgTFcIuGkpf6JqPgya1qhAvLChOCDWib3pU7UO3ChTUcFacMWlPhSVcGIPJTHl3BurlNG7Mxf/pLu7z6t+FKes/468m8rkYgM4pXt4W3j4nZNoN1gO76YrcJjBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4ab37a-8462-45a4-8bdc-08df39727dbb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:20:00.9458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+srYFRMB0is5ajmZdwwD4emI19lKzGZnQYn5z5xJR8tzKGouAg1E7QnC0V4fAy835C3ZCZqWRfNBJystQ+fR2aKQVDBihsmbW9Cw3838jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
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


On 03-11-2026 11:39 am, Riana Tauro wrote:
> On systems lacking RAS capability, only PCIe errors are reported, via
> AER, not device errors. Non-fatal PCIe errors reported at the Upstream
> Switch Port (USP) have no impact on link or device state, so treat
> them as recovered without requiring a secondary bus reset (SBR).
>
> Fixes: 25913a062cd4 ("drm/xe/xe_ras: Add support for uncorrectable core-compute errors")
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b..cd753c82b0ff 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -830,7 +830,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   	}
>   
>   	if (!xe->info.has_sysctrl)
> -		return XE_RAS_RECOVERY_ACTION_RESET;
> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   
>   	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
>   	/* Default action */
