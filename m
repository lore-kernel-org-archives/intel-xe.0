Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7674ECAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 18:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269FF10E95B;
	Fri,  3 Oct 2025 18:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltVnZfFX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C175610E965
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 18:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759514734; x=1791050734;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=APQY685cjvBUF4w8JZ28pzE/o9ik/gQ3xQZAuqmbETc=;
 b=ltVnZfFXNWL7nkRMiiSSz6oFHoKuBl0xR2zO/TKjZZZz19KlF+4T4kHt
 wWpk4DU9U4y96sg8lVn6xm+a+xToik7pCBY09GoVIOgjNcWI3q03NM11d
 xT/zEhJayT8L+Cd6jYsf6jcbHRTSmctSvt4b1zYZ+zu6UAmSv34+OUk3M
 aYb3Web7+ymDOlDNGaVUNPx+OOoNMuyQ4AuC3MXgv8LT7RNNygVRbP7v9
 sc6Z4KwMHmYHxP3CQXbfAPYQFVW5CGFi/29VSekSl4ubQUElokdecm8kA
 euDpXCjO0v4KgWkwkKBr0kXTHq+Et5S7RAg3jfxFv//U8SkPIuTHNwaHG A==;
X-CSE-ConnectionGUID: A4h0mMZ6RsyjVxSFgQey4g==
X-CSE-MsgGUID: L+vlcrRwSVej9BXuW12T4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87256218"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="87256218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:05:33 -0700
X-CSE-ConnectionGUID: nmFBCc45RZCRV4KiBCVdjQ==
X-CSE-MsgGUID: AR1f30X7TJ68a9uutu7l8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="180149733"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:05:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:05:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 11:05:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.55)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:05:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUVQ1B4CoahQBRFT6k8mCNg1kmg9ETustlegx9A5udlDx+EboJHmXLHno2GYMpmzA0TP/WExUTwDBbyqMSE9G/HHpZM2wimRB2Zp4K4haryyM/jFKsR4qIs35WFX9NGf1p8nyrUFTvsGmY92KLL9GWF9K0E7sYTGyv77N44lrSk+82ql1IFPMJ+zPBF3EQXWR/B4urHHN75SwKw5l2lPqCbHHyX5P6TjPmCQtSbKslK/x0UZtPoiIr0RRvdjM9Imf7aBr3eB6+T7N7f77z0RydQ3ldPJ34iSpIT2LPpk9Ff2/9/18TAmoq96i6+HVBH+8+mWyk6D7b9QVCrUvXprag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqnRwhj0AYfjl5lxB4bYfqRXJ4XqiRfzdJNkirLRl7o=;
 b=FGZSvTGgNDuteR3sZBqm/ma4aLEgXaGpO81jwUqoNqs/ADE70XwmDWEJgouBBmRVlZRMyfZ2m2zvf9u3UoV1jv+uW798U6ROzzzhk9s1PexW+2aIxMxV/LTvfGrkh12t9ls+OCJ8T5EEkNmOKJpUqCbRPYR0Qq9c/9Kld/XadJ9coMwxDno0QAU77jZQnWZ76d2rT+o1wH8wbHq78NFTF1xlYvtRWPn8SSOgxRQDveS+32aIZLAoeEc6PedlOeHAK63emS7EH+wxBUTqvDeK/vsf8COjdviPJW6cWI41EBSPE5PRHjwWGQ2eMWpxADkuS2EZzYunjBH7P+yUrbAa5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 18:05:26 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 18:05:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-47-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-47-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 22/23] drm/xe/configfs: Add attribute to disable GT
 types
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Oct 2025 15:05:21 -0300
Message-ID: <175951472198.812591.8833908009488365684@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 38fae8d5-9ed7-4898-50f6-08de02a76e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckxWTUorSkh0L1Zzc04xL0NhcXpjVW83ZVE5S3ZBQ09LbjVHdmxVbDBpMkJj?=
 =?utf-8?B?UlNhZ1hkZ0l6VlFBaGRZVUJCRDV4SWF0SUlBc1JFbWxUUmxxalp2TGJVYlE0?=
 =?utf-8?B?eXB6T3VkbTQ2eHRtUm93Sm9JWktyaWtneE5YaGNKMUlhOW1TTXZRLzhBWGEy?=
 =?utf-8?B?am93SnA2TVFyTVI1YzVJeW5OSjZqNkFEUjkxT2JZWjhYNU1CcHNzUHM3elhW?=
 =?utf-8?B?eU1mZ0piMkN4aXFydUcvQjVrWXJteDV6akJRNFZsMTNoQ0tmOXRZblFZa0Vv?=
 =?utf-8?B?UnZVUWFWV3BzMURCZnBRbTZLWWttL2J0aFBYZ0psODdhUU9tMkRPY3pUSCtk?=
 =?utf-8?B?eXoxYWt5Z2l0RjQ4eVcrR1hrRmluMythZ1R0WnRXNEVPUTVBcTU1ZW4xUGlB?=
 =?utf-8?B?UWdiSGZBZHRkNnZxdWRjSGd1b3pXdVBPMnY0M1ZWSzRuSytlckpXOUtOWWli?=
 =?utf-8?B?VlpUclA1Ylo4d1RSLzJ1eitxM1A5R0JXbUVTa1VPWER0Rm5sVjFqM1Rra2dh?=
 =?utf-8?B?VHZRZEFNc1NsL1J3ZzFablVVZmhNL1dUaGYrNHpmYU85WkFNSVhhZTJabzRt?=
 =?utf-8?B?eEh1RmZibmZPUlZET3NMZ2lMZ3puRCswSWRpSmxXRkdvNkg3WE9EdDBUV0lj?=
 =?utf-8?B?aUxlYWtxQndMRU1ZZGxSNWg2dDhVQm00QnVhSDY0aWdsU1p6cjcvQkpXckxE?=
 =?utf-8?B?ak5GcExmQW9WTGoreDBiNzYxV2lmdmxaSXJDWHJteDFBbkZBckx5RWZOaTNi?=
 =?utf-8?B?aWlIUWF6ZFlrT2lleUxwZTRvZktHV0FxRXFGcXdtSkNaY3VnL1FlN2dOMzdp?=
 =?utf-8?B?U2NDeU9nRnR5VCtvS2JhWUNTNGV3bEk4NmpxWUp4VFE4Snpwb0hueDN3N0Fa?=
 =?utf-8?B?bWFJY0QzM09lU1EwRlNraFR5Q3QyUVIvdE1ya1E0Yjg3NnRpZ0dMdjNTbUJZ?=
 =?utf-8?B?dVVRVm5GTzFldGMrRW42U2ZVcEFxa1h3a2ZFbmZML0V4VENCaW5hM1V0d3F0?=
 =?utf-8?B?eHVGTEVwMlYxTWs5d0hVWmFFNkpoUDlSUEh2b0ZCcC9WVXp5bGpUTVh5TzJu?=
 =?utf-8?B?Vm1BZ21JdHF4eldiS3FDRFB2ODNUQ1pUK0lxZTdiZ1R6WnpIZHhpQTNjZU10?=
 =?utf-8?B?QXZhc20xMUpqVElkSTY2Zm9MRXNwbjhtd2dJU2drcnp0R3phdHRwZDNRYXBK?=
 =?utf-8?B?UUFIQUlaS3Y2M09FNUVMMERTakRiSEVLdzExVHpIbEFqczlmVWRUQkJMSG5u?=
 =?utf-8?B?YWpLOEdKMzN4QUh5WmdEM3dWbXBDL1p3Q1lEeVhEaG0wWGV0alEyUUhyMHFY?=
 =?utf-8?B?OGcxSzN1Y3VVUFVDYllzTXEwaThPN2UvNVF1YklQbkZRYUNzZm9BbCs5eWky?=
 =?utf-8?B?OTZBME9PaGRXTWUxbEFNQlNKdFVOQythcHR3SzV4RzByNFN2OE4rQTZkK25u?=
 =?utf-8?B?cVpjVFBLYkx3d05VMzEwc0xDRVMyTG9qcitURVhKOVRMS0lCTlIvRXp5V1Q0?=
 =?utf-8?B?NGNEazlFamJyTmRkM3pabitUUXJqOUpaR0QxV3MyRTB5K1JzV3I3bGRQVlFM?=
 =?utf-8?B?OHN2azlML2x6SXhoNk9LeElYVkhaV3hJR1NlSkRrb1djRTRubno4Vm1uRFNm?=
 =?utf-8?B?S2RKY0l1Z01qNk0xcFkwd0Ird1M3elhVaEp2YWgvb1I0cGtUVUVOVVY3d3dE?=
 =?utf-8?B?TVB5WGZoR3dIZEJMRm1ZQWpsa3RPMzk3QlIwOTRmeVRoaDdWdS8ybkdGWnVJ?=
 =?utf-8?B?S0lSQXlEZGxxZndVZ1F4Z3dvbGdGS3JEbTJVK0h6L21xM1VVd1E1QWdUd2FD?=
 =?utf-8?B?N0NOWnluV2toQzNQVk84ZDhxbGZyZW9wS0ZLUVlUTG03bXJ1NnRObjVSeG9K?=
 =?utf-8?B?RS9RNi9rYXN5N1RWblg3ZjN0Rk5GbnAyL1lHY25lOWpUdlNnUmdESVkyNFhR?=
 =?utf-8?Q?t5Bl/Dw7SW7eX9Zw1EC0TNee6QKPwP+o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MCt6dmVEZVJIVjdLeVcvcEEzTlZlK3RRaERRRWoxRFFCZEs2Zy90cGQ1TURp?=
 =?utf-8?B?ZnFnclJ3TkkwZkN0UGYxaUxtN3dVelpHblpVcFhVc21icGN6OEpMN2EzK0Jz?=
 =?utf-8?B?dzVJT1g4L240K3BVOTNELzNsS2VvU0NXYlM3aStNblNPbytFamJDa3RwanFh?=
 =?utf-8?B?SG42ZHNzUEc1bXZGQkNKNmFCKzJ1MEt4V1R6emxJSWRPVUI4U1lXZjhPZ1BI?=
 =?utf-8?B?WDAwSVN0YTVrcFk1QVJiZGhtQTUvakNrVndpR21BMlM4RE1uRTcwUHN2djBm?=
 =?utf-8?B?WHFXcHJ3d1hldE1DajNtVE5nVzdlSGNBTEE1aS9QU1l0NEJzTCtQczNvOHN3?=
 =?utf-8?B?ejhOeDVUVEFJQjZHYXRudVVRWFA5SGpPaDFmc3hBYkpFZkJwcDZZZ3NtakZT?=
 =?utf-8?B?T1VwQkI3M0UwdXVwblYreENBOSt2dWtVQXV5N3pzMTRPWGtzVk9qZWhNM1lu?=
 =?utf-8?B?QVJRclltUmVkVENPWVNRT0JKSzBCTTArZjlzMzYxdEhkWno2dE10VzZCQnE1?=
 =?utf-8?B?Mk1ZU1FxNEIxT2tGK0UyQWxRelBFL1VqZVJGZ2dJaXZCUDBheDRVMXBTdE5u?=
 =?utf-8?B?QnpYRHFSd2NVRUtNOEJ1emM0RmhiUXRTM2NVV3VYTkVFNi9LbGRqcHV0WUVt?=
 =?utf-8?B?blpaSXRJWTFsb2cxbC9QV1VMMnFxY00rdlB4TGQ5VlUwZ2RKZ0pkbzJzV0F4?=
 =?utf-8?B?Z3FQOGxGc2JsbzV5MjFCK2FyZWsxOTFaMjMxQkttVVRtazU4TWJLQ09ObitD?=
 =?utf-8?B?ZDRNbElVbUlNRjY1bXZXcUR3WWNnZk82VW9yV1dGNWJjcmJIT1VrSVZsUUlF?=
 =?utf-8?B?MDRLZGVTd2JxbUs0d3hMeEFCSXBwRlFWU0RhQUIyOC82QUlFMGpTNzZCN1gv?=
 =?utf-8?B?UFZTbVZWMC9GL1JHWXluVGdpRGZmMWh5bEJ3QVBHOW43cDlBMmtmUk9yQkdi?=
 =?utf-8?B?TmFEVE5uRmF6bFhpYjJDa2tMQi9ic1ZuRXFNZExYcUR2ajNmWWE0dzd2Mm10?=
 =?utf-8?B?NWJVbkhEM3JtdjNoWkJjOWIrMkRmb01RT3kzcUFTcnZKQ2Q1RUIwT3FISXZ1?=
 =?utf-8?B?c2V6WVlMM2VtK1d0L0ZraXNmQkxWZVMwTVBWUVFGRVpwM1ZJdlFRUFEzTC9v?=
 =?utf-8?B?ZVpWdUxyeXo3TkVQMWZqZ2dMRStqWklnYUNlSnNweVNrVFRWaVZKUGk0Tm9C?=
 =?utf-8?B?R1VUanN3czV1UTZKS1VTR2tjQmRXV1FyU2VpNisxc3RDck5QaEdoN1dzd050?=
 =?utf-8?B?K3NpQURRbTVyM0RsWEhmNmV4dkhaODNGb1gzU24wb2tJY1hJbnpiWVFaR3kv?=
 =?utf-8?B?aWZ1dkFCR3hEemxhMGNnYnRoLzZjTmRBdjhPU3dXK0JZR05zSzdiS2pkdDJu?=
 =?utf-8?B?QW90blhtRTVCRDRsOHUzeEtxbXUwQWN5NWNJd1o2MnNnNW5oeThXYkZPK0lE?=
 =?utf-8?B?Sy9HOHpqVmtQWFJhYkRtVDhzeVZrdEYxRGJkQmxtaW43YUFVSWlEYVBObVNi?=
 =?utf-8?B?MzRTQ2hpVE0xK3gwUUdvV05QR2RWN0JLTm41M2lxZVljb2o4YktyV2RFaHkr?=
 =?utf-8?B?SXhBRzcvMllFclB4dXJlQmpaYXpRWmFQdWtmdTZQQnJkYTNmVmxJSXZrNlRn?=
 =?utf-8?B?bW5xRTcxUkY0MGl5YXFkS1h3b1c3WW8vL09CV1RZeUR1UnE5dTR6YmtnSnhn?=
 =?utf-8?B?MXNiWmRZZHpwMEIxNVlnSHVtYzRwRDJ5QkhGdEZObnBWVUgxSmdYWEZ4NmpU?=
 =?utf-8?B?TUhXWFU2VFMxNStNaE5EN2pIZHl0WXBQd2hjRUhFMk5vaFJaRE9BT1QzYnFY?=
 =?utf-8?B?bktVeVpFMjVsNlhjME42dDNlR2tMRjVncnhZYzIzOTBjOEFUcUYwM0VFajVo?=
 =?utf-8?B?YkM2NnY0bUVFVjB4eXN2UmZqSitNeFF6aW1kZnRrdzNGZE9zOFlCMXl5cm1O?=
 =?utf-8?B?ZzdYUE5pUUdLODR3MFJKakdHL1NWNHpwNlA4dG1tbFZYaFU5WDlGQjVWTk5Z?=
 =?utf-8?B?d2UzNVBHNmZkZUJVSy9wU04xcStyUlVzTlZ0QW1kdmhwbDlUeHhhRE5GR0dT?=
 =?utf-8?B?bk05UFpPM2xDZUNOSDhtMXM0NWlhd2o2UEFUZXVVVDNrME1xamwvRG00N1kx?=
 =?utf-8?B?NS9lTmdPdWNyNFMyaWMzUE5ZR2ljTjd5UUJqcHVDUjUvU3BEc0JoeXdxRDRN?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fae8d5-9ed7-4898-50f6-08de02a76e09
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 18:05:26.3508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xc+ZXGg+kiWRj/ZUempL6xvbpFTNtYbXLEYshQWN1EJWEkc3hk1QKZu/laFHr4E80PO6CC6iBd/ZjtbjaZ3L2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
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

