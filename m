Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD08210F92E5
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 16:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA9910EAA9;
	Tue, 31 Mar 2026 16:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtJNmIBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475EF10E4F0
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774974287; x=1806510287;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D/Z/6aly364WYhtq2ohUvVvXxupwV0N6Ui0qWL1qjlI=;
 b=EtJNmIBSiaipvirKLBdzR8QF66TSpFnDTuBBPCjOMeN800/zxkRXKWwf
 ewJMwc0dh36MjtQqwLaWgqXr52BloVzTe5WxBaP4opxAMlkENip7adIP9
 fHgnDHvmJJLEUqElDfc8i0ZmnJxbCeXFfpZtwZQB92jYfGko900ijsmrd
 Ucjm9mpn025hBxxFKdkT9P80GAPn5FOTi/Dn7i6FsnHFSVjIFEz3TQiXd
 hch9K9J/Nlpc0bRXlNxmZlC3fVP7bIl6PWmReiZqkXXf2WEIXwdWb8f6E
 ycAgRd/r9K9CcN3drRPYkH43v3P4MN4Gox1jhDku4de/hzNpeuFYaOuZM A==;
X-CSE-ConnectionGUID: pIckiGOOSNagUm+k+ek1iA==
X-CSE-MsgGUID: FfYv3ZN2S1K2D65Wom81UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93576869"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="93576869"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:24:47 -0700
X-CSE-ConnectionGUID: 2z8FN/1YTl2LL4yAPQtxbA==
X-CSE-MsgGUID: X3C54nvKTvW3c95sr9FX0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="226396728"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:24:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:24:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 09:24:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8TPS41RHFYqS6uk3Is70OMzYJCLxq5iOeGWYEDpkoejFs645YDzvsWf0HsQO3+uRZ7CTmtiaQ5Won8n84Vx4n5QeHsMxuJMORJWfgUuV2GCuWQRsHAX/KBuMx570X3wZ8ESu69aR4ou11V5449zdHoUsSSIy1Fwwf4dBkxj4WgcBemaIf47lfZVO8eJWZgDc+RZscdShwt26TKaTpqg4a39DVnx/l3tKaTPmTHdTkRwDv7h+buG7GRY8IHDcB85HBSD/0vzuPixkieXkm2j1HVBOe8vqBLxHXMSps4SpQtH9lNn+HJVorYanXnzlOaY9tCWW6pYuGldPVpRHC5o6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AknVhTQBTNjqBjErXoUSXCmHCM1tPaZMt3toRzBJdHQ=;
 b=dXoW4V0zCVGpRymthEjXXCLMafe31iunGNB4ZkTDH5MqipmPJZywskcN8R6z8NNlGtkZXUymRNaHJpRor8zJU8YMDSEyeiTUgB6rXwAGOyuxlo3/fj32eaBj7yEjQYIFF30QjoG7RzfzxGAv+uobNJb0QadYT3hBz6k2LOmy1njjSQroVXgmOIUP0B01CVX+vZH0kd7DpcyndOBGC8rS2FEtG6Kpw8Y1ImmRO1X2c1Efgk3eG0wqTlyAfhiyfZO09OTEE0T74OtFvExSk0SvaCYn0mtpOuS5vAPPLeg4dxg8bFvooX+mhUKXc7yLChQf6dl1joyec2Yn7A4pCg5avg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 16:24:43 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 16:24:42 +0000
