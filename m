Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9126FCD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 05:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1129110E1BB;
	Thu, 21 May 2026 05:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5XOEYig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F6E10E1BB
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 05:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779340097; x=1810876097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2EvyIqXRMu/wKNHQ1dQ+X8UrIhRW7ZPfHBIMgdyHWd4=;
 b=Q5XOEYigbUodqScrZHxBzCT/z12MGeUQe9PFhCtIYZ+HurkufGRf9lTH
 /bF3l84QHHq29NbEosUo+eqZ5V2Qbmz+zj0pdiyLnnfXr4jlKOBOg5+V9
 jHyFCD9E9DhrbpjissKz402fO7IBlWi5sVnNGk59PNPszBLSXwsX7lb/V
 CzVqvqLdXFNRLQqVkXaOJ7Z+GxNSi0gz6Mnt9iBMtjaXL25f9VcXIffG7
 Ep0aJZcqwUgRXLl4P7ZB0xxSm3Qblgb6m6z3NHwah82Zr+gk56iPBwMow
 9K0Ay9aDMYmZmQxE6C+864x3MlOoRhD6TQS+UaDVvQp2S7hzfCJdbK0JM w==;
X-CSE-ConnectionGUID: BIuVcpZmSN6MPMjf1EKgVg==
X-CSE-MsgGUID: 0i+xmHr8SduwIuWelLvOyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91359793"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="91359793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 22:08:16 -0700
X-CSE-ConnectionGUID: H/GmVbCjTz+y1PJdDM90cg==
X-CSE-MsgGUID: nrm4vup/S2SaeqyEAMTLrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="244414777"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 22:08:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 22:08:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 22:08:17 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 22:08:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hiq43b6XyLL2f3R18bTuZ45M3P8DX7kzkgcxNzl8ik21hJFGuFcFgjKUDpX/8WCU0t/ne+huARa+zaaK2DyjVwSea82mPJ5DrrTQxMgbeeSsSV2mDcwWONxCFd8wK40w5O3TYIt63GOSBCOBRpHrnwJVtBd3xHHmgVZMWn5wzrNMV3SwT3MToEPFc5Qkkhjwc4tO3zA8YQaLo6cAffOKsvn7WekwpG/vKkqXqP7TQXQ22MrSLNr1v/IS9xX0oIqwIzETJHV3D1qR7owU6IrO27lw6Vin3IMJnznmVms9d/a18ZWGHimOC9NQiyuhvlocTZ92i812eQniJ/ZNyePWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8955ETG/6fM0H5oP4yR4Tru0+UVn+CT+q0071uYQ8a0=;
 b=i5zFyE0qORkvZ3iJ6RxyaNTcgIg0ouDAkaybqfFjGcB6hpLixgP6k2Uu+S9oAt2XfOKFnqIQZgxdR4obJasdL1/EvBDwbvgpcZGxWbwAJ8jzRsgU9N53+ZLtq+tnQEDqwZzgVreiVjpojY30YqgiWGcnbd1TAUPci5k9En669ZhoC2blkW4kcjhgj8+A1Ey9gU2n9OrX6k9iWTccGFOWXLVA2M1I/0CAM6nNJ6ak0L0oNUxHaKU5esYUGTJYmJsuQ5sqXL4Yf5yTftYvavFG9+QVhg7F3ppy10/OdQFXLFRHcUYoFdMy6KeWXAHJ8iqZ80ncfE03YlnmwNaWoS+xSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:95::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.20; Thu, 21 May 2026 05:08:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 05:08:14 +0000