Quoting Matt Roper (2025-09-30 19:56:39-03:00)
>Preventing the driver from initializing GTs of specific type(s) can be
>useful for debugging and early hardware bringup.  Add a configfs
>attribute to allow this kind of control for debugging.
>
>With today's platforms and software design, this configuration setting
>is only effective for disabling the media GT since the driver currently
>requires that there always be a primary GT to probe the device.  However
>this might change in the future ---  in theory it should be possible
>(with some additional driver work) to allow an igpu device to come up
>with only the media GT and no primary GT.  Or to allow an igpu device to
>come up with no GTs at all (for display-only usage).  A primary GT will
>likely always be required on dgpu platforms because we rely on the BCS
>engines inside the primary GT for various vram operations.
>
>v2:
> - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
> - Tighten type usage in gt_types[] structure.  (Gustavo)
> - Adjust string parsing/name matching to match exact GT names and not
>   accept partial names.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 130 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h |   2 +
> drivers/gpu/drm/xe/xe_pci.c      |  36 ++++++++-
> 3 files changed, 164 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_conf=
igfs.c
>index 139663423185..aaa98166f527 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -15,6 +15,7 @@
>=20
> #include "instructions/xe_mi_commands.h"
> #include "xe_configfs.h"
>+#include "xe_gt_types.h"
> #include "xe_hw_engine_types.h"
> #include "xe_module.h"
> #include "xe_pci_types.h"
>@@ -56,6 +57,7 @@
>  *        :
>  *        =E2=94=94=E2=94=80=E2=94=80 0000:03:00.0
>  *            =E2=94=9C=E2=94=80=E2=94=80 survivability_mode
>+ *            =E2=94=9C=E2=94=80=E2=94=80 gt_types_allowed
>  *            =E2=94=9C=E2=94=80=E2=94=80 engines_allowed
>  *            =E2=94=94=E2=94=80=E2=94=80 enable_psmi
>  *
>@@ -79,6 +81,44 @@
>  *
>  * This attribute can only be set before binding to the device.
>  *
>+ * Allowed GT types:
>+ * -----------------
>+ *
>+ * Allow only specific types of GTs to be detected and initialized by the
>+ * driver.  Any combination of GT types can be enabled/disabled, although
>+ * some settings will cause the device to fail to probe.
>+ *
>+ * Writes support both comma- and newline-separated input format. Reads
>+ * will always return one GT type per line. "primary" and "media" are the
>+ * GT type names supported by this interface.
>+ *
>+ * This attribute can only be set before binding to the device.
>+ *
>+ * Examples:
>+ *
>+ * Allow both primary and media GTs to be initialized and used.  This mat=
ches
>+ * the driver's default behavior::
>+ *
>+ *        # echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_=
types_allowed
>+ *
>+ * Allow only the primary GT of each tile to be initialized and used,
>+ * effectively disabling the media GT if it exists on the platform::
>+ *
>+ *        # echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_=
allowed
>+ *
>+ * Allow only the media GT of each tile to be initialized and used,
>+ * effectively disabling the primary GT.  **This configuration will cause
>+ * device probe failure on all current platforms, but may be allowed on
>+ * igpu platforms in the future**::
>+ *
>+ *        # echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_al=
lowed
>+ *
>+ * Disable all GTs.  Only other GPU IP (such as display) is potentially u=
sable.
>+ * **This configuration will cause device probe failure on all current
>+ * platforms, but may be allowed on igpu platforms in the future**::
>+ *
>+ *        # echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>+ *
>  * Allowed engines:
>  * ----------------
>  *
>@@ -187,6 +227,7 @@ struct xe_config_group_device {
>         struct config_group group;
>=20
>         struct xe_config_device {
>+                u64 gt_types_allowed;
>                 u64 engines_allowed;
>                 struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>                 struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>@@ -201,6 +242,7 @@ struct xe_config_group_device {
> };
>=20
> static const struct xe_config_device device_defaults =3D {
>+        .gt_types_allowed =3D U64_MAX,
>         .engines_allowed =3D U64_MAX,
>         .survivability_mode =3D false,
>         .enable_psmi =3D false,
>@@ -220,6 +262,7 @@ struct engine_info {
> /* Some helpful macros to aid on the sizing of buffer allocation when par=
sing */
> #define MAX_ENGINE_CLASS_CHARS 5
> #define MAX_ENGINE_INSTANCE_CHARS 2
>+#define MAX_GT_TYPE_CHARS 7
>=20
> static const struct engine_info engine_info[] =3D {
>         { .cls =3D "rcs", .mask =3D XE_HW_ENGINE_RCS_MASK, .engine_class =
=3D XE_ENGINE_CLASS_RENDER },
>@@ -230,6 +273,14 @@ static const struct engine_info engine_info[] =3D {
>         { .cls =3D "gsccs", .mask =3D XE_HW_ENGINE_GSCCS_MASK, .engine_cl=
ass =3D XE_ENGINE_CLASS_OTHER },
> };
>=20
>+static const struct {
>+        const char name[MAX_GT_TYPE_CHARS + 1];
>+        enum xe_gt_type type;
>+} gt_types[] =3D {
>+        { .name =3D "primary", .type =3D XE_GT_TYPE_MAIN },
>+        { .name =3D "media", .type =3D XE_GT_TYPE_MEDIA },
>+};
>+
> static struct xe_config_group_device *to_xe_config_group_device(struct co=
nfig_item *item)
> {
>         return container_of(to_config_group(item), struct xe_config_group=
_device, group);
>@@ -292,6 +343,62 @@ static ssize_t survivability_mode_store(struct config=
_item *item, const char *pa
>         return len;
> }
>=20
>+static ssize_t gt_types_allowed_show(struct config_item *item, char *page=
)
>+{
>+        struct xe_config_device *dev =3D to_xe_config_device(item);
>+        char *p =3D page;
>+
>+        for (size_t i =3D 0; i < ARRAY_SIZE(gt_types); i++)
>+                if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
>+                        p +=3D sprintf(p, "%s\n", gt_types[i].name);
>+
>+        return p - page;
>+}
>+
>+static ssize_t gt_types_allowed_store(struct config_item *item, const cha=
r *page,
>+                                      size_t len)
>+{
>+        struct xe_config_group_device *dev =3D to_xe_config_group_device(=
item);
>+        char *buf =3D kstrdup(page, GFP_KERNEL);
>+        char *p =3D buf;
>+        u64 typemask =3D 0;
>+
>+        if (!buf)
>+                return -ENOMEM;
>+
>+        while (p) {
>+                char *typename =3D strsep(&p, ",\n");
>+                bool matched =3D false;
>+
>+                if (typename[0] =3D=3D '\0')
>+                        continue;
>+
>+                for (size_t i =3D 0; i < ARRAY_SIZE(gt_types); i++) {
>+                        if (strcmp(typename, gt_types[i].name) =3D=3D 0) =
{
>+                                typemask |=3D BIT(gt_types[i].type);
>+                                matched =3D true;
>+                                break;
>+                        }
>+                }
>+
>+                if (!matched) {
>+                        len =3D -EINVAL;
>+                        goto out;
>+                }
>+        }
>+
>+        scoped_guard(mutex, &dev->lock) {
>+                if (is_bound(dev))
>+                        return -EBUSY;

I think we need to have a "goto out" instead of "return" here, because
of the allocated buf.

Alternatively, I believe we could also declare buf with __free(kfree).

--
Gustavo Sousa

>+
>+                dev->config.gt_types_allowed =3D typemask;
>+        }
>+
>+out:
>+        kfree(buf);
>+        return len;
>+}
>+
> static ssize_t engines_allowed_show(struct config_item *item, char *page)
> {
>         struct xe_config_device *dev =3D to_xe_config_device(item);
>@@ -672,6 +779,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
> CONFIGFS_ATTR(, ctx_restore_post_bb);
> CONFIGFS_ATTR(, enable_psmi);
> CONFIGFS_ATTR(, engines_allowed);
>+CONFIGFS_ATTR(, gt_types_allowed);
> CONFIGFS_ATTR(, survivability_mode);
>=20
> static struct configfs_attribute *xe_config_device_attrs[] =3D {
>@@ -679,6 +787,7 @@ static struct configfs_attribute *xe_config_device_att=
rs[] =3D {
>         &attr_ctx_restore_post_bb,
>         &attr_enable_psmi,
>         &attr_engines_allowed,
>+        &attr_gt_types_allowed,
>         &attr_survivability_mode,
>         NULL,
> };
>@@ -846,6 +955,7 @@ static void dump_custom_dev_config(struct pci_dev *pde=
v,
>                                  dev->config.attr_); \
>         } while (0)
>=20
>+        PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>         PRI_CUSTOM_ATTR("%llx", engines_allowed);
>         PRI_CUSTOM_ATTR("%d", enable_psmi);
>         PRI_CUSTOM_ATTR("%d", survivability_mode);
>@@ -896,6 +1006,26 @@ bool xe_configfs_get_survivability_mode(struct pci_d=
ev *pdev)
>         return mode;
> }
>=20
>+/**
>+ * xe_configfs_get_gt_types_allowed - get GT type allowed mask from confi=
gfs
>+ * @pdev: pci device
>+ *
>+ * Return: GT type mask set in configfs
>+ */
>+u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev)
>+{
>+        struct xe_config_group_device *dev =3D find_xe_config_group_devic=
e(pdev);
>+        u64 mask;
>+
>+        if (!dev)
>+                return device_defaults.gt_types_allowed;
>+
>+        mask =3D dev->config.gt_types_allowed;
>+        config_group_put(&dev->group);
>+
>+        return mask;
>+}
>+
> /**
>  * xe_configfs_get_engines_allowed - get engine allowed mask from configf=
s
>  * @pdev: pci device
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_conf=
igfs.h
>index c61e0e47ed94..c6ad8df9e913 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -17,6 +17,7 @@ int xe_configfs_init(void);
> void xe_configfs_exit(void);
> void xe_configfs_check_device(struct pci_dev *pdev);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>+u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engi=
ne_class,
>@@ -28,6 +29,7 @@ static inline int xe_configfs_init(void) { return 0; }
> static inline void xe_configfs_exit(void) { }
> static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pde=
v) { return false; }
>+static inline u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev) =
{ return U64_MAX; }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) {=
 return U64_MAX; }
> static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { r=
eturn false; }
> static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev=
, enum xe_engine_class,
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 65312fe9b97b..4a792e1037d5 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -685,11 +685,17 @@ static void xe_info_probe_tile_count(struct xe_devic=
e *xe)
>=20
> static struct xe_gt *init_primary_gt(struct xe_tile *tile,
>                                      const struct xe_graphics_desc *graph=
ics_desc,
>-                                     const struct xe_media_desc *media_de=
sc)
>+                                     const struct xe_media_desc *media_de=
sc,
>+                                     u64 gt_types_allowed)
> {
>         struct xe_device *xe =3D tile_to_xe(tile);
>         struct xe_gt *gt;
>=20
>+        if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MAIN)) =3D=3D 0) {
>+                drm_info(&xe->drm, "Primary GT disabled via configfs\n");
>+                return NULL;
>+        }
>+
>         gt =3D xe_gt_alloc(tile);
>         if (IS_ERR(gt))
>                 return gt;
>@@ -710,11 +716,17 @@ static struct xe_gt *init_primary_gt(struct xe_tile =
*tile,
> }
>=20
> static struct xe_gt *init_media_gt(struct xe_tile *tile,
>-                                   const struct xe_media_desc *media_desc=
)
>+                                   const struct xe_media_desc *media_desc=
,
>+                                   u64 gt_types_allowed)
> {
>         struct xe_device *xe =3D tile_to_xe(tile);
>         struct xe_gt *gt;
>=20
>+        if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MEDIA)) =3D=3D 0) {
>+                drm_info(&xe->drm, "Media GT disabled via configfs\n");
>+                return NULL;
>+        }
>+
>         gt =3D xe_gt_alloc(tile);
>         if (IS_ERR(gt))
>                 return gt;
>@@ -739,6 +751,8 @@ static struct xe_gt *init_media_gt(struct xe_tile *til=
e,
> static int xe_info_init(struct xe_device *xe,
>                         const struct xe_device_desc *desc)
> {
>+        struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>+        u64 gt_types_allowed =3D xe_configfs_get_gt_types_allowed(pdev);
>         u32 graphics_gmdid_revid =3D 0, media_gmdid_revid =3D 0;
>         const struct xe_ip *graphics_ip;
>         const struct xe_ip *media_ip;
>@@ -820,11 +834,25 @@ static int xe_info_init(struct xe_device *xe,
>                 if (err)
>                         return err;
>=20
>-                tile->primary_gt =3D init_primary_gt(tile, graphics_desc,=
 media_desc);
>+                tile->primary_gt =3D init_primary_gt(tile, graphics_desc,=
 media_desc,
>+                                                   gt_types_allowed);
>                 if (IS_ERR(tile->primary_gt))
>                         return PTR_ERR(tile->primary_gt);
>=20
>-                tile->media_gt =3D init_media_gt(tile, media_desc);
>+                /*
>+                 * It's not currently possible to probe a device with the
>+                 * primary GT disabled.  With some work, this may be futu=
re in
>+                 * the possible for igpu platforms (although probably not=
 for
>+                 * dgpu's since access to the primary GT's BCS engines is
>+                 * required for VRAM management).
>+                 */
>+                if (!tile->primary_gt) {
>+                        drm_err(&xe->drm, "Cannot probe device with witho=
ut a primary GT\n");
>+                        return -ENODEV;
>+                }
>+
>+                tile->media_gt =3D init_media_gt(tile, media_desc,
>+                                               gt_types_allowed);
>                 if (IS_ERR(tile->media_gt))
>                         return PTR_ERR(tile->media_gt);
>         }
>--=20
>2.51.0
>
