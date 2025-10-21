Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6656ACCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 21:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2029910E315;
	Tue, 21 Oct 2025 21:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f60YqxRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0C510E315
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761081228; x=1792617228;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ewN/IcOohhK6KyXvP4AJmLt8R8+i5EWawORKHNSaj7w=;
 b=f60YqxRCeXViLJAZviaTe8kFo285UO50pArgv4QiTYlLnWvJzrCTc2Ui
 /bFO3BDzrGFDz1FYF38tZi/ySUH6T1VtUVl8rTWk6vetyUs0MDLoTDzbM
 X5o80OcsXOf8JFGud4xNJJa/Tux2PNMJ2BSw6n8Yi3oyATWMsbRsdtEry
 b06vNArr1G3M1zgM0HfSaSFHpe3JfeV0AfOqwYRVxw3Bvppyy5VIeL79r
 Kbz2BsrCjhNOsz9nHv4Kecm69YCRhAzzp7275HYzDYaV9F2NL2t8AGSBw
 b/+yRdVYElpyY8QB8vjNk9R0ZNwUQKVMiiHWSPqVCIoc+doGEoBCiZLV8 w==;
X-CSE-ConnectionGUID: H369vLQVQru83xaYqFnJCw==
X-CSE-MsgGUID: QS7Q6O2qS7mv4Ung8IeICg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63258800"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63258800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:13:47 -0700
X-CSE-ConnectionGUID: TpEasiJCSr+iGZ5JG8iL+w==
X-CSE-MsgGUID: +U5Oi5Y7SySXxl9G9YswjA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:13:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:13:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 14:13:47 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jp0P58cCezwa6Jk0o+znud6+OSSyK46Il0BVdA5yeWcxYhUiH7tdvtvxsJurYsdhlhD8tmLkRrUcFMV16cApgGEzEgI+TZoXrENdZuDivM6rn7c4hzisfiyJrY93Cv/qTfFAhy/XW+cNMy5hRRax2XXrvmZyoou4x+vpg/djbCIYDpisBEqfBoLa3xaFmbjUmqTK+OU0Gnnl+puH8MxJR5Ewk3RWE7jYLtjwHEhMfwMK0AD/TaDXntTnp39X1npRV2altURGgdJJvgP7SYONrSyhu+sIG7bbaiA0sS34zMsMURNZgyfDxCcDQCVvJ6kZP5AJsvvjwNFOmaunJRW7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAWs5oQFZm32bWDDrvaqQ8bAAAQhXtxxIpjyfB/3sJQ=;
 b=yt39OWWW113o2+YDA8St686F4CoX8lpclT7pf70vvXWZyfU6eQ6hbOLguz+OSz340DaHzMyEexLOKaxajqLKbyWi4RehWB1L9xSJyxvk14z3fnxvt9RYIRti+53aQNksRBr8Hif8XWoRPd+l/iPw+Y7uJsg0U/EQJwfdiFSPxEe0QfyHkv0sQsVE1NdJpX6iTe2VFS1WUHGxfyoAhZzaS8acuWm7qGEpa5yBeQFz0B8iHnE/S5MsE+bi0oCz4VO1fQrOQE2zjc1GXNXTQo5c0BolcRI1P5lWevoy+dUyMTVB3fKGwh36v3ly4kZybK78f9s9clMkCheLUfaxo53+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ5PPF06F7EC6B5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::807) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 21:13:44 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 21:13:43 +0000
Message-ID: <f19dea5d-5399-4c1e-b669-9a1cd2bd2c6b@intel.com>
Date: Tue, 21 Oct 2025 17:13:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Add prefix to guc log buffer macros
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>
References: <20251009215749.378905-1-zhanjun.dong@intel.com>
 <20251009215749.378905-3-zhanjun.dong@intel.com>
 <046b8be5-1b11-4c43-94ba-095638e48be8@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <046b8be5-1b11-4c43-94ba-095638e48be8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::14) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ5PPF06F7EC6B5:EE_
