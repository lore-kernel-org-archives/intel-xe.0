Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23425606A320
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mlELYZ9H;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QSxB7uuV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D732C1120B0;
	Wed, 18 Nov 2026 22:59:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950031120B0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795042737; x=1826578737;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eY5/i2mDcsG07dN4wRaS455L1z4q8oDNO7Re4C79FRc=;
 b=mlELYZ9HXEWMrt8wI+OO4nqKWfDDc3Ah4PuZ2AwBU/HfdumEJaHScskJ
 hIiKRM6mr88I4uUirHgms0wuRnCOUPkzLxmVT2erE7sP3xUwl4z4I+cEx
 kgyUqC9UL5JB3WZcT/OgnkMvLJVW1dLNjpTqw0Z8V5s3A7XZNCV6vRGez
 xbQpcYGKsDWU1qMg7ektl/tUu8JhMbO+bS5tAP6y61kOtUx/gPbLAbGd2
 Qej852j95C9Z/+KrKti1O5+RDJDewEYN6vN8TKsi2+u2SOFbD0z+VK19Y
 DaBogJyuzfSHYfCxnXUxBGa1nknzYJ/nOVK8WehBx3zSElxowbmSb/Tj0 g==;
X-CSE-ConnectionGUID: ru5yEZ7eQbqj0/g8lk3mww==
X-CSE-MsgGUID: RCwPZWEISZy3rG7Etli7gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3955487"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3955487"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:58:56 -0800
X-CSE-ConnectionGUID: Olq4EeozQzueFAn2L9nW0A==
X-CSE-MsgGUID: e0WjdTLcQC+3JfCP8ucs+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10534266"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:58:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:58:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 14:58:54 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:58:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGncJOpAWfNXx8w0mbwJSwU+aVGs9pUfP9wf/9VAQrBDYkp0clwpumzCRY6JI+FlUDOny71LJhThtcOEq4gsbnUSl4FNxuJvuHk0/W8ubpDNiZxrLjXk4QWiFBYAzxXjbGamSpJ8FkcSYKMdPORDewph4xjlyBAOr7par22PkBuW7kYO3v63pO7QimBDXKu0RFN1znFAnyYZoQOaZJz6hpD0dce/I31iVsJk49dKqq3CvBcwqrGGmn4rOe3Ik1z7qu677lGbkpPhM0Ebh8uoJpqTLRJFaCbMKtEIKI4BU1M2dltWSYD22KzVOt6ZY7TPdyZOzsP/H9MnRzio4mBHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLQ+W5EHICcJiFA8Ekxfdf9+dFDBH5EYpAJDZqvRs94=;
 b=YMpPTnCf0W32nDOf6ESUt/AyIuAzh+nCtkeZ4h+h+MRrSK/bQkHwfQi1q8khryJhbrexitrC8em7INIiwCqGUyvEQDjcTGZFLETJvs+t3L5K8CYCns0gX5NueOkR3MbI4aqiJDBEfpmr5+m9uvslqss25mCKBPRLIJptqWMYyq6dLAinPNl9dsHLDYjfCKszD/BrySiMmvHutaxHVR5SXT4bmZNdiVoq6p5nINVcS+cyFnMJyajKtzdhmQu9CVCTYtR9ZZxLzQPIdjRho19hEyr9wwNOiO3VAwwSa0jiaOWWtmnwKimr1H/nvs9VI8aKtnjFFSFy/OB5GMaLoRbIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLQ+W5EHICcJiFA8Ekxfdf9+dFDBH5EYpAJDZqvRs94=;
 b=QSxB7uuVPI5tVqP95eo7/46z7ORcFICI8CBZQq20V4w1AB8omvdaWBE8bx5N1Zx1PnSBe88r43s7X12yWcF1if9k5E9Dku9SiUAEGUiBJFDU5mjaHLuyjW5ozgcQJB8W3l1yh6+Am3pKZVpVdGSwB8utrZnXSjGNveHEpfIrxgc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 22:58:40 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 22:58:40 +0000
