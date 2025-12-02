Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF784D12663
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21FA10E64A;
	Tue,  2 Dec 2025 18:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEARJZd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E9A10E64A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764699634; x=1796235634;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BTecsjcqIJ1i2VTUT6MO3I2xy3uWYihs7qMjaAGKRVA=;
 b=WEARJZd0jTWupwKDhXQUIFQWjA7g8o47H6rEpns+NUt7BxiM9U59x6OP
 1ef5jr4Q3uqnoxEZq0unqqwF7BBSUxI8Cv2rGHn4KAruvwcnCngFevhT2
 cEmnhbAsgSn3V80qhvvHTVcr6aCZ5ZEywE1Yd+ofoKSFg4Kvn54eZZUHZ
 IomIvVARMhSNlCo/NXL1TqcDCzNhW5pbFj8BE88ZpeVzWfM2cOmd1cwfY
 DBfkFMb6ZW/YJUFYdJTKEmYsgyd2zg4ID3BsPuqeNMnACRiQSfKyCL1tW
 7MMaghPuK+3QlsOPRG0WTQss9Vq5Yng7bObTmd1beVesnP/r+Duuk9iFN w==;
X-CSE-ConnectionGUID: 5ZmlvzBMSUSALmsgNYrPNQ==
X-CSE-MsgGUID: qNXzGsj3SySasKd+QhRWJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66753849"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66753849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:20:33 -0800
X-CSE-ConnectionGUID: 20+dhn9LTKKHJgaFmbtPTw==
X-CSE-MsgGUID: +F7nBYtJSyS6hJfldfK3oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="231787461"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:20:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:20:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:20:33 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:20:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8IxvAD7ahRT1YSOqZo5yrdlmHQPR0LTYoVsAWWMy33UGyTk2Y6hphtVNJjRNv9euXH+7aUGsSkEQTrBqrZRbWJt0fjNLjvlSjIIthSY4OPhGRvkJ1tViDyIMN/JGz/OeFdToSmykQOqzvT4P+M0pqHDJJbH6Jp51IYwyD3Rn1ul61/4Si8mQvndT1KP+Cyn1rvrOkkNeTCgL4aovvKUs/sSokdbwba70FYKwcRiYtme7sUWtnOrfCjK5ysTf22sZn/BQwxHL7/TPmNuTRymtIoH1gja+V5oxIgHxCwgjyUuAWlpmmiJeQ2Rm+DNtJWAfDqlmjZr8fcDXfdHbeZR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNo6fbBjRYTBagF9ShaOfXXvXUo8U4GIA6jfPf+4U8I=;
 b=TfjLDAAQNZtr6Gc93YxmkCX1zdAy0UjIqQhYtu9ESxb2nt+8F7MWjgKNhLZGmekIlCHa6QYv8aUEYmybWFYHXFvO1hkfD+8mhPXs6PRR12VlF7K8yeekyM0oVxealzRe9CBXOsGoshgv2AeID7xBXhCq2zD1sgwHqYwn/ou250AvYXSFw52N84loYMXYutR4L2syEV92pUB+Y07YHR4whTes1/oavVfEQIlCFZVahXrGqL6oOmNpAdmeuhzZMovGTEAyqhNfZiOsVKefKkR6Wn9rBO4ZUlg3Qq3QJ8SV0Fa3WvXJ/KqEu3AR5c1HZASOGjIbHytiHhsnDBOv6lVN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA3PR11MB9085.namprd11.prod.outlook.com (2603:10b6:208:574::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:20:26 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 18:20:25 +0000
Message-ID: <9993fbe8-fd20-48cf-b82d-b0c070c1d5a0@intel.com>
Date: Tue, 2 Dec 2025 10:20:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] drm/xe/sriov: Add debugfs with scheduler groups
 information
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-18-daniele.ceraolospurio@intel.com>
 <f702edc8-b8b0-4c8e-abd9-5ff017b6c896@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <f702edc8-b8b0-4c8e-abd9-5ff017b6c896@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA3PR11MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bba2435-98cd-48c1-1866-08de31cf76f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHlxcERSbnpJR1d3cDgvbCs0bCtBQzRSUGVPM3NWU0V6dlJvZUoyRlp2NHVD?=
 =?utf-8?B?WXpIY0x3ZjFPeUR1dDBSQnduQU1vRm9TR0E5UkdLVWZPKzRxazJHZVFCREpX?=
 =?utf-8?B?c1Eydk0zYTlkTUZ2cXF2eTlnRStSbm00YmxVVU1MYUlBakQzNzhrZlFhQ0dt?=
 =?utf-8?B?US9pRHF0NzJMYnpmeDhtaVpYYlJqRGcvL09zQXdvZFZCV3pTdjBIMzRRTkNP?=
 =?utf-8?B?aEtaYU82YTJZQ1RLWHlOTnE1eTNvUXRYaC90cTV6VGNGR0JQMDV3ZGN6R1h0?=
 =?utf-8?B?OU9ac2duNmpRblRFTEY1ZXl2Rmo5U3pkTGI0NU5CNnVMQ2RFMUtnOFVIQlh3?=
 =?utf-8?B?NXJCd1dMbFBQOXljQ2R5STVvSDErRm9hcFl5cHlIbzUrdG1uQUxaR2JJc2p5?=
 =?utf-8?B?ZjlCYlRTOCtoN2FQckZFdzBJWkJiYXU0OEwzM0RlYjF3YjdtcW1aMkcwU3FM?=
 =?utf-8?B?Y2pOZWFFNEprU0dNbk1YZTBaQmVYbjR5SEF2MC9SMmNDRUxETG5KRFlJZHZw?=
 =?utf-8?B?T29RVG9DUU41YkRPS2hsNkhHMDZ4WXR6d1M5Tk5uSHdheTlmYXo0R3BNck1U?=
 =?utf-8?B?YkxRWHlLTlJIUU5vTnJTa2NZUEFxY0VUaUtmNnRCdXVyWkNkVExyYVZOQ2ll?=
 =?utf-8?B?NGtPRmY5YUxneXRqRXJ3THFoaUtGVTBRam5GRzRWb1BmTys0eTZZUGhMeXYv?=
 =?utf-8?B?MTNCRGhhMU5UNGtORXJmVHUzM3dzN2hFTmZDVWpHNmc5N2hXYUN3S2hoZEhI?=
 =?utf-8?B?aW5JTEdPRC9pT1F3NEhqWDFJQVk3M3ZBdjFTQnV5TXdPcFFmYlpHUVovM2gy?=
 =?utf-8?B?ck16ZU1wQXNnUGFPZ0VuV2ZlZW9OZWlOWXFURE5Jc0tFbjRpemlNb2kwSHp1?=
 =?utf-8?B?bm5uVDRaRzJ5WUJtUy8zcG9YRk81ditlOEZ3S1lpQnFCZ2FwM0E2TVpVZzdj?=
 =?utf-8?B?Y0p2bGZkdVc0QmhDdkxDck5pbTNnSmF2cHhDMnhCMCtWa1NoWWJvSGgzMmtW?=
 =?utf-8?B?NzQ3aHl2ZVQyUmpkOXNMcUV6VU5Cei92VlVwNUp3dG5VY1lMZGZIZnViKzJj?=
 =?utf-8?B?Z3h6dkJxeXdOdytoN1JVdFVucGF3aEQxMWhiRVROdnlJQmE1R0xDeFhDb2Ra?=
 =?utf-8?B?OW1ldkFwc252elRUSUlFKzBJQkNRT1pHNFFoOXBJaExkS3JoZGFJeWYrZjhu?=
 =?utf-8?B?YmJIcDVhSU5VeDh2YjFYZm1mS0kzTVd1YU1HVHJjSXRoMEg5QnUrbm5MT3pv?=
 =?utf-8?B?VythcVNNNFAxemtacGV5VEVSQ3kzY0xXM0hwcUlPVTY1N1FJcXhFb005ZkE4?=
 =?utf-8?B?c05ndGJabS93UzZveGo2dGlsMFhVa3RpcmdDdUMza3MyekdYWTcwYUxvT1lW?=
 =?utf-8?B?ZUgvTURKU3B1YnM2MVd1UUF4YnAwcnJ2Uk9ZWWJlR0VYUnJJc0c0dEV4N3Ft?=
 =?utf-8?B?YnI3UFVkdDFoRmNzR2Vhb0UxV3lYMnRXdVRTc0R1MVRCenlTa00xV3c2WGlq?=
 =?utf-8?B?MnRiMzRpRnR1TEZBOWplR3cwTHFYdUozc1N0dERvUllVM2hCUFdnemxsMUFU?=
 =?utf-8?B?SCtoVE9vOWxZbHNWeHRWM3dUVzZJU1MyV1FFdkE5UjVxeGdSUmtJVzYrYXVi?=
 =?utf-8?B?WUhDSWZEaGltZDJCZEFCWDJQLzBQN0Y4MkFCUE5qWmk0R0tNT0RxcVAzNHk1?=
 =?utf-8?B?dWZ5V1MzdFoxS3R6NkdhcjNUTjI1WEVQNzVnNG9uMSsxSTZ2OVprbzVFZm9F?=
 =?utf-8?B?TndoRVNxS25EdXVQOHhDTWtGNXNTb0hpQmlXTW5UbjdOMmcwdno4R0RlRXFX?=
 =?utf-8?B?ODU0OFh2b1FSamF1UXErdDhHUzFHNVFuMEc2OWl0QlQxRGttMGpuellKRTVY?=
 =?utf-8?B?Tm13T1RuamNRZTRmVVdLSXNXVWpHQkRFUTI3M2lrZEUzMFp3dXQrai9zd2FD?=
 =?utf-8?Q?PjfJgbvfgQm0ntGzlDHtZyak2/Q+IXWp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmpEcDJzTFByMTRQL0NsbVRvZ3g5RUlacVVzMXBsV3h5U3ZsbjJ0RURCVldo?=
 =?utf-8?B?OUhkU1NaWHV1SmQ0R1lrclRpSTdtVUNhZHZKSGFzK3NIOHdxK3l6QUE2b0w1?=
 =?utf-8?B?ZTAxZFhCZncrVklYY1RzS002b2ZYNjRtalRuUkZrMTR4V3hWWG9yZGxLdWxi?=
 =?utf-8?B?N2kwME9TY2htMk9BQW4xOGt4NnhnWlNzNDAzbE5BNnNxSmhBWFZWWTdEUjZj?=
 =?utf-8?B?Y09VQ3JEbkYvVERjeU02UDNtbHViRnYza1F6OFZoVGVFaWFMQ2x0OC9HQkph?=
 =?utf-8?B?QzE0NUFPL0hwMktZcjF4WkpySlhJTlpLTTJNaFQ1QjFkb21senlSRWpzVmJm?=
 =?utf-8?B?WW1yeHAxVlZqczNmYlgydkk3TFdHanl5ZXo3RHNua1VHOFROSERmNkFOVU1y?=
 =?utf-8?B?Q0tONC9GcHlFRHZJbWF2ZUVzTUxHUXFuOHZaRXRSSkp5Q2ZRZFB3RDE5U0ZX?=
 =?utf-8?B?WkxWWlZkclZJcVY4M3UxRnZ2ekNKdlIzbUxTbVNaTlI0WmcwcE9NUmRNbldV?=
 =?utf-8?B?MjJ0WUJLaUNwQ0haWm40dnVyRFN1UHhhaTlrbFFxa1IzVHAvMUhKTGhlLzAw?=
 =?utf-8?B?bS9BRXBMNHlvbWFGdDQzcnR2bjM3allIQmFLZGJ2RXU3L1dadzUrM2VhZFNl?=
 =?utf-8?B?TG1NNm5sYmsrVzd3b2V2WDhGSjJKM2ZjUENHVE1DUXpIWEtHMDB0Mlc2VFk4?=
 =?utf-8?B?YUpFSDgrRExwbzU2VllCQ0lHWnV5YzJrTEFHZDc0d0pBNk5DRSs2TFIrTHZj?=
 =?utf-8?B?U2RaVDBCQ25SOHdSakJYc0lFTml5bWxueDhjYlczeEZlT0VaV1I4S2J2eTVB?=
 =?utf-8?B?U25iTEliSkM3b3RBUk54bVZoc2lKdWZ4QTFCSGRPT0x2alNycUJnaU0yNDdB?=
 =?utf-8?B?SWtNY0NIVVQyNTlka3lkZ0x2UzBsTFFFaEJWV3BXYkZJVmxaNDZRbnhTRWZU?=
 =?utf-8?B?T3pjeEJnK0FDZUdSdk8zU1o1T2dNVzlOYWd6VWZ5c3VPZ28vai8vNkNjWkNh?=
 =?utf-8?B?dTVpLzNWcEluWFRrSi8zTmhDYWRENUkzVFYxRFltd3JyWGN1WnpEQ00xdkdX?=
 =?utf-8?B?RFAwMEs0OFNmeUh4bVR5YzYvbWdkZ3pYN2tzQUFPenZkd1FoL1V1dldDSW1K?=
 =?utf-8?B?R09RTmdYMk5PWjRMSWNWRkVHY0xxMEFoNjNIRHp3SUgwQkZZS1lXTGdxRExi?=
 =?utf-8?B?MGc0UmUzNW44Q2xCY00wbUdJdE9JcVlSV1BMMjVLd2hNemZROVJEVitDcUFi?=
 =?utf-8?B?U050Rm83SnlIRy9aeVdWZTVZd05CSExyZWRva3FEUmZ5OGpZWnZiczlEZ00z?=
 =?utf-8?B?c0lhVHFUcHNSSE5vVnE4emZvRS9QMU5aeWkwSHF2cCs1MjJxNlNYaS8wRyt1?=
 =?utf-8?B?MTZlak1qa0dldjNnZ0l6SHU5MDdmNWxmYk4xUDN1U05BSEIya1UzK0xrcW9F?=
 =?utf-8?B?QU1zR0QxaXIxaEF0ajZNRFB3ZWp0R3RrSk44OVlKSlhJSTJWWFZoWTg3SjlJ?=
 =?utf-8?B?dFF4ZndFRk92VGpTUmNlUFZybUtrYi9icHo1R25qM05oNlVlYzRpV1ZCc1hV?=
 =?utf-8?B?dGgyU0xlMmtLdjRlSjF6MERST202U29KTzdnV0ZsM2JaTnlHc05Fa2M2eEQ1?=
 =?utf-8?B?V1hrc0J0UmROLzFhY2IrTWRMWk1JeW9QNmNUamxEN3BqSU9VWDJSRW1SaEpn?=
 =?utf-8?B?eTJvTGduSE9MMm82dEM1bGFwbkl6WHFXRjBmRlBRK1BPZzJ6Sks1WlcxblZK?=
 =?utf-8?B?N2FFMHZXRW1MdXFkTGhxUE5KeE9HMjc1SGpDTFNJL0NHV01HNmQrb2szTUFG?=
 =?utf-8?B?SWhjK0h3MnBJS0ZMZXcrY0xLcFd3RXYrdFpjMzhTYU1lWUtITHQ3Vm05Qktn?=
 =?utf-8?B?ZWVIU0hDQUJXN1l1R3BZWFA5UDdncUhDY1NHVTExZUZBNWxlMVlKeGNjSG0r?=
 =?utf-8?B?L3dhZmI2cFlHdFlpTEd2M2ovVzBVejlzK0ZSQmJLZ2lpeVFBREI5S3NBMTdv?=
 =?utf-8?B?TVNVaDJYaVNaOUtKWmhqNEUvN2VUNXNuNVRUbjVFUFg0U2VnY0IvUnVIdjJK?=
 =?utf-8?B?OXVBQzNWd3YvSk8xeDE4TDRDbEcrODA3N214eFdoYkhReTlldm1yVHJlajhH?=
 =?utf-8?B?VFd6TGthQllNQ01yWlFuRDF0VG4zeW9idTRHTU1uajM0Qk02TmgycnhrTGo1?=
 =?utf-8?Q?dOpLt6jeVUTnrMOJHVZYTaQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bba2435-98cd-48c1-1866-08de31cf76f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:20:25.8166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rS4PXdtLS4uio/ctzM9PpYhyDdU09WB8X6c/5sXkmISw7m9F06VGKMR1ZrwqIlJoMOJv01NzfL+BzJHqdFqLoX449De3dWAkxyr8TGS0DZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9085
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