Message-ID: <d52c2fba-21cf-4c6a-bc38-f07f73f0d95c@intel.com>
Date: Thu, 21 May 2026 10:38:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-23-riana.tauro@intel.com>
 <4912daa7-8400-4485-ad38-18da26174583@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <4912daa7-8400-4485-ad38-18da26174583@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB4769:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf4fb40-14e1-4c82-78b5-08deb6f6f637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|3023799007|18002099003|4143699003|56012099003|22082099003|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: GQII6NJpodmpG/d6Nl7RuR5ghWOUH3FLVuHwSdbdz/k8njYpfXrfh2JSLiNeLijYUexWezXUWgJT4KVJPw/DUbsmN/PuEirgDneRRMmISo3YrlQ8p5pP/4YghGueZa6sCNMln3jfyH9b5sTf2gV3uluJ4r5aWaNRTYWAx8vsYM1J8yeLW06iEX1dXTRruQlks7MFzmdrZi97ko8gstnmNkPxJsdJZ9b39jPvjYPBlfPxZm2mKcVnBq9uOmlr9bq4x1znhAjLg0MtB7MHXw4KJdf1F5aFK4AAdeFzZICE7F/qCIWx/TrL5oTdaKJVppmB8ry1HuD9ENU1Xb1KZ02cdC+Y5uaggYGGuTRMuk5ZgF+GjBTs+mg0rlISVxZP6u3ObrgkEYdhvcrRuOMEFISCC/HVn2fE/otdtsxTL2gcpDw2DzE+it2rkJEkfT/6jKuioy0ouXDY/1FGTw848+/nVWC2HdmgzJqqHCyWZdMkS6l8ILfRLJvMWUtkY9YEWIpMYc8FNaYAAqa8RpZV3ZjniJal6IcNRiu4Cr6Au/1ET1hbJLin/99DlBTGT4W6XJHsI4sGmDEjvuLeBAKuIIVhBmM32aSi/jp0t+sh8JcDTqjz6VLBAwydzkHX+qIfILYvXuD3kEKS7mCjYO2WA1GRC/v0DbwqdYz4rhJ0J5VRl9CQ0HMyajPmaujtAb8ivSUG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(3023799007)(18002099003)(4143699003)(56012099003)(22082099003)(11063799006)(5023799004)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjB3dGk2WGJnbG5YWm9YYmxJMVV3QXV4L3E0SmR6dVVmR2lxei9qWkl2b08r?=
 =?utf-8?B?SG1rZlB5SDB5YllGOEx3d1J0M1AvZFlJUjQwdGEyb20vcHlrZUEzczhGOUhy?=
 =?utf-8?B?d1l0RFFEU0ZMNDl3NjRmNTFHQzRVQUJCUU9KSFJWMUNCd3ZvQlJlT1AwUnNx?=
 =?utf-8?B?M05Oa0Ewbkg4T25sZVhBOXFoZ2xDK2ZyR0FnZnVBd09mTDZ1VmpzN1k0Qnoz?=
 =?utf-8?B?UDhKZ2N0blZOWW5KbVkxcFpObjlzNmVRaXlNWm9wMmJNK0Y5ZXA4NmVwd3o1?=
 =?utf-8?B?bjNsSDlHUC9lYTFNR2dKQVloanBTbzVXTUNhT01FcVRGUEpyd24wZ1NaUTE5?=
 =?utf-8?B?Y2FUMlFkZE45R1NIVDRKUTdOUncrZ3FOT3BMUE5HbFp1UUNQK3o1ZHJQS2Vq?=
 =?utf-8?B?YVhSMjNVVVRDYXJrRytJbW43bTlFSzFibDB4QUZYZkRlNXdscGRlb05ocmla?=
 =?utf-8?B?SXJhczAvKy9YRHNHYnNOd3dxSkRwMXVwSFBtZ2VVV0dWOFA5NGJZbmlxN3Qy?=
 =?utf-8?B?THRkK0UyTWJqa3RvL0dwZGtrUnJ6V2ZzdFN6cU43bnBmbG53OHFGUzNldWRZ?=
 =?utf-8?B?RkJwYjkxMWVZRXJLdUxHN0VOa2dRUHFUVk1uVXNMVHUyTHdUK1pTSVg4aE5a?=
 =?utf-8?B?dDVGWDNsLzdCTEtEYnN5eCsvUGNMRW4vcUVUQ20vOUpaREl3eDhUWFovM3M4?=
 =?utf-8?B?RGdUVzRTOVczU0dhNjdZZC9qd3JUbGFGYTJWK2JXRGNtcXRVY1ZKWU5EUTVB?=
 =?utf-8?B?eERCelljVDFGTHk3aWIzbjZ0ZEkzakhsQnZTMVZIcFdJY0FBN2RrajRNYzZu?=
 =?utf-8?B?Y2R2dU5tZC9Tb0xPT1hYWEx2M2xVZnQxc0lHeEdOUEZrcEZuZEZ2OTdkK3RX?=
 =?utf-8?B?dHhqVWVlRkFzU3Q0V2V1bzlYbTAydlBKbjZiVXZ5Tm9ab21KcUlxbGVUQXow?=
 =?utf-8?B?SFI3VTZzbkdhcEdPMStSUTlUVXpLU09wZHBpZjhmdm8yUkFKbXVyM2lkK3p1?=
 =?utf-8?B?d3NWaGp5WFNiQjg3WlZZbENhMUZUdis4QmdNbEJ1QU9GTk1Gd1lNSU5VQnFV?=
 =?utf-8?B?YlAvRGJKSU1rQjRCcHJCbmQ4UnpuQ2doTkV1UjRXZzhlejBJZW1tSUZDUlZy?=
 =?utf-8?B?cVVIaE5seisrZ3ZYTWdVbENWOWcvU25aOUE4Ukd3VVJOaXF2MVF0ZHNJM2xp?=
 =?utf-8?B?dktSbGM5OUljTlBack5ZbEMvZDZRcDU0UHdYZVFLL1lGcWdtZko1MHgzMUF6?=
 =?utf-8?B?WGM0TGRyUzhYUngwZldJSG1nK1hDMnVMY1FyckxYY0pyekRoamR4NEFudWpB?=
 =?utf-8?B?elZOLytVc2lld1I1VDZpaW51Y0VyQnNoenRsWVRBU001ZFdXQTBRZFBKSXUx?=
 =?utf-8?B?NmxxT0NYeUdJVFJDSkZqdzdwYkF6dVN3VDdkYVVCaFJJVm44WE1ZM1IyUnFr?=
 =?utf-8?B?RG1oaEJLZG1YQmJwOGxMN0JsTDFnMVVDclZrb0lOZHVVQkFKT2NFbHFzL1ZL?=
 =?utf-8?B?cTJHQVNxakN2YUhVdnlsekdqbW1YWm4rbWt1TG9pVDJMblpGM0k1L1UxSWhU?=
 =?utf-8?B?S2M3WVFsdnVzaUQwY3liTHEwZW5VNnhhWFd6dFZuaXhSeXBEMFBvWm1TZStM?=
 =?utf-8?B?RitNeDNDY216cFdLMW5DUUdvejlWbENya2orSHNjT0FmQVM2ZFZZdkNrVFlz?=
 =?utf-8?B?QmQ5OUtmb2g0TDFwaVJXbGg1MTJxbFduemdxTG1ZNzV4bE1XNFJ0RTI2cVhH?=
 =?utf-8?B?cFZHOVZKbEdGMG4zU2lORzlsYzZvV3hqUXhGeTNZemxDODhXTVpkcis3K1Bw?=
 =?utf-8?B?QTc2V1pQU3NQZXlDcHZ1M0c5dTFOcEZCUTdXNlFvV0daS2ErdGJQMWQ1RXlp?=
 =?utf-8?B?KzZ2ZjZ3TUFLS3VYakMyUW9ob3ZwbktkaGVrZlVhL0ZlMnhoTStNRmNqVVRq?=
 =?utf-8?B?Rm93SjhvZ3ZNMms5bUpEcS9YbkFvc21ONlJLeU9sTlp4TENCTTRrYy81T05B?=
 =?utf-8?B?Q1R0RUJ3TEg5TWFzUVB3VCtST0cwUVZoQjh0MjFmWXRzSktpSkpxSWkrZ1E3?=
 =?utf-8?B?T0lTZHpuKzBzWHIxc01BRml1SmJLVEtmK3JzT3VvWXNhSU1WYzVlU0VkRXB3?=
 =?utf-8?B?TnVzTjhhWFk3VzNjM09Fa3VMTW1pbko4eHZDU0YvNGkyaU4weWtLVFF5RUpE?=
 =?utf-8?B?eVV1US9QSCsxK1NxazZET3pOQkc1dklNWXhaSzl1V1JaVTJRRnJNWUs0VXl4?=
 =?utf-8?B?YWgwZzhidE9ibnozTWpnZEFLejdQSmI1dlBTeElLZmFEcFh4Nk1oUmxzNVNZ?=
 =?utf-8?B?Sms3Y2F1ZkxndjlSNkpNU1drdE94Qk83alFGMWxkRlZWTVBQY1cxQT09?=