X-MS-Office365-Filtering-Correlation-Id: 37984f58-44ac-4894-48c0-08de10e6b74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjFBMnpmQmNISGRrNm8vU1NRcVRhcDVMT1RGOU9wSTZaWDRVR0EzbFNlQ21z?=
 =?utf-8?B?ZGpsMmtMbS9lbGNrZXNZblpxRStiTld1TWJobm1qV1BTdnFQNUxVTUtkdFkr?=
 =?utf-8?B?ZWNraUl4QzJHbC9JN0hqRGZERThISFdxb2NHSmNqS0lZTDJKaWgyNlNxRm91?=
 =?utf-8?B?YUcyNVY1ekFBVUNHcUVoeTczK1RVMlFkOUxmODloVlZwQTV3WCtwdkh1L1NP?=
 =?utf-8?B?a1krTG9jRy9lUko1N0ZabGRQcjRYVXdrcmhoVlprNDAxZTAxb1Vtb29nY1FU?=
 =?utf-8?B?STQ4MUYveXdVa0RXU2o0eVhHS3d3ZCtjQnlxWlMxWW00VCs2VnFEQXBVaFAy?=
 =?utf-8?B?TnQxWkU0c2wwaHoxSXBxVG16V0xlaFVydDRSUFdxdTBkcEZGRm01MTh5Qi9n?=
 =?utf-8?B?TG1FczFkOHJOZGRMUUttaUc5WnpjWm4rZjYxU1pKUVFGYkNYNHY5NjZrS1gz?=
 =?utf-8?B?VmwrWjJuUlk5KzRhS0hBOWVzY1B6UHY0VFVSSUoyaFYwUTRWV3M3cXJOdlFv?=
 =?utf-8?B?RXdkN2x0NzljYU9CZHMzdWNoMk4xQ3pubHlINXpscllUWEQyN3ZjWEl4bmRw?=
 =?utf-8?B?K2luN3dhUE1mQTVCdTROLytDKzNiaGZzMndTVXEvR21VNkxhWTBDbTk2N3pR?=
 =?utf-8?B?VS9hQmFxUVE1cWdha1g5MS9IcEhWTU1waWdxRms5QWRLdjYwa0hudW54S3pw?=
 =?utf-8?B?OEdCNmM2MDF0WWUwWFR4WEsyMktTcmNhSHNlaHVIbitGS1gwUXZUYlRNR1I5?=
 =?utf-8?B?cHlhNE9TaDZYVFYwcDYvVWpWZ0ZCM2V0VTBwT2JuVjBnRkh0SEdDYTI4RHlt?=
 =?utf-8?B?c2lUWGtqTm1FVHV2Z3VCazBBeko1ZmFJK0Myb1F2MFMyM0tnWnpudzAyNWJr?=
 =?utf-8?B?Zks1S1JyWW1QY1R0RjN2eTNnVmxucjJBVGZWeWpmcmY3QU92eGdWbmVVVFd2?=
 =?utf-8?B?TlVzeXJ3Z2U4YUNDUXplWTM3NEdGaVZWT05TQ1JaZUVFZ0JvUzlmbXNZTDR5?=
 =?utf-8?B?amZZdklRZXlIQllMTlBOVWVkQm5ZOTkwMFQvMEpkWTIzN0VsdzBFSHNTczIr?=
 =?utf-8?B?UmZsK29EYStVdVk2T1ZHbmxQY1A2NlVMR2VsUERoTzJjRjVIZndOVFNWaDEy?=
 =?utf-8?B?bm1TYmdSRDNpL0NrWWNnbm5uVWg3OFk3OHVhcjZ1MEI1dnZwb0NLdDcvb3lQ?=
 =?utf-8?B?cGh6SjRQUmUvOWVHY1ZxaHFCZm9qa3FRQVl5WjVUSWNPZ3krdlBpc0owdEpn?=
 =?utf-8?B?TGxGdTZXNlpzNWxPa1dwRW9jMGxkaUg3eGNvb2xvOXdId2FUbVdmb0syNFA0?=
 =?utf-8?B?aW1yZWNjNmVQczRrd2hKUXV4QUphdXBWeWJMUi8reG1NNjAwR0podmxxRW5z?=
 =?utf-8?B?a2VZMVVWeWxvd0hrdmJ0QTBaRExvNlJ1MjRRaXJ5a0VqcGpVaGV0MnhZZEpi?=
 =?utf-8?B?eEFzdEk1djAxWmhYYlZwRWxNbVQzNnBUR1lFS3JEV2UyRDVvSEk5K1UydExj?=
 =?utf-8?B?RkVHTnZrNjNwR296eDJZSWlmamFXdmhlRlYzVk4rYlB2UW5OQmhad0tzaU14?=
 =?utf-8?B?cGI0YUhRT08rdG5RcVBKTzZpaEI4VlNLRjBaTi9pbERUMkN1cHE4L3J5U0d5?=
 =?utf-8?B?dzRpdzY4UDlqR3VRN0pVcE1BK0NPZVdPWktTSklQbG1CWUhPVnd1S3FtRURa?=
 =?utf-8?B?MGpSVWtpT1FFa25uQVJuMy9nRXBHNEFzNHJBenF0bitxL3V2akZUaXB3SVpL?=
 =?utf-8?B?alRFNFJBSUoxcXBFV29XYW1JaFFvWlpKbkVNcmtURkN5RGliWTZYK3RPa3Rj?=
 =?utf-8?B?Y1lqdEF1NXB5QytXRFhZelpmL2ZqQkhrZlNUVkQ3cXg2d3dTSEtZSkpySWpn?=
 =?utf-8?B?b2VOMUZxcHNQVlFiSlpGMHN4TzAyREttTjI2NmtnbjdRUzRoSGZuMG5UeTd3?=
 =?utf-8?Q?g4hc6NMbI6J75Ig2Hke5CyOXwTkji2cC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3FUVWJiRC9TaDByRWRGSXFoRGJEYUdqYi9uY1JmN3R3Y0RlQ2NaazV2Y1ha?=
 =?utf-8?B?ZEc2c3hJSkMySmluZm8wRFNxUTVRWWwwYTFKMFBsa0JzTkxjNE1BUWE3cVhp?=
 =?utf-8?B?SGs1ZVpObFRaT0tCeEtWNDk1YmZiZzZyL3lReFNIRS9aNmFzTGkyS04yaGRQ?=
 =?utf-8?B?T0Mzem5HVmtTVG1oMGxuQXJndHNadzU0cEttcXVhSmxSZjZQRytGTkErcWkw?=
 =?utf-8?B?d1VhU01LTmxKUjhWNElKWFNBeXBGbS9GWFAxZ2ZOcnVvMDFGbnlkYWZ4OTVS?=
 =?utf-8?B?dHdPL01KbXhWamZ0SXJ6U2lOc2FvRzJOZ0RBa0hRcE02TDN1L1NtQ1VhMHNH?=
 =?utf-8?B?cUJ3NnlQVFFCNDM1WjcvamxTd0U3VVZ4a1VhTXl1MWxUbVVGNFpGUzJDQzZs?=
 =?utf-8?B?a1cvVVhWQndxT00wbEtRVnk3eFlyendBcVdPdFRTRUphclhuMzgrQlA3NVlh?=
 =?utf-8?B?aHpDd1hybGhCbXpxU2tmYnRCMVZSS0c0dVdyZ0c5VWVwRmg5Vlhzc2VmaDZr?=
 =?utf-8?B?czVNdUNzVHVqY1FaZGV5RldKUTRGQWNhMDFCdVEraFYzUGlucmY2c1dDV3M0?=
 =?utf-8?B?ejhEZms4NGNDcGVNOHJ4dVdWZUxLcit6N3RXUy96VEhlY25OQkpjWW5Md0Zx?=
 =?utf-8?B?NDE5aXZuT2xZd1RvYnk2Mk9qMFVwbndwNzRiNHRhdmVrZ3ZGeGozV1RqMUpi?=
 =?utf-8?B?OVdnTmJXOEZwYnlNQmVuMCt3bzN0WE9KdGpxVXZvV2I1a1h5cndVK3B0UHd5?=
 =?utf-8?B?SktUeW1waHMzN3pSb0ZvYzFrQUVOWmNzZ1lVa0wybTlQenVvUEgrNEdUREJ5?=
 =?utf-8?B?ckl3Z2tLRHYxSTh0dlVtdjFCdk9tMWx3L0cxL2R0RThnTHYrcjZORnhwaUE3?=
 =?utf-8?B?Q2Nyb3c2QUEzWk9QNm5sbzBLN2psZDFqa2tXZzdCdVZHY1BqV3hXY2xrUnFL?=
 =?utf-8?B?VzlzOUZRMEhIR1cyV1E3QS9kUHkydEdjZFhHYkJ5UzZpUjZRNkU4cmpxMmw1?=
 =?utf-8?B?Zm5GNXVTaG41ekFGSU5NMDNPY0RtL2haUzl4Uy9aSVFkWkxMaFo4aWd0RlJX?=
 =?utf-8?B?bkZweTdCVTNKT2VxSEkzcVQvSkpQVEtQTkJXUlduZ3NsWlAvd1ZpYkVVSFJF?=
 =?utf-8?B?SGg4djFKWXFCTjdnRkJvdVFYV0VRUnpFM1hUSURrNHBDMXM3SlhEOUxZaDgy?=
 =?utf-8?B?YXIyOGVKK3dUUExKTkxvZUFHNk5CUDY1Yk1uUVlYTWt2dm85aS9qaHJwaVU4?=
 =?utf-8?B?UndVeGxOWkpNbnU0YjJESjhDU05qd2dvdGJMT2ovWlZEdzE5OHRvcmJyNnEy?=
 =?utf-8?B?c3RaZFB3eldjTEc4ZW5KQlc3dzZkcElrbnR1am9ycklSdzNRbitRd1FRWEFz?=
 =?utf-8?B?bk1vSkZwdlZpZXZVNHhxMnFyM0tGUjBVL2RwZi9oVytxSXlBeEp3VmdMaTkw?=
 =?utf-8?B?bWhjdm9YQlpsWHhZcDJVWDVZTkM2bm0wa2h3M1NUMTZRSzdtRDEvdVh5NUoz?=
 =?utf-8?B?bTAvV3ovOGw0YzRLQS9DZVJsUUdtZ0FCZ0JCaHQ0V094VHBDbWJXZ0lzbE1j?=
 =?utf-8?B?b1NRSnJWd2gyMnVmODJPOU5DeDE1WG1rcU9NUWFhK1hXQWdSdjVuR2RUYlFt?=
 =?utf-8?B?YzdBTDM1Y3dmRVpvVzNsWU1iV2kvOGFvK05XSXZPck9XbXAwdm1KT2VWNHNo?=
 =?utf-8?B?YTF5bTdJUzE0S3VRcm1xZzlTY3ZOZXV0ZUNaSFZ0VUJJMHQwWG5YaC9PdWI4?=
 =?utf-8?B?TnpEYTh6VnBmRGE1dkZLOHV0eVVrTWhCK0pFamtUTDlkVWtkS3BwNE1qQW94?=
 =?utf-8?B?RTNNODYvOGZpbFlRbVhGUUZYbkpxaHR6WDQ2a0lUUVBuZFV3V2JvUmkyNTU1?=
 =?utf-8?B?WEZGckNIM0o4bW1JeUVONWZHT0c1bU1YR3I1VEJ4QlQ5WEpFVk9rclR0Vmk0?=
 =?utf-8?B?OGtWSFpaVG9HNkd0TDRVcTFGNitxeVRxM3RwejJ2MDhKMDlvS3BnM2NCcFkv?=
 =?utf-8?B?OVJ4K2ZlUDJRUVlSa2NRN0N2amhYVENIK20ybGpTN0VVWHdLVnorQVplUzJt?=
 =?utf-8?B?RVpKUkVsLzltNzR5SEg0a0lLekVVdTJ6UXJvd21hd3JTZHpWWTR2YWZIRVBq?=
 =?utf-8?B?QkFnTVFQME5zSUJveGY0d3hjcDVXUTRkZ3lUeTltZ3E5VGVjQ095SFVmSU1J?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37984f58-44ac-4894-48c0-08de10e6b74b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 21:13:43.8830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnjVZDN/Lv5P0levChefwR1hPAqYaXQ8AQ6nzzuvRdVkkb9HgXdV72yAiCtfguHW5ChVy9s0lTRqvR6erMc0cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF06F7EC6B5
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



