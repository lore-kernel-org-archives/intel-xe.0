Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F20CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1255910E838;
	Wed, 29 Oct 2025 20:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqTl83ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AE210E838
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761769566; x=1793305566;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PqQu+US9gz4XEd1FObfS808tU9UFbHF8EEc6DYBBMNQ=;
 b=NqTl83makhFEjS96yG5yJMJvqVgUakkikSQ9WrXgs70QjmXWKB82SA0o
 cDE6fSjWaFD8xY+lvJQM1iOrx7AgxVTgZcKNZoJ5MKqBsajoS3P/wIyr9
 5oTov3BNYEUkI3H6hSPmOAJik6XK1BA/N6k8dwBWHDEnLl6QGX/ZB7bQ5
 zh1winkKx/zC/WxIqcQwaUjv1+UnTGUe4b+FYTsKYWAQITkdmGRvbB/K7
 aey81MoYFrQ/phx3G74Qdf/XVoK4rMnjsh2rT61fdfIR7LAC9p2x772nR
 ilovSDLSXv4yR9E/quuxLrEzvc6STXLW7fwKZWMdhZ7qYZ763Tp6ocnKN w==;
X-CSE-ConnectionGUID: E7wwGn1zTsGXOiN3ehVxxA==
X-CSE-MsgGUID: n/CHV2wiRki4pZ0LqMORuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63812649"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63812649"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:26:06 -0700
X-CSE-ConnectionGUID: X7IsCcu8SzaTNJP2pXIRpQ==
X-CSE-MsgGUID: 7XL0OrNeTtyOhUQYswP7dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185642625"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:26:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:26:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:26:05 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbG6+85Uky9CdIDJuTaz/pd03dllUgx7/2vrlkiT6G07n98Pzgmqq5eggWWA4gpNjskuSqUHT+OpD4+mav/lK2HAwgbjaljEjACebheHYChjPMRkvKD+C8PbpTVHDew7nYH67IXVMUr5GGXpTaerpk5fSlwjPUsN4KiUGwuKeG8c+QgM89Y4VxEiQwbRhZVEsn/pKh0YLJ66l7TAvuR9XH7I75PqyQZYs4YENUDPH1RPIR8mW4FDlqMklmitbyXdZHN8PqJPLvxD9lr6v6TL2hY4Uu3mLBU2XiDV3GW9XlpsseWYLmwEQgJud3yk0DaGItV1CWD+PiLg/XxlXVnBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7fpTq2PKE7UjrFw7D1wxnT3LKv5KMt9B58sieV6Iz4=;
 b=je/sLz3hk1RL20DDW2i2+F1MUfn5E87O3QFFf/t2V6ClXRh3GEOk2gE/QiO6A1ek239quCWF5VfGO36UmjraTSaJbkP8QEwnEcPmJLnqOQpKIIIjisLhloprt76Ci6i2Xu8HwrsrKcuVKmkhaMmeCtquOcc7adAclssJZC5G9JI9DPNZejDFIvwmoANyB8uwp7ooy39XsQZTNoG9GdDpEcWsEd/uaavWSZEycYg2cgA/VGtumMb1UK6r+Rgc8VHNeO+OV92rTLITPO9gvenPmucxnIK+8eN9rA0qlUlP4vmpl77qfU499Mr8xnOdmvkjxo6/uc6w52xOXHj1kI7N/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 29 Oct
 2025 20:26:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 20:26:02 +0000
Date: Wed, 29 Oct 2025 15:26:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 05/17] drm/xe/pf: Allow change PF and VFs EQ/PT using
 sysfs