On 12/2/2025 8:24 AM, Michal Wajdeczko wrote:
>
> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>> When schedulers groups are enabled, we dynamically create new debugfs
>> folders under the GT folder for the PF and each VF. The aim is to have
> hmm, but since this is debugfs and groups (even uninitialized) still exist
> then maybe it is easier (and safer) to create static list of groups (8 or 2)
> and just print their configurations: either empty (if uninitialized) or with
> engine names (after selecting predefined EGS mode)

ok

>
> then debugfs files (not directories) will reflect currently used configuration

See below about the directories

>
>> all the info for each VF under the sched_groups folder, with individual
>> folders per-group under it. Right now the only info is the engine list,
>> but follow up patches will add execution quantum and preemption timeout
>> as well (which are configurable per-group-per-VF).
> but groups EQ/PT configuration is not per-group, but only per-GT (GuC)
> so it should be OK to have them level up

ok

>
>> Note that the engine lists are not configurable per-VF and therefore not
>> strictly needed in the VF folders. However, it is still useful to have
>> them there because an admin might want to check the engine list while
>> configuring the EQ/PT values for a specific VF.
> duplicating RO entries per-VF seems odd, maybe it's better to use symlinks:
>
>
> /sys/kernel/debug/dri/BDF/
> ├── sriov
> :   ├── pf
>      :   ├── tile0
>          :   ├── gt0
>              :   ├── sched_groups_mode			# disabled [media_slices]
>                  ├── sched_groups_exec_quantums_ms	# 20 20
>                  ├── sched_groups_preempt_timeouts_us	# 2000 2000
>                  ├── sched_groups
>                  :   ├── group0				# vcs0 vcs1 vecs0
>                  :   ├── group1				# vcs2 vcs3 vecs1
>                  :   ├── group2				#
>                      :
>                      └── group7
>      ├── vf1
>      :   ├── tile0
>          :   ├── gt0
>                  ├── sched_groups_exec_quantums_ms	# 30 30
>                  ├── sched_groups_preempt_timeouts_us	# 3000 3000
>                  ├── sched_groups --> ../../../pf/tile0/gt0/sched_groups
>
>      ├── vf2
>      :   ├── tile0
>          :   ├── gt0
>                  ├── sched_groups_exec_quantums_ms	# 40 40
>                  ├── sched_groups_preempt_timeouts_us	# 4000 4000
>                  ├── sched_groups --> ../../../pf/tile0/gt0/sched_groups