X-Exchange-RoutingPolicyChecked: f0r4yTAUIB8Hkgn9I4URUCGdDEaF1+QRGqwUMx55diobcab8BPEK1jV/TY9dOCndjPESdhXXqRNYxLSinlnlL0Syk+iBXt1sNkw5lM7kct+e34vNk3Kq7V0AIzO4T3bjxub6NpNTFaoEv7z2RoOs+6+l00c6lCSUyDHaLNGDDq8+jnrAjy7u/rxZLBkF2y6+NnadI/PnzDyFrTEF74GrIB5ckw+WL/9KNojQR275HlOonaaCko92kom/TB/KuUtbUj6fuggu61ZzxC2E/ip9y+Nhz/Via+7JzXh9swqZwKWRBWVu9bRef2VMGcCSh1HrE+cksTEtlhE7MUngp7fRzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf4fb40-14e1-4c82-78b5-08deb6f6f637
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 05:08:14.6029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrlbLEeaAVVzGiWsYI1EdFOFK1Ey1Ezv+bVGuDb+ThrSU2nEZMaEq+d1vvv/kgjg5SUSZL6HAPI18u+7hBUHPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
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


On 5/18/2026 4:20 PM, Mallesh, Koujalagi wrote:
>
>
> On 11-05-2026 10:59 pm, Riana Tauro wrote:
>> Add structures and command for get soc error and process uncorrectable
>> core-compute errors.
>>
>> Uncorrectable core-compute errors are classified into global and local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without disrupting the rest of the device.
>>
>> Upon detection of an uncorrectable local core-compute error, an AER is
>> generated and GuC is notified of the error to trigger engine reset.
>> Return recovered from PCI error callbacks for these errors.
>>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>> v2: add newline and fix log
>>      add bounds check (Mallesh)
>>      add ras specific enum (Raag)
>>      helper for sysctrl prepare command
>>      process all errors before deciding recovery action
>>
>> v3: remove TODO from commit message
>>      remove redundant rlen check
>>      fix loop
>>      add check for sysctrl flooding (Raag)
>>      do not use xe_ras prefix for static functions (Soham)
>>
>> v4: remove rlen initialization to 0
>>      remove local variable
>>      add error message for length mismatch (Raag)
>>      reset on sysctrl flooding
>>      fix sysctrl flood condition
>>
>> v5: rebase
>>      modify log and move it to process_errors
>>      modify sysctrl flood check
>>      remove whitespace
>>      simplify structure (Raag)
>>      fix typo in commit message
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 126 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |   3 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  55 ++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   4 files changed, 186 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 24642c309967..ecadad5857b2 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -9,6 +9,11 @@
>>   #include "xe_ras_types.h"
>>   #include "xe_sysctrl.h"
>>   #include "xe_sysctrl_event_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +#define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
>> +#define  GLOBAL_UNCORR_ERROR		2
>>   
>>   /* Severity of detected errors  */
>>   enum xe_ras_severity {
>> @@ -66,6 +71,38 @@ static inline const char *comp_to_str(u8 component)
>>   	return xe_ras_components[component];
>>   }
>>   
>> +static void prepare_ras_command(struct xe_sysctrl_mailbox_command *command,
>> +				u32 cmd_mask, void *request, size_t request_len,
>> +				void *response, size_t response_len)
>> +{
>> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
>> +
>> +	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
>> +		   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
>> +
>> +	command->header = hdr;
>> +	command->data_in = request;
>> +	command->data_in_len = request_len;
>> +	command->data_out = response;
>> +	command->data_out_len = response_len;
>> +}
>> +
>> +static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_device *xe,
>> +							      struct xe_ras_error_array *arr)
>> +{
>> +	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
>> +	u8 uncorr_type;
>> +
> xe parameter is not used, please remove it

I missed removing this while removing logs. Thank you will remove it

>> +	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->error_log_header);
>> +
>> +	/* Request a reset if error is global */
>> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
> We can use GLOBAL/LOCAL/default (unknown) as switch and log the error 
> type for easy to triage.