Message-ID: <i4y2tjprpy7msl5t7mrrpi6wawrzdsdvy62ckpxb5etsq5fyyl@okskekzccorm>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: e121f1ca-796a-4fe2-cb86-08de17296141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHJPVlFjRUdnaVhWT0dKK0RzeE5tNWducWV1RjNHZmlpK0QvM1RlOXFUR1Rv?=
 =?utf-8?B?ZDlkMWpKSkhBT09NMWYrb2ozVGlFZ3pVQkpvbGZ6QS81bE1Bd1NUZTlubGRY?=
 =?utf-8?B?T3VvZHp5M1h3QWNhQThDdTNiTk40djZjaE5QanUxZ01WMFdXRXhOQTh2OXpS?=
 =?utf-8?B?VVZtbXl3WWw1dlkyQlpxZGpmQTZldDBybG5oNCt4L1dQaUwvNE1sZ3JNb0dQ?=
 =?utf-8?B?QnFHdC9MV0pxRFhBbGRoeVhrL2dHTG9IUnQvN1VOdEZob2Q5ZjNnYjVDQjVI?=
 =?utf-8?B?MVVoQ2lsTmZBVkptVzROY1AvMUFnSmRzbFhPemFxK2M1SGN4SHBjQ0xLd2tT?=
 =?utf-8?B?d295REpHekRjNVVRK01JUFBtaGlGZnBsOUxtTEhXVU1wa2MxeEt5dVZ0Z0hz?=
 =?utf-8?B?MFhVL0RYZUZPa3BwQkY5dGw4WCtsdXpWWEhzczAzVXlWRTFRUmVKcDVQQ05Q?=
 =?utf-8?B?SUtXS2pmU2grdXljeXdmL2FrdUtJa0J5dzN5RGJreEU0QWdpYUhqNGJTNkV4?=
 =?utf-8?B?OTdZVXV4ZHpYN0lEbStjYzNIc1F1MWFtenZzdzV1OEV3bGJtemJLRk4wbmJN?=
 =?utf-8?B?RkJZNUpmbE5KMzV1MmNOdytxSFFGU0dVWnhJMVBadVluWnNObXVQek9mQnJ1?=
 =?utf-8?B?WkZWMkw5VWgzQk1kcEpOVi83OUNYREY0UkU2eUVISEFuVlBOcWNmYTRoV01F?=
 =?utf-8?B?a3o0MkZEUzBiRmFJaTRmNEVhOVI2OWdzZlNnMXVERnZzN3c2K0dtVmJCbGlY?=
 =?utf-8?B?QUE2OXpmQmVETlJPU1VSREY3Tk13RGNTb3lWemxSS3hpdUhKVUdjcm9FTHRC?=
 =?utf-8?B?aXBtR09VSFRQSmpIb3JQU2hEMjJQcGViV2ZDTC9LdmM3VzlCVXVOWWRoeVBB?=
 =?utf-8?B?bS91ZmMwblFzOHUzRW1pTVU0cytpcDA2TGtjUFlkSHhVYmJoeTlYeW81OG42?=
 =?utf-8?B?Q1pCOG9sU1NxQzZyTDArcnZ2SW52aUFXdkZkTGV2dzB3bmgxcFN2VUZFc0pT?=
 =?utf-8?B?UjNOWnovVmh5N0VTTktVTEFGTUpYWGdZOFpRNWJmU3VJNVZHbFErcWtlc0hp?=
 =?utf-8?B?dUZiWTluRjRZS3RJNytHYnZsNmdpcDJWY3BIaklLb2htM0Y1RkYwTTRnRlZL?=
 =?utf-8?B?TmFDbFZWaUd5dWZSZGYzRFJ2YUlmcG9VVFhxbWNUcXE4UExKRlZWMnhrVUF4?=
 =?utf-8?B?VEtHSWwwTFJ3U083Um82UkQ1Z3UrbE1NUDRPVjlrUHcxYTJTVFVHRUVNem00?=
 =?utf-8?B?ZkI5OWtiSi9jSWRDdTd3SXk5N0Z6MlZ4WEp6K2FVZFRkY2dDZVlKUXJBNC9Q?=
 =?utf-8?B?MmtqdDNsN2V4Ujl5ZmJYTGdBajRicGI0WGU4anJmcnMyLzBGRGUxUm9lY0hK?=
 =?utf-8?B?QzR0NmpDUTRNT3FxVTVXc1hrSktERzJtTEZBR0ZTd1h3RC8rL2U5YU81LzJT?=
 =?utf-8?B?aTBnSlRORlQrYVhIODczeEZTQzBTOGZ2VEpvK1FwYldjZGM4a2xjeHlxZngz?=
 =?utf-8?B?YnlNc25kdkg5YmttK3plMDdCUlc3a3JoY3BGaGJuSTFXT1N5UWdWYVFvUlBy?=
 =?utf-8?B?UzZldVhlZHhsYzJPMmZYN0trTWtJZnhhT2xpcVBQazIxNFBYelVYV1hpZnRW?=
 =?utf-8?B?dXB0NzFtZmJvNUcwN21PdFJGSzlNSEUwNDhvbWFtWTVGUDBXc1pWMDRteVh2?=
 =?utf-8?B?K2IvZ2wrd05CeUkvQ0kwRktibDk1NlhjOXBnbyt3Ym9PSEVvZmx5Ty9xTzMr?=
 =?utf-8?B?OVdEZHZRRzlpREdjRFI2YnVhRXg5cFZ3TmxkeUd2aGR0K1NGaXhvMzlmck9o?=
 =?utf-8?B?V0RMZnRXeE5ZTlUwbUFnOVV5d3lJWDF4YXRHMkNoR1Q3RExaYlBXMWpxdUpU?=
 =?utf-8?B?dzRJalAvVEdzWDFHU1QyN1FycEVrMWVTVHFlMUcwM1Q0aFJnQ0xDeFZnR2tZ?=
 =?utf-8?B?ZTgzREZRUGFVWGxoQ094dkQxNkxXZC8wL1cyYnM3VFlDeFhibGRsM2FvT2dn?=
 =?utf-8?B?aU90UkpiSGNqUCs0eDQvSTFQYkNSVUFXWlRDL1RnWWV0Tnh2SHZjSTVUYmgz?=
 =?utf-8?Q?lJjCLU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejh6bkEyZ0dIa1BRSG1WTFpJSHJmUDBMbzFXUzhQa2h1NDhrZE0xRVEycG00?=
 =?utf-8?B?dVlwZWdvN0t5N28rTm5GOGFMSUVOOTgxeTNrcFNnemowakFGZWNXVXdERllJ?=
 =?utf-8?B?ZWlaSGltUWwyY2FrL2QrejAvalJudHpTYXVERzNCdC92Mis3czU5UVlNWUJC?=
 =?utf-8?B?UVpzL1EwcVRMUjhOZ1RMSHpDTXR1a3F3aDZHc0JDTzVqRjMzKzNvR05FYkxF?=
 =?utf-8?B?c3IyZGFKRlFKbCtzdklENGliaWRqL2U0YUpMVTB6a3FGRlVJNHlhWjRDbllV?=
 =?utf-8?B?Zkd6WVRYRzlUTnFiVU1EazRJMVBFNldwRnp0ZUNVSGdHZ0NXUEhTMHlZcnFE?=
 =?utf-8?B?c1dpNVJkZHJHbjhpdGExbnZKS0JHaWc3RVQ3NjVXZ2ZEYWJJUGExN3ArZkV0?=
 =?utf-8?B?NjBLY0VJOFpZRGdNWllUYWduUnFWM1hoVVpNWTBGNmY1eW1mME9OUXdrYmZN?=
 =?utf-8?B?TnMwWjcwV2oxb05RWkMzMGZwb21nODFNY2pYWGpLem9qRmM2bkhtalJpeG03?=
 =?utf-8?B?RG9lWFhKZC9Ud2dvOEw4SGFkTW9TWDV1blFrb2ZTS1hYSzVwbGVqdmx0UGpl?=
 =?utf-8?B?THppZXhmaGEwNCtXVmZHSjJEY2srV0xOUHJaL2kwNC82S0JOZkYxb1l6WEFB?=
 =?utf-8?B?dkhtKzZjbnczQ3B6YVVsbXlaeDA3U2JGLzhiMlFqSndjQVJOc1J1anRQemNB?=
 =?utf-8?B?R2R1QlRxMTk4d0FjNXJzSFBQZ3d6OWpWdlZ6UkMyNU9ZcncvVVpjeFF1cEY1?=
 =?utf-8?B?KzdvN2RZUGVIYjBDUkptc1N6em9UR2FNRE5oYkxuZzJ1N1Z1OVdIcVQ0UUJS?=
 =?utf-8?B?SWMvU3MwZVgvZmlEa3lPdkdYZ01WNW1aeG5PR0RpMTBpc1BYVmU1bVFHWVZF?=
 =?utf-8?B?QzRzbUlnOXg2OEl4RWRyM1VqKzJ2WU9Db1VxUFl1R29HMWhvdDFycVh5SzV5?=
 =?utf-8?B?TGUxWkhYV1VLeGtybHJNR0NoQ3IwbkFMNUhqYnkyQlg5cE80aFdqUlhWM0M3?=
 =?utf-8?B?RnZhZzl2Nll5ZXVkeXdIVEo4SDRjTzdUNUhvSXlTblVKa2xEbldxQW1XUHo0?=
 =?utf-8?B?WkwrNldXQ3JLQjBITFRScHRXczlkMS9hM3JnRVVjSzkrNXFkemNIeVlJZXNK?=
 =?utf-8?B?YjIrd3FLUElrY3BDOXNKSU9pckhBSWxIM3dXTm1DNWZUanZvNmo5QmFDdjVx?=
 =?utf-8?B?WTMxd2VkTFBuOXNiUVd4dEhHOG5heDZHajMxd1R5c3ZwREpXQWkrdzdHOVlj?=
 =?utf-8?B?cWcvNE9RbUtSc2gwZnRIbmxFTmZrRDJkOVE0RHFBQ1RDd1JQckppczVydXIz?=
 =?utf-8?B?bGUrK01WQnlrTUhpVmZnZ1dpOEU5S1VmVS9rUWFJYm56dzlpdE1qUEd4aWlP?=
 =?utf-8?B?YWZybmw3a0dCaXNrWXcyV2d0U1VVZTRDcmpYMXpCc2RNVWVwWHFuVWNzT2h3?=
 =?utf-8?B?WG93Z1lLalN6b1BBMnEwUzZsTmx1TmF1dEVQd0h5K0UyRUJqOUw0MDZoZmc3?=
 =?utf-8?B?WjhhellVN1ZOZmYzNm9LWlFObUx1QzRXVkVqVFFpcytDYWtaY1JBamtzLzNI?=
 =?utf-8?B?SmQ3Q0N3MTQxMEdJOExUd2Nwb2RSM05iTWxNci80bk11Y1M0SnhZVDNYUkpv?=
 =?utf-8?B?dE81UlpnbFlGblJTVzVFQVlKblZBVXZSTXk4bncvNGRlbU14ekg4UG1Qb2Q0?=
 =?utf-8?B?ZXpTM3RwdEdkRnRPVU9NVnhiZTZLbGxOOTcrbE96aFZPNmFKQkxFN0JkNVVB?=
 =?utf-8?B?bmdDRmx3TWcwQVNybFY3K1A3UklNaVpKK3ZsaHo4Z2Y0WG54eHFzOVpRNXF6?=
 =?utf-8?B?NjJ6ZXNnVlc4NEdIZ3lYSkN5TEkrbVM5MTd0QVlwdUEySkM1SS81YkV6Qi9K?=
 =?utf-8?B?RHVGSUhSUDJZcjh0UElDazM4U2RnVVZzR25zUEFVU1pvNWVoRnVFMTNjM3Jj?=
 =?utf-8?B?SlZYQnhBeTEzQUFkaS9md3NRYnFwSGs2bHRYMUJ1VjNnOSs0TENpYndWUERF?=
 =?utf-8?B?dWdOQnp3UUMzV3Q5OGxxTW43Q1lSL1FaWHY2NmNOeDZmWU05YUhuaW5DMFZE?=
 =?utf-8?B?ejhGaFdIdjVmTU8rMmlhemduN1dtTHBNR0lFYW16SGF4ZFZxTUVNMmprNEY5?=
 =?utf-8?B?blFGeVZ4MFNHeE1VSVREanEwSHBSVlB4YytXbDZzM2F3MUZzb0NiZ2FEajhJ?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e121f1ca-796a-4fe2-cb86-08de17296141
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:26:02.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJDAh1GYk7rYXhSoJctV6dnDOspdYLClA2yWGlko5R2ui/4gveh8ojGbOt4UaDWWxHHmyfjextCcfWykEDCfIOr+60O4cr9l59zQOdBNnUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