My idea here was to have exec quantum and preempt timeout configurable 
for a single group, so the end result would be something like this for 
PF and each VF:

	    :   ├── gt1
		:   ├── sched_groups
		    :   ├── group0
			:   ├── engines
			    ├── exec_quantum_ms
			    └── preempt_timeout_us
			:
			└── groupN
			    ├── engines
			    ├── exec_quantum_ms
			    └── preempt_timeout_us


Which only works if groups are folders (which is also why I can't 
symlink the whole sched_groups folder). If you think that's overkill and 
that we should just keep the option to set all the groups at once then I 
can do that and not have folders. I can also just drop the engine lists 
from VF debufs, my idea here was that if an admin is setting the EQ/PT 
e.g. for VF1 group 1 from within the VF debugfs folder it might be 
useful to have a way to check which engines are in the group without 
having to go back to the PF folder, but it's not really an essential thing.


>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 140 +++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h   |   4 +
>>   2 files changed, 143 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 2953ef21a5ad..947e2b92d58a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include <linux/debugfs.h>
>>   
>> +#include <drm/drm_managed.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_debugfs.h>
>>   
>> @@ -21,6 +22,7 @@
>>   #include "xe_gt_sriov_pf_monitor.h"
>>   #include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_pf_service.h"
>> +#include "xe_guc.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov_pf.h"
>>   #include "xe_sriov_pf_provision.h"
>> @@ -162,8 +164,127 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>    *          :   ├── tile0
>>    *              :   ├── gt0
>>    *                  :   ├── sched_groups_mode
>> + *                      ├── sched_groups
>> + *                      :   ├── group0
>> + *                          :   └── engines
>> + *                          :
>> + *                          └── groupN
>> + *          :                   └── engines
>> + *          ├── vf1
>> + *          :   ├── tile0
>> + *              :   ├── gt0
>> + *                  :   ├── sched_groups
>> + *                      :   ├── group0
>> + *                          :   └── engines
>>    */
>>   
>> +struct sched_group_info {
>> +	struct xe_gt *gt;
> we should be able to get gt and vfid from parents d_inode->i_private

In this implementation the parent of the engines folder is groupX, and 
that one doesn't have that info in d_inode->i_private. Might change if 
we drop the subfolders.

Daniele

>
>> +	u32 *masks;
>> +};
>> +
>> +static int sched_group_engines_info(struct seq_file *m, void *data)
>> +{
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct sched_group_info *gi = m->private;
>> +	struct xe_gt *gt = gi->gt;
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +	bool first = true;
>> +
>> +	for_each_hw_engine(hwe, gt, id) {
>> +		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +		u32 mask = gi->masks[guc_class];
>> +
>> +		if (mask & BIT(hwe->logical_instance)) {
>> +			drm_printf(&p, "%s%s", first ? "" : " ", hwe->name);
>> +
>> +			first = false;
>> +		}
>> +	}
>> +
>> +	drm_printf(&p, "\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int sched_group_engines_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, sched_group_engines_info, inode->i_private);
>> +}
>> +
>> +static const struct file_operations sched_group_engines_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = sched_group_engines_open,
>> +	.read = seq_read,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +};
>> +
>> +static void __sched_group_info_cleanup(struct xe_gt *gt, struct dentry *dent)
>> +{
>> +	if (dent->d_inode->i_private)
>> +		drmm_kfree(&gt_to_xe(gt)->drm, dent->d_inode->i_private);
>> +
>> +	debugfs_remove_recursive(dent);
>> +}
>> +
>> +#define GROUP_INFO_ROOT "sched_groups"
>> +static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
>> +{
>> +	struct xe_gt_sriov_pf_policy *policy = &gt->sriov.pf.policy;
>> +	u32 mode = policy->guc.sched_groups.current_mode;
>> +	u8 num_groups = policy->guc.sched_groups.modes[mode].num_masks / GUC_MAX_ENGINE_CLASSES;
>> +	struct sched_group_info *infos;
>> +	struct dentry *parent;
>> +	struct dentry *old;
>> +	u8 g;
>> +
>> +	if (!gt->sriov.pf.debugfs_roots)
>> +		return;
>> +
>> +	/* remove existing debugfs entries for old groups */
>> +	old = debugfs_lookup(GROUP_INFO_ROOT, gt->sriov.pf.debugfs_roots[vfid]);
>> +	if (old)
>> +		__sched_group_info_cleanup(gt, old);
>> +
>> +	/* re-create debugfs for new groups (if any)*/
>> +	if (!num_groups)
>> +		return;
>> +
>> +	parent = debugfs_create_dir(GROUP_INFO_ROOT, gt->sriov.pf.debugfs_roots[vfid]);
>> +	if (IS_ERR(parent))
>> +		return;
>> +
>> +	infos = drmm_kzalloc(&gt_to_xe(gt)->drm, sizeof(*infos) * num_groups, GFP_KERNEL);
>> +	if (!infos)
>> +		goto out_err;
>> +	parent->d_inode->i_private = infos;
>> +
>> +	for (g = 0; g < num_groups; g++) {
>> +		struct sched_group_info *info = &infos[g];
>> +		u32 base = g * GUC_MAX_ENGINE_CLASSES;
>> +		struct dentry *dent;
>> +		char name[10];
>> +
>> +		snprintf(name, sizeof(name), "group%u", g);
>> +		dent = debugfs_create_dir(name, parent);
>> +		if (IS_ERR(dent))
>> +			goto out_err;
>> +
>> +		info->gt = gt;
>> +		info->masks = &policy->guc.sched_groups.modes[mode].masks[base];
>> +
>> +		dent->d_inode->i_private = info;
>> +		debugfs_create_file("engines", 0644, dent, info, &sched_group_engines_fops);
>> +	}
>> +
>> +	return;
>> +
>> +out_err:
>> +	__sched_group_info_cleanup(gt, parent);
>> +}
>> +
>>   static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>>   {
>>   	switch (mode) {
>> @@ -220,7 +341,7 @@ static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>>   	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
>>   	char name[32];
>>   	int ret;
>> -	int m;
>> +	int m, i;
>>   
>>   	if (*pos)
>>   		return -ESPIPE;
>> @@ -250,6 +371,10 @@ static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>>   	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
>>   	xe_pm_runtime_put(gt_to_xe(gt));
>>   
>> +	if (!ret)
>> +		for (i = 0; i <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)); i++)
>> +			sched_group_info_register(gt, i);
>> +
>>   	return (ret < 0) ? ret : size;
>>   }
>>   
>> @@ -693,6 +818,19 @@ void xe_gt_sriov_pf_debugfs_populate(struct xe_gt *gt, struct dentry *parent, un
>>   		return;
>>   	dent->d_inode->i_private = gt;
>>   
>> +	/*
>> +	 * we allocate an array to store the GT-level dentries for PF and all
>> +	 * VFs when creating the PF folder. Failing to create this allocation
>> +	 * is not fatal.
>> +	 */
>> +	if (vfid == 0)
>> +		gt->sriov.pf.debugfs_roots =
>> +			drmm_kcalloc(&gt_to_xe(gt)->drm,
>> +				     1 + xe_sriov_pf_get_totalvfs(gt_to_xe(gt)),
>> +				     sizeof(struct dentry *), GFP_KERNEL);
>> +	if (gt->sriov.pf.debugfs_roots)
>> +		gt->sriov.pf.debugfs_roots[vfid] = dent;
> for per-VF data we have struct xe_gt_sriov_metadata that can be accessed from
> struct xe_gt_sriov_pf
>
> but maybe it shouldn't be needed at all if we create static egs files as
> suggested above
>
>
>> +
>>   	xe_gt_assert(gt, extract_gt(dent) == gt);
>>   	xe_gt_assert(gt, extract_vfid(dent) == vfid);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>> index 667b8310478d..747ec5dae652 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>> @@ -15,6 +15,8 @@
>>   #include "xe_gt_sriov_pf_policy_types.h"
>>   #include "xe_gt_sriov_pf_service_types.h"
>>   
>> +struct dentry;
>> +
>>   /**
>>    * struct xe_gt_sriov_metadata - GT level per-VF metadata.
>>    */
>> @@ -52,6 +54,7 @@ struct xe_gt_sriov_pf_workers {
>>    * @migration: migration data.
>>    * @spare: PF-only provisioning configuration.
>>    * @vfs: metadata for all VFs.
>> + * @debugfs_root: GT debugfs root for all VFs.
>>    */
>>   struct xe_gt_sriov_pf {
>>   	struct xe_gt_sriov_pf_workers workers;
>> @@ -60,6 +63,7 @@ struct xe_gt_sriov_pf {
>>   	struct xe_gt_sriov_pf_policy policy;
>>   	struct xe_gt_sriov_spare_config spare;
>>   	struct xe_gt_sriov_metadata *vfs;
>> +	struct dentry **debugfs_roots;
>>   };
>>   
>>   #endif