Message-ID: <3c9b9955-22e7-4f7e-9e71-d6eb58fa7e13@intel.com>
Date: Wed, 18 Nov 2026 14:58:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/gsc: Define GSC firmware for NVL-P
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261118213234.59171-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261118213234.59171-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:303:b7::17) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH0PR11MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 82aed284-1aa1-4515-028a-08df45c77c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|261009223027099003|18002099003|11063799006|56012099006|261102123227099003|261028144727099003|261022115727099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: nCDnZQ3ohXhVgQ79ZQyavaS4ek50ZUAZzxL8pwv8etYhA7zB43I+EICTGuegN48xQpNp2xiUIWmQYpk2PfV34O3QubO9xGvX7ufkWAviIX7sLW9nerCDFRMfseJVauzyxbn5LdbVMkc1F6o2yINRA5jzMJWB9lMAYgW03IdNK04r3Tdb/xqK2ZAf1gI5u1vF6nrMUVD7t4/5nPDCy07Ea6VNnCxlMmOVhkYBn4HxRvkdTA1VMM6/DPTLB7kpF0bs665MxYnujKO2ZiWTyF49UHv9X51n3jb4QmW9oJkBRg2T+Pd36/bCiT8Mew0hgpgEizmdFjrA2BiOkYmQNzgRkx1W1DJ8260J1C91RPGqrnMuaS23RKTilvtpGo2e4t2tfO9wCVfeRpx18xpFA+WSL7WxWKUMjFPPHucFfb8z3P2I1G0kVp4/QeqHqHjTcaKuUof6+qJjsBDHSJK1rqjBSgkPqpejZrzFLtt2sdJO8VvSXVkjopbkrxs2i0O/MhTL5k1KvlsTKtjzEp5tBcDP7l070q8vqhTNy+KlyIdHZ2dtcGAN4jIVTUqM27ECpONvS1urb2CUaFazgq0ngl1PsutwLGvMkj07sDUG1Jyw+CcEsThm9epowc2g8iev/OsacMDhJ5cbEHrqEz6GG83B521rjRlysGDsi1ZNsfmRRc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(261009223027099003)(18002099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261022115727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWt1dmJxYkR6SWtnL0ZDbGFpN3V0dmd6a0ZFNXNaejJ1VGxnclBLWExjb3Nz?=
 =?utf-8?B?VlBtUnFYVk02cWFkTUNYdE9rSDNNeVF5SUsreXROZk1scHVmSWk5QmFiLzFU?=
 =?utf-8?B?TXNkcHl6dDZXN0IxRy9ieWc5ajBzbWk0TVNMK0w2SHJxc1lzUzN4eXZ1aXJu?=
 =?utf-8?B?cW5OMGNVNXVabWZRVFFPZURWWHVOYjkveEVMdVNSUVNaNnd4Yklwb2RMZnd1?=
 =?utf-8?B?ZXJmcEtuQUJWRnBSWVdiT3Y4SUo0NUxWVG50RkF6cFpnaDlnamZOU1J3Y2dF?=
 =?utf-8?B?cXdmQ0tmb0orSFA2alcvMWhzVlZtL3ZFTFZrVVFYamV3TjM1SWpqY0dQQTRr?=
 =?utf-8?B?TkxjVm1jdVNCQTFPbk9oOHpXRkR3b09Xc0lCVVNmODBBRFVGcDNITkF1NVNx?=
 =?utf-8?B?b2dTdWpodjRWckRQV01QUjdNR0twZEorRndCRjZZVXNTT1ovcHZhckFtYzdF?=
 =?utf-8?B?QlRGMmFsc3p3WFlkU1BjZFlSYVVvc3FpbUs3YlJBeHVpbmtiZU11MlE1UzlS?=
 =?utf-8?B?WXBDK2VEandSdFhHTXVtNlZ4WGVXWnNzWkRmVE1aRTdNZjhEbktHUjZJKzc4?=
 =?utf-8?B?SktwNXpxaUlEekpvOG1IMC9YUzBVbmRybWwxbm15ZFpiMkdBbUxVVW5Qc1BW?=
 =?utf-8?B?TjlFa3VBTzNWK21nSGU4ZFo4eFlrOUZHaFluaDBmbmJrWXpvai9oNGdBczgv?=
 =?utf-8?B?QTBtZUJSRHdPU2lVbWxPUHkwT0hrNEszWCtUd1ptTHhSNHo1cy9wVXhqbi9z?=
 =?utf-8?B?TW1EVUdkekZtZUc0cjI5UWlXcndoUmtvTGxnTTd4eENkRWp2Uk4zY3dGZ0Qv?=
 =?utf-8?B?b1hYdlZnRmNHbkluTitUbHdiM0M4WFd4Z1ZsYVM5SElrbENKM0ZZMEpPYlZX?=
 =?utf-8?B?ZjgvVUVySm0rMVFmSHVlZGRmUW8zdW10bFZCYmR5YVJoNWNGenRQL29sMDcw?=
 =?utf-8?B?RDJaalF2OEFZSnNGR21ZVU93TExtbU40MGdVaGZGSzJhdjRRZ2hKSzB2Vllp?=
 =?utf-8?B?T0JSenhWbDIxVTFOMGltV01rR29LaGNWQU15TlJ3VllHaGQ5eU5mUFpDZDBI?=
 =?utf-8?B?S05zdlIyNzZScW5GTjBldWZzdklXVEMrSEFIMDE2akxkVzdxV1ZlMnpGUGFM?=
 =?utf-8?B?MVJUM3FRdDA5TDJVbU14SnpSNDF3bmo3aVFCam9lOGpZWENNejNXTjNyRmdh?=
 =?utf-8?B?TXRsMGV5UnI4Q21henlKaGdPamtNNEF6MDZxbjVXSXViKzhITG04VXZlOEx3?=
 =?utf-8?B?WHVieDB6S011NDExR2RFeDYwTlYzcFF5a2N6ZGhDdjAwdTY3Q1BGdk1SVmpq?=
 =?utf-8?B?ODJnOENXeExMT3pRd3pHZFJkd25XQkluUlgwd3F2QWQxSVhjSENQZ3FTOUhV?=
 =?utf-8?B?S1Y0RElzdThibUdlcW95SmpjM1c1bWV2WHprR0tKYWNnRnA4bVdrd2FIRXFs?=
 =?utf-8?B?UEVXa01FRmJaVmZNUnNqY3FvZDdFeWw2bTRXSFM3LzlNUml5SHAyN29KS2x4?=
 =?utf-8?B?K01lZG1OaWRvaXRBMDlKUERObTFXejJIVS81Z1Z1M3E4NUZYaWRKOTMvb3BQ?=
 =?utf-8?B?dlE5bEt1UHNaWXUraGsyTzNQSHFwVXg4TDZ3RnhNN1g2a1pXVXhGancvbXBj?=
 =?utf-8?B?YUUzQ2VhVDhLK1FjMnVjQWl2UFFsZFArMXpsYkxmS3gya0ZCOXQzSVMzd1Nt?=
 =?utf-8?B?ZFhGUng4aUxGSkk3KzhJd0FUemZhK0RXYkE0Uk9SVHdJS0UvQkVqd2prU1pW?=
 =?utf-8?B?ZUphSHQ0SVQ1L1Z2WjRUZG1OMEUra0JwcldrOTRRRG5NRzR4a0FNVTZkSStC?=
 =?utf-8?B?SVZFR29MWnB0QlhYSUE5TVN6VnJhKzFTOUR2cEgwRXJnOUNMUEZxS3cxcDV0?=
 =?utf-8?B?ZitMMTAzVWVxbFZYdzc1bVVYMDhVWTVDMHVjaFh5djNWTlh0MUdGUHUrRC90?=
 =?utf-8?B?K28xSFRqUXZGUUFyRE54QlIyR1RoVVhoQjhjTE9DSnFVdmgzenlVdXRROXZS?=
 =?utf-8?B?WWFHNDd3S0loWXNCUmlNRzdyRVFLL08wRU9mQzRtTVpRSURYYjlPMWdLYktl?=
 =?utf-8?B?SFhQTSs2ZXNQa295MUFudi92bElEZ0NhLzdrZjU1eE1yWlBPdmw1S0R4T1RJ?=
 =?utf-8?B?dkFlZEVHSE9kTVZwNGJhZjR3TzB1R1JEZkE4NmVUdnhnWm53dFFpd0hKcFJn?=
 =?utf-8?B?UTRwMlR2dHNkYVpIamVMYjlFZXUrRFVnTmxoVGYrS0tCTjhPR1Rpei9RZnBw?=
 =?utf-8?B?YWg2RnBDSzl2ZWtrRVhsZFF4U2E2ZXU1TTVPaWF1SzZlTWNpV2V4NzRPMmZw?=
 =?utf-8?B?TUJ5aW1MeVFLQ3l3RzhzbkZPQkZFQmswSWlzYjQ4TzBwbUgwcHdnNDVvM0to?=
 =?utf-8?Q?ClaAUEm+wVv0LLaM=3D?=
X-Exchange-RoutingPolicyChecked: hGbYSWuwQSDHcVyr/fqpe0Us3vUIo780M+OqZcIsoEyinIrMUsOvDk7ydb7HeEWhXZlJADuD1n7UlRYdUHl8TEKlBkEPzSQNZZGGZ6tpTwnxDywR2X3/oriWLXsC8tzQkwQdON8sehg+0SVWeOsqAnc958kPIUdTA/fZoNf6uoRp3TZFlNFprEbdYvOATlqWK9M1miJ03fRy3lMyuUY7602Lv8dNFYwXgDeDaRgcVn70m5eJY1kDufEPmuTY8dNacVhULM8IJip7VZoqk34F+B2M8ASoM/4wYfVH1Q71vM1rmXIquotqN4s9JND6aT4thkI4aSfp3TNYJaTtyPjDWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aed284-1aa1-4515-028a-08df45c77c73
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 22:58:40.0584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRffah0uneYYyJufBjUlSVvztTzy8rx6jItPnNWsBBzgqB8887IK4hhhdK+v0U/UYYum7TLT9HvRT4ifu+VHOaU0qtlNMR/F65qTZrdiiRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
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


Change looks good.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 11/18/2026 1:32 PM, Daniele Ceraolo Spurio wrote:
> NVL-P uses the same GSC image as NVL-S, but requires a newer version (at
> least build 1242).
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
> v2: Use EOPNOTSUPP (checkpatch), check the full GSC version number and
> not just the build number
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c042075a36e5..64b1e51c02ab 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -147,6 +147,7 @@ struct fw_blobs_by_type {
>  
>  /* for the GSC FW we match the compatibility version and not the release one */
>  #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> +	fw_def(NOVALAKE_P,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
>  	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
>  	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
>  	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
> @@ -778,6 +779,21 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  			goto fail;
>  	}
>  
> +	/*
> +	 * NVL-S and NVL-P use the same GSC binary, but NVL-P requires a
> +	 * newer version (at least build 108.0.0.1242)
> +	 */
> +	if (uc_fw->type == XE_UC_FW_TYPE_GSC && xe->info.platform == XE_NOVALAKE_P) {
> +		struct xe_uc_fw_version *ver = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +
> +		if (ver->major == 108 && ver->minor == 0 && ver->patch == 0 && ver->build < 1242) {

Explicit check to disable should now target only older build versions.

> +			xe_gt_info(gt, "%s firmware too old (got build %u, wanted at least 1242)\n",
> +				   xe_uc_fw_type_repr(uc_fw->type), ver->build);
> +			err = -EOPNOTSUPP;
> +			goto fail;
> +		}
> +	}
> +
>  	*firmware_p = fw;
>  
>  	return 0;