Message-ID: <cbdfde54-2625-4c9b-bd48-2c1c0b63cb24@intel.com>
Date: Tue, 31 Mar 2026 21:54:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-21-riana.tauro@intel.com>
 <aahjUV9VPkT11a85@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aahjUV9VPkT11a85@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 263e06a5-46bb-4f4f-cec5-08de8f4202f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Q2b3zywxdym11VBWjBumy3WmvuT/0GA0Kertgbi/gtVrKwLJHyp4LlcyTHGbdvjnxL+rQ369iXV1WNICGJNwb6q1LU3lrsAQwn8SH/oUwQCsk8nsPpatWpo+DJwwU/Sc50MpT53A3XRKIKUdAAqv5MMwLal3RVtFGdb0EOYRQ5QAHZt58631PMMPl+lCb7RiLcTyk4vHfbuS/3C+9BcJMPjfwERU565629PfpiQANXOLTLA1xrALzYsvNmmWB0k2VWStdVpsCzxARzCzLIflWZdEpKw+KSE9tPpgp3LidXKwgOcGkkFpzMPmT6rFM88E3gMQBd0yK2kFDgtjyxQUmYG6y+Db5ADG5LDyksODs6XoCS18E7H51J6Nw5a5jfz1dt7FPSF+BdaZiKhxL8quDQXGR3kVfi1Goya/4h+Nm8O+No3OQpK0E6JjPfmvpLR84r1a4RUZteD84ztie2E3OYq60Ns3TRIjavhCqLkr0hsr+JuI3hd2t43670x1aHd7ad70+ODtp5Gj6ewcTIQymb3rdosv+x0fnTwtEHgE0+jYDc9spZ8PI7v1dmXdVFzvbpiGXhj1SG6dzwQUdf9OKX5IBtEV4ab2XOKdNK2wfZWWM5yRisWT8Fu2TYm3qr8oUbUcLrTj1sRENX3Lhv93L+Akvi4cMvh79XsO+0hIJjFeeT0hU8dPMNHa4xvth7a8q1wCjnOG6ExbWR2EOC10QU0ZRThtQyoyC3CddMUnNMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHltV1ZUNHFuRmlYbnpwYVZIVHlFaXU0SVBSRWo3NkZLdUVuT3B5cmdLM1BN?=
 =?utf-8?B?ekQzZnk1ekFjbi9Xb3FjSlFVV2ZuellvNkkxTUpGall4S1FqU0pNU042bE0x?=
 =?utf-8?B?NEZyVmJWNlVSRnNkQUVmbE1hazd5aDhOUFRpMFp6dlNLNnk1STc1M2R0Y0U0?=
 =?utf-8?B?Z3RaUkpjSmp2MHU2VzBha1JPblB4VXZTUUJOWU5UUXd1V3g0NE5sZG45K1dY?=
 =?utf-8?B?NmVZMmRwWHJ6NWxhTWp1WWZSdjRSWDdxdGp5dkdoS0h3eDVPZU9uRWwwSVFn?=
 =?utf-8?B?QlIxbTV6LzJ6NmZ3emd1aXEvMjlZaHR0Q0xFR25LdU9MVEVXNFdmbGFsaXZ6?=
 =?utf-8?B?MDFhekJCdXVidldCWExJRXpwVTZTSWtram1FTUtKQ21hbFdmN0hPTTBjYWJa?=
 =?utf-8?B?Y0MvZjB1c3lZa3pEd3hNeDJBS2VBWG9sRCs2cFpVVTFPUVYvb2xkcVErTUdv?=
 =?utf-8?B?SHN3ZUx2cXRPcm9TUHRxR000Uk1vWTFHRG11Zk1SWHdDWkJIZUp2L2Y5RlZo?=
 =?utf-8?B?Z2VOaVlhK2VkbjV4OWgrbmFjWXpxbFlMVitRcXVMUmtGa1FINHVVZzByUGRH?=
 =?utf-8?B?cGc3V3MxVFg1ZE5QaXhBUHRkRnVSWmpQVnpubWpkK0F6VjlqVG9qZ1dOQUM5?=
 =?utf-8?B?WXc3bGR4MERYOS9xRk1aSWpLbDFmNDBXWHpjSlFSRGlPV3FZbWJCZWZuOVZS?=
 =?utf-8?B?UG4vUEZTSk1WQWhoUG5jWUFMUGcwaE1pWEZ2UWhQOUNyb3oyZGlRT1RaYnA3?=
 =?utf-8?B?Wmg3K0J3YUgvZERoQ09lczIxekNHNWFhZ2h2OXRFK1RmTkJSMTkxSmZnU3cv?=
 =?utf-8?B?MnowUndlREJJZXdMTEJtZXl6MnZnZmlPQlZvMFFVd3padTRMZDZpM1JXeVQ2?=
 =?utf-8?B?cGhlMkY1VnA2L21xRTZQb2NaUlg1WG9Kb3I5RXZjNnI0ZS9LSHdNTkMzellm?=
 =?utf-8?B?bERsZW4zVm9VSkwwUzg1RU04Y2Z5NS9aYnhWVkxqL3JRK3Q4MVV5NnZhSk5u?=
 =?utf-8?B?NUt6Z0xaVnZXblhyTGVzb2ZEdzl1SFlkQUQ2aHZzRkRISmE0ZmFuWDNJSDNT?=
 =?utf-8?B?TUJMbEhTZ05zTU5nNE5OYTFsdEN5VHpZOG9JcEF6WU04bktLT1FPMW8xUWMx?=
 =?utf-8?B?R3lQVDBIYmxBaksvbTZLcURFZlV4VG81WnRnV3M5YjZHMWgzRHpVZnFGak9r?=
 =?utf-8?B?Y3JpOVlmQ1RoMnBTT1llc2oxTERadTZWM3pSNTJtaUt3UTZZRkZscEZJY2VK?=
 =?utf-8?B?czRzUndESTJzTllsei82bmhWNVhJdC82bmU5YXA3Smp0S3lNK2RNVjN5dHBi?=
 =?utf-8?B?WjVHdkpVSWVsTU1MbE1NS0YrOXJBcUZuZ2M3OTFaekM5U0ZYcjhES0F6Y3pU?=
 =?utf-8?B?cTRyeEs2S2VjNVl3U2RQajJJOVdaYnhqS2IzazcrQ0JOVk93VlBTQmFZN0tN?=
 =?utf-8?B?YkRyNUVpU3M3QjZORi9CaTJmSWtnRmh3UU5mTTlrbkRNcWhIcy9SU2xTZUl6?=
 =?utf-8?B?VzZFazIzUmpFVy9iZFoveENRWHkxZVFQai9aQzc5NG5zSWk2SFFVWTQzSGNC?=
 =?utf-8?B?MWM5VGZybW0xc0pwSWVONjVzYUVwNkVBNlhQNVp4RTNQWGgyM0pqQXBRb1Nn?=
 =?utf-8?B?ZnB4YTVHZm1yZ2NHNE5ON1pVRmlucU9VNm95S0JHUkc2WldYa2tlNk9Ycy81?=
 =?utf-8?B?RVdXckRqeVhGTHVBVHpUb2NyK1J3OGdZbzJPVWpTYXBCOHF0b0tPK2w2RnFO?=
 =?utf-8?B?bVM0dU14akNucjlITkpaWE5UbkU2alpxRTVMVjNFWi84SUg2N0ZZcHZRdXVG?=
 =?utf-8?B?NzVFT2NySStqUmp0L0FZa1NvajV6bmd4TjNKeWVZTEFMc2lIMFlVMC9PcVE0?=
 =?utf-8?B?b3J1QXFzOXc4dTd2TE9ScTVyNzhvZnRkNGdRTkZLY3lVYkUrYjVabVpUNDRH?=
 =?utf-8?B?azZXTUllSGZxdzZnWk4xVVNYdUl3NWdtR2xzNXFpUlpXMGk4Q3hBdG5LazN6?=
 =?utf-8?B?M25yUmhlTndQblFmTWFlbWl0Y3h2UDFzQUR4Y2xIaTFxekVBWmsvaGFUL0Yy?=
 =?utf-8?B?TkFqN1d0eVlqSnRlWjVENFBLbklZbHJZTWwzRnBrS01TcHN4UHR2L2VwVXk3?=
 =?utf-8?B?am1jN1N6V29FM1pTR3RGMHhLb2tKRXUrQUhMM05ZcjNpSU5OQ1BoNzZoWVpY?=
 =?utf-8?B?a3JSaStOQjZCUGUvVGpUK2pqRDZYQjZtSXlDY2huVmhhaG9CTmpocEluUzhv?=
 =?utf-8?B?WkVWU2w2MG9ZQUpncWJ2NlpFdTc0WUx0c0xQVGFHbUR5MmtZbHc0dkNXc21w?=
 =?utf-8?B?d0p0K1VNUENIVktKM2k2VVVJV2l5Nko0ZkpzdkdFWVd5OVlxakJ1dz09?=