On 2025-10-21 1:49 p.m., Michal Wajdeczko wrote:
> 
> 
> On 10/9/2025 11:57 PM, Zhanjun Dong wrote:
>> Add prefix to GuC log buffer macros to follow Xe naming styles.
>> Remove helper functions, replaced with macros.
>> Rename GuC log related macros.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h |   4 +-
>>   drivers/gpu/drm/xe/xe_guc.c          |  23 ++---
>>   drivers/gpu/drm/xe/xe_guc_capture.c  |  16 ++--
>>   drivers/gpu/drm/xe/xe_guc_fwif.h     |   6 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c      | 121 ++++++++++-----------------
>>   drivers/gpu/drm/xe/xe_guc_log.h      |  14 ++--
>>   6 files changed, 75 insertions(+), 109 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index b1819679fa35..fb5e2b8e7cf9 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -10,9 +10,9 @@
>>   
>>   /* GuC logging buffer types */
>>   enum guc_log_buffer_type {
>> -	GUC_LOG_BUFFER_DEBUG,
>> +	GUC_LOG_BUFFER_EVENT_DATA,
>>   	GUC_LOG_BUFFER_CRASH_DUMP,
>> -	GUC_LOG_BUFFER_CAPTURE,
>> +	GUC_LOG_BUFFER_STATE_CAPTURE,
>>   };
>>   
>>   #define GUC_LOG_BUFFER_TYPE_MAX		3
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index d5adbbb013ec..82a22479b741 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>   	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>>   	u32 flags;
>>   
>> -	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>> +	#if (((XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) % SZ_1M) == 0)
>>   	#define LOG_UNIT SZ_1M
>>   	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>>   	#else
>> @@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>   	#define LOG_FLAG 0
>>   	#endif
>>   
>> -	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>> +	#if (((XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>   	#define CAPTURE_UNIT SZ_1M
>>   	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>>   	#else
>> @@ -115,20 +115,21 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>   	#define CAPTURE_FLAG 0
>>   	#endif
>>   
>> -	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
>> -	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
>> -	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
>> -	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
>> -	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>> -	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>> +	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE);
>> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE, LOG_UNIT));
>> +	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE);
>> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE, LOG_UNIT));
>> +	BUILD_BUG_ON(!XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE);
>> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>>   
>>   	flags = GUC_LOG_VALID |
>>   		GUC_LOG_NOTIFY_ON_HALF_FULL |
>>   		CAPTURE_FLAG |
>>   		LOG_FLAG |
>> -		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>> -		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
>> -		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
>> +		FIELD_PREP(GUC_LOG_CRASH_DUMP, XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE / LOG_UNIT - 1) |
>> +		FIELD_PREP(GUC_LOG_EVENT_DATA, XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE / LOG_UNIT - 1) |
>> +		FIELD_PREP(GUC_LOG_STATE_CAPTURE, XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE /
>> +			   CAPTURE_UNIT - 1) |
>>   		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>>   
>>   	#undef LOG_UNIT
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 243dad3e2418..49b47727cd5a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>>   {
>>   	int capture_size = guc_capture_output_size_est(guc);
>>   	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>> -	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>> +	u32 buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>>   
>>   	/*
>>   	 * NOTE: capture_size is much smaller than the capture region
>> @@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>>    *                  ADS module also calls separately for PF vs VF.
>>    *
>>    *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
>> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
>> + *                  Size = #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)
>>    *                  Note2: 'x 3' to hold multiple capture groups
>>    *
>>    * GUC Runtime notify capture:
>> @@ -1340,7 +1340,7 @@ static int __guc_capture_flushlog_complete(struct xe_guc *guc)
>>   {
>>   	u32 action[] = {
>>   		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
>> -		GUC_LOG_BUFFER_CAPTURE
>> +		GUC_LOG_BUFFER_STATE_CAPTURE
>>   	};
>>   
>>   	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>> @@ -1357,8 +1357,8 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>>   	u32 log_buf_state_offset;
>>   	u32 src_data_offset;
>>   
>> -	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
>> -	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
>> +	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_STATE_CAPTURE;
>> +	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE);
>>   
>>   	/*
>>   	 * Make a copy of the state structure, inside GuC log buffer
>> @@ -1368,15 +1368,15 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>>   	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
>>   			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>>   
>> -	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
>> +	buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>>   	read_offset = log_buf_state_local.read_ptr;
>>   	write_offset = log_buf_state_local.sampled_write_ptr;
>>   	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
>>   
>>   	/* Bookkeeping stuff */
>>   	tmp = FIELD_GET(GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE, log_buf_state_local.flags);
>> -	guc->log.stats[GUC_LOG_BUFFER_CAPTURE].flush += tmp;
>> -	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_CAPTURE,
>> +	guc->log.stats[GUC_LOG_BUFFER_STATE_CAPTURE].flush += tmp;
>> +	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE,
>>   						     full_count);
>>   
>>   	/* Now copy the actual logs. */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 50c4c2406132..8b5c58b1857c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -91,9 +91,9 @@ struct guc_update_exec_queue_policy {
>>   #define   GUC_LOG_NOTIFY_ON_HALF_FULL	BIT(1)
>>   #define   GUC_LOG_CAPTURE_ALLOC_UNITS	BIT(2)
>>   #define   GUC_LOG_LOG_ALLOC_UNITS	BIT(3)
>> -#define   GUC_LOG_CRASH			REG_GENMASK(5, 4)
>> -#define   GUC_LOG_DEBUG			REG_GENMASK(9, 6)
>> -#define   GUC_LOG_CAPTURE		REG_GENMASK(11, 10)
>> +#define   GUC_LOG_CRASH_DUMP		REG_GENMASK(5, 4)
>> +#define   GUC_LOG_EVENT_DATA		REG_GENMASK(9, 6)
>> +#define   GUC_LOG_STATE_CAPTURE		REG_GENMASK(11, 10)
>>   #define   GUC_LOG_BUF_ADDR		REG_GENMASK(31, 12)
>>   
>>   #define GUC_CTL_WA			1
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index b5d837efaf74..90648968d4d9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -19,6 +19,44 @@
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>>   
>> +/*
>> + *  GuC Log buffer Layout
> 
> maybe this could be promoted do kernel-doc:
> 
>     /**
>      * DOC: GuC Log buffer Layout
>      *
>      * ::
>      *
> 
>> + *
>> + *  +===============================+	      0000h
>> + *  |    Crash dump state header    |		^
>> + *  +-------------------------------+ 32B	|
>> + *  |      Debug state header       |		|
>> + *  +-------------------------------+ 64B	4KB
>> + *  |     Capture state header      |		|
>> + *  +-------------------------------+ 96B	|
>> + *  |                               |		v
>> + *  +===============================+ <--- EVENT_DATA offset
>> + *  |  Event logs(raw data)         |		^
>> + *  |                               |		|
>> + *  |                               | EVENT_DATA_BUFFER_SIZE
>> + *  |                               |		|
>> + *  |                               |		v
>> + *  +===============================+ <--- CRASH_DUMP offset
>> + *  | Crash Dump(raw data)          |		^
>> + *  |                               |		|
>> + *  |                               | CRASH_DUMP_BUFFER_SIZE
>> + *  |                               |		|
>> + *  |                               |		v
>> + *  +===============================+ <--- STATE_CAPTURE offset
>> + *  | Error state capture(raw data) |		^
>> + *  |                               |		|
>> + *  |                               | STATE_CAPTURE_BUFFER_SIZE
>> + *  |                               |		|
>> + *  |                               |		v
>> + *  +===============================+ Total: GUC_LOG_SIZE
>> + */
>> +#define GUC_LOG_SIZE ((SZ_4K) + \
>> +		      (XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE) + \
>> +		      (XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) + \
>> +		      (XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE))
> 
> too many ( ), only one set is needed to wrap all additions