On Tue, Oct 28, 2025 at 06:58:19PM +0100, Michal Wajdeczko wrote:
>On current platforms, in SR-IOV virtualization, the GPU is shared
>between VFs on the time-slice basis. The 'execution quantum' (EQ)
>and 'preemption timeout' (PT) are two main scheduling parameters
>that could be set individually per each VF.
>
>Add EQ/PT read-write attributes for the PF and all VFs.
>
>By exposing those two parameters over sysfs, the admin can change
>their default values (infinity) and let the GuC scheduler enforce
>that settings.
>
> /sys/bus/pci/drivers/xe/BDF/
> ├── sriov_admin/
>     ├── pf/
>     │   └── profile
>     │       ├── exec_quantum_ms	[RW] unsigned integer
>     │       └── preempt_timeout_us	[RW] unsigned integer
>     ├── vf1/
>     │   └── profile
>     │       ├── exec_quantum_ms	[RW] unsigned integer
>     │       └── preempt_timeout_us	[RW] unsigned integer
>
>Writing 0 to these files will set infinity EQ/PT for the VF on all
>tiles/GTs. This is a default value. Writing non-zero integers to
>these files will change EQ/PT to new value (in their respective
>units: msec or usec).
>
>Reading from these files will return EQ/PT as previously set on
>all tiles/GTs. In case of inconsistent values detected, due to
>errors or low-level configuration done using debugfs, -EUCLEAN
>error will be returned.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