X-Exchange-RoutingPolicyChecked: PZ3sPSUDnti/ZjLW7YgLIWkVwDDudTXF4QC4qzgDArJteeF4U54wldcKu3ig5Vhr/s2mI8RzftftA30emjD545aRpwm9meBSuQFOqDncqzRAmH3VYBUqHf+E0uWHWgBeSMozDeyhZSx8m0VSf3prkvAWFFFJLB0A/rj4+3E5FF34U75oLURCsSSjMxnRQtSBtkK6j8xIhZZPpETZuyE5jqRnoNVi+1UJgPsD8lkscV1I1G4x+/3w9+9f3kSR6aLetInhFM0Yco37np7EbhCOWoWDTVepw0kEVrwW3JhIby1roriWzRkpzZYCmBKz2AzN+QkFqY439OOZKloHJMdTbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 263e06a5-46bb-4f4f-cec5-08de8f4202f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 16:24:41.5690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6pz/uOcR74fExist7TE6Sn/Ch5CK1yHUR/I7W1+/FJ/30M99ceLqEyfsMjq9mvEyFDMAVV5AqZ4aSae/AfsLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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


On 3/4/2026 10:22 PM, Raag Jadav wrote:
> On Mon, Mar 02, 2026 at 03:52:03PM +0530, Riana Tauro wrote:
>> Uncorrectable Core-Compute errors are classified into Global and Local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> A Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without distrupting the rest of the device.
>>
>> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
>> generated and GuC is notified of the error. The KMD then sets
>> the context as non-runnable and initiates an engine reset.
>> (TODO: GuC <->KMD communication for the error).
> TODOs are more useful in the code, so we can actually find them ;)