will change it to
+#define GUC_LOG_SIZE (SZ_4K) + \
+		      (XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE) + \
+		      (XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) + \
+		      (XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE)

I follow the rule that add () to all macros referenced as operand within 
an expression.
This way if the operand macro was change in the future, the logic in 
this macro, like operator precedence will not be effected.

>> +
>> +#define GUC_LOG_CHUNK_SIZE	SZ_2M
>> +
>>   static struct xe_guc *
>>   log_to_guc(struct xe_guc_log *log)
>>   {
>> @@ -37,33 +75,6 @@ log_to_xe(struct xe_guc_log *log)
>>   	return gt_to_xe(log_to_gt(log));
>>   }
>>   
>> -static size_t guc_log_size(void)
>> -{
>> -	/*
>> -	 *  GuC Log buffer Layout
>> -	 *
>> -	 *  +===============================+ 00B
>> -	 *  |    Crash dump state header    |
>> -	 *  +-------------------------------+ 32B
>> -	 *  |      Debug state header       |
>> -	 *  +-------------------------------+ 64B
>> -	 *  |     Capture state header      |
>> -	 *  +-------------------------------+ 96B
>> -	 *  |                               |
>> -	 *  +===============================+ PAGE_SIZE (4KB)
>> -	 *  |        Crash Dump logs        |
>> -	 *  +===============================+ + CRASH_SIZE
>> -	 *  |          Debug logs           |
>> -	 *  +===============================+ + DEBUG_SIZE
>> -	 *  |         Capture logs          |
>> -	 *  +===============================+ + CAPTURE_SIZE
>> -	 */
>> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>> -		CAPTURE_BUFFER_SIZE;
>> -}
>> -
>> -#define GUC_LOG_CHUNK_SIZE	SZ_2M
>> -
>>   static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
>>   {
>>   	struct xe_guc_log_snapshot *snapshot;
>> @@ -257,7 +268,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>>   	struct xe_bo *bo;
>>   
>> -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>> +	bo = xe_managed_bo_create_pin_map(xe, tile, GUC_LOG_SIZE,
>>   					  XE_BO_FLAG_SYSTEM |
>>   					  XE_BO_FLAG_GGTT |
>>   					  XE_BO_FLAG_GGTT_INVALIDATE |
>> @@ -265,7 +276,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   	if (IS_ERR(bo))
>>   		return PTR_ERR(bo);
>>   
>> -	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
>> +	xe_map_memset(xe, &bo->vmap, 0, 0, GUC_LOG_SIZE);
>>   	log->bo = bo;
>>   	log->level = xe_modparam.guc_log_level;
>>   
>> @@ -274,49 +285,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   
>>   ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>>   
>> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>> -{
>> -	return CRASH_BUFFER_SIZE;
>> -}
>> -
>> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>> -{
>> -	return DEBUG_BUFFER_SIZE;
>> -}
>> -
>> -/**
>> - * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
>> - * @log: The log object.
>> - *
>> - * This function will return the capture buffer size within log sections.
>> - *
>> - * Return: capture buffer size.
>> - */
>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>> -{
>> -	return CAPTURE_BUFFER_SIZE;
>> -}
>> -
>> -/**
>> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>> - * @log: The log object.
>> - * @type: The log buffer type
>> - *
>> - * Return: buffer size.
>> - */
>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> -{
>> -	switch (type) {
>> -	case GUC_LOG_BUFFER_CRASH_DUMP:
>> -		return xe_guc_log_section_size_crash(log);
>> -	case GUC_LOG_BUFFER_DEBUG:
>> -		return xe_guc_log_section_size_debug(log);
>> -	case GUC_LOG_BUFFER_CAPTURE:
>> -		return xe_guc_log_section_size_capture(log);
>> -	}
>> -	return 0;
>> -}
>> -
>>   /**
>>    * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>>    * @log: The log object.
>> @@ -327,17 +295,16 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>>    */
>>   u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>>   {
>> -	enum guc_log_buffer_type i;
>>   	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>   
>>   	switch (type) {
>> -	case GUC_LOG_BUFFER_CAPTURE:
>> -		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
>> +	case GUC_LOG_BUFFER_STATE_CAPTURE:
>> +		offset += XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE;
>>   		fallthrough;
>>   	case GUC_LOG_BUFFER_CRASH_DUMP:
>> -		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>> +		offset += XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE;
>>   		fallthrough;
>> -	case GUC_LOG_BUFFER_EVENT_LOG:
>> +	case GUC_LOG_BUFFER_EVENT_DATA:
> 
> maybe to avoid changing the same lines in the same small series twice,
> in patch 1 change not just order of enums but also update their names
> and don't do anything else..
> 
> maybe patches shall be in this order:
>   * reorder enum guc_log_buffer_type to match spec
>   * rename enum guc_log_buffer_type to match spec
>   * add XE_GUC_LOG prefix to public macros to match naming pattern
>   * use macros instead functions for size/offset
> 
> or if the split is really not feasible then do everything in a single patch ;(
I like this idea

Regards,
Zhanjun Dong
>>   		break;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 98a47ac42b08..a3620462f44c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -13,13 +13,13 @@ struct drm_printer;
>>   struct xe_device;
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> -#define CRASH_BUFFER_SIZE       SZ_1M
>> -#define DEBUG_BUFFER_SIZE       SZ_8M
>> -#define CAPTURE_BUFFER_SIZE     SZ_2M
>> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
>> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
>> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
>>   #else
>> -#define CRASH_BUFFER_SIZE	SZ_16K
>> -#define DEBUG_BUFFER_SIZE	SZ_64K
>> -#define CAPTURE_BUFFER_SIZE	SZ_1M
>> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_64K
>> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_16K
>> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
>>   #endif
>>   /*
>>    * While we're using plain log level in i915, GuC controls are much more...
>> @@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>   	return log->level;
>>   }
>>   
>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>>   u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>>   bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>>   				   enum guc_log_buffer_type type,
> 