I don't think a switch is necessary here. We can log the type. But there 
is a new series for logging coming
up.  That is the reason we have minimal logging so detailed logging can 
be part of that.

>> +	/* Local errors are recovered using an engine reset by GuC */
>> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +}
>> +
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response)
>>   {
>> @@ -92,6 +129,95 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   	}
>>   }
>>   
>> +/**
>> + * xe_ras_process_errors() - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: recovery action to be taken
>> + */
>> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_get_soc_error response;
>> +	enum xe_ras_recovery_action final_action;
>> +	u32 count = XE_SYSCTRL_FLOOD;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +	/* Default action */
>> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +
>> +	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
>> +			    &response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "sysctrl: failed to get soc error %d\n", ret);
>> +			goto err;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "sysctrl: unexpected get soc error response length %zu (expected %zu)\n",
>> +			       rlen, sizeof(response));
>> +			goto err;
>> +		}
>> +
>> +		/* Report if number of errors exceeds the maximum errors supported */
>> +		if (response.num_errors > XE_RAS_NUM_ERROR_ARR)
>> +			xe_err(xe, "sysctrl: number of errors received %d out of bound (%d)\n",
>> +			       response.num_errors, XE_RAS_NUM_ERROR_ARR);
>> +
>> +		for (int i = 0; i < response.num_errors && i < XE_RAS_NUM_ERROR_ARR; i++) {
>> +			struct xe_ras_error_array *arr = &response.error_arr[i];
>> +			enum xe_ras_recovery_action action;
>> +			struct xe_ras_error_class error_class;
>> +			u8 component, severity;
>> +
> nit:We can directly read arr->error_class.common.component, no need of 
> local copy.

I can remove the error_class. But retaining component, severity 
otherwise there will be a line wrap
issue. This is much cleaner

>> +			error_class = arr->error_class;
>> +			component = error_class.common.component;
>> +			severity = error_class.common.severity;
>> +
>> +			xe_err(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
>> +			       sev_to_str(severity));
>> +
>> +			switch (component) {
>> +			case XE_RAS_COMP_CORE_COMPUTE:
>> +				action = handle_core_compute_errors(xe, arr);
>> +				break;
>> +			default:
>> +				/* For any other component, reset */
>> +				action = XE_RAS_RECOVERY_ACTION_RESET;
>> +				break;
>> +			}
>> +
>> +			/* Process and log all errors and then trigger highest recovery action */
>> +			if (action > final_action)
>> +				final_action = action;
>> +		}
>> +
>> +		/* Treat flooding as an system controller error */
>> +		if (!--count) {
>> +			xe_err(xe, "[RAS]: sysctrl: get soc error response flooding\n");
>> +			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		}
>> +
>> +	} while (response.additional_errors);
>> +
>
> What happen when firmware return num_errors=0 (or 
> additional_errors=0), default final_action = 
> XE_RAS_RECOVERY_ACTION_RECOVERED is that fine?
>