Yeah but the code will not be in xe_ras.  I will add a comment on why we 
return recovered
for local uncorrectable GT error.

>
>> Since the error is contained and recovered, PCI error handling
>> callback returns PCI_ERS_RESULT_RECOVERED.
> ...
>
>> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_get_error_response response;
>> +	enum xe_ras_recovery_action final_action;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	/* Default action */
>> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +	xe_ras_prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
>> +				       &response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +		rlen = 0;
>> +
>> +		ret = xe_sysctrl_send_command(xe, &command, &rlen);
>> +		if (ret || !rlen) {
> We'd probably want them to be separate cases so we know what actually
> happened. Besides, I think !rlen is redundant here since you're already
> handling it below.
Sure will fix this.
>
>> +			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +			goto err;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "[RAS]: Sysctrl response does not match len!!\n");
> I'd print rlen as well.
>
>> +			goto err;
>> +		}
>> +
>> +		if (response.num_errors > XE_RAS_NUM_ERROR_ARR) {
> I'd handle this as part of for loop below so we atleast have the chance
> to recover based on initial errors.
yeah makes sense. Will add it as part of the loop
>
>> +			xe_err(xe, "[RAS]: Number of errors out of bound (%d)\n",
>> +			       XE_RAS_NUM_ERROR_ARR);
>> +			goto err;
>> +		}
>> +
>> +		for (int i = 0; i < response.num_errors; i++) {
> 		for (int i = 0; i < response.num_errors && i < XE_RAS_NUM_ERROR_ARR; i++)
>
>> +			struct xe_ras_error_array arr = response.error_arr[i];
>> +			enum xe_ras_recovery_action action;
>> +			struct xe_ras_error_class error_class;
>> +			u8 component;
>> +
>> +			error_class = arr.error_class;
>> +			component = error_class.common.component;
>> +
>> +			switch (component) {
>> +			case XE_RAS_COMPONENT_CORE_COMPUTE:
>> +				action = handle_compute_errors(xe, &arr);
>> +				break;
>> +			default:
>> +				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
>> +				break;
>> +			}
>> +
>> +			/*
>> +			 * Retain the highest severity action. Process and log all errors
>> +			 * and then take appropriate recovery action
> Punctuations.
>
>> +			 */
>> +			if (action > final_action)
>> +				final_action = action;
>> +		}
>> +
>> +	} while (response.additional_errors);
> I know we're not NASA but I'd try to have some timeout instead of blindly
> trusting the hardware.

additional_errors is a indication. So will be 0/1.
Timeout is already present in sysctrl_send_command. So unnecessary here 
again.

Also before every sysctrl command we are setting response to 0.

Thanks
Riana


>
> Raag
>
>> +	return final_action;
>> +
>> +err:
>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>> +}