If num_errors = 0 then we don't have any errors, we don't need to reset. 
That should never happen since AER is generated on error.
If additonal_errors=0, whatever errors are in the first response the 
highest action will be taken.

Thanks
Riana

> Need to handle empty payload as well.
>
> Thanks
>
> -/Mallesh
>
>> +	return final_action;
>> +
>> +err:
>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index a88ea0a46766..cdaad3114dae 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,10 +6,13 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>>   
>> +#include "xe_ras_types.h"
>> +
>>   struct xe_device;
>>   struct xe_sysctrl_event_response;
>>   
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response);
>>   void xe_ras_init(struct xe_device *xe);
>> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 4e63c67f806a..e97026fd6ff9 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -8,8 +8,27 @@
>>   
>>   #include <linux/types.h>
>>   
>> +#define XE_RAS_NUM_ERROR_ARR			3
>>   #define XE_RAS_NUM_COUNTERS			16
>>   
>> +/**
>> + * enum xe_ras_recovery_action - RAS recovery actions
>> + *
>> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
>> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
>> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
>> + * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
>> + *
>> + * This enum defines the possible recovery actions that can be taken in response
>> + * to RAS errors.
>> + */
>> +enum xe_ras_recovery_action {
>> +	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
>> +	XE_RAS_RECOVERY_ACTION_RESET,
>> +	XE_RAS_RECOVERY_ACTION_DISCONNECT,
>> +	XE_RAS_RECOVERY_ACTION_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across all products
>>    */
>> @@ -70,4 +89,40 @@ struct xe_ras_threshold_crossed {
>>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_error_array - Details of the error types
>> + */
>> +struct xe_ras_error_array {
>> +	/** @counter_value: Counter value of the returned error */
>> +	u32 counter_value;
>> +	/** @error_class: Error class */
>> +	struct xe_ras_error_class error_class;
>> +	/** @timestamp: Timestamp */
>> +	u64 timestamp;
>> +	/** @error_details: Error details specific to the class */
>> +	u32 error_details[XE_RAS_NUM_COUNTERS];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_soc_error - Response from get soc error command
>> + */
>> +struct xe_ras_get_soc_error {
>> +	/** @num_errors: Number of errors reported in this response */
>> +	u8 num_errors;
>> +	/** @additional_errors: Indicates if the errors are pending */
>> +	u8 additional_errors;
>> +	/** @error_arr: Array of up to 3 errors */
>> +	struct xe_ras_error_array error_arr[XE_RAS_NUM_ERROR_ARR];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_compute_error - Error details of Core Compute error
>> + */
>> +struct xe_ras_compute_error {
>> +	/** @error_log_header: Error Source and type */
>> +	u32 error_log_header;
>> +	/** @reserved: Reserved */
>> +	u32 reserved[15];
>> +} __packed;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 0fa786a9e8c8..5ccfc6325a90 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>>   /**
>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>    *
>> + * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>> +	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>>   };
>>   
