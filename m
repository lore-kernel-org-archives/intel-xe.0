Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39211C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84EC10E02E;
	Mon,  7 Sep 2026 13:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYA5sIUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2281D10E02E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788789139; x=1820325139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=10c0o82hzCdPLk1g6unSpsrniS4fiQ4QkWWzApvVxfE=;
 b=DYA5sIUBYjqS23OTICjr9ffxox02qebXG/jnU3TSGAZKS62p7/L8R70C
 DP9c6kVZELDDBX1DJ7iwElyV1d6HuOCwXPzW1Mne2F/QINMoiEJjEWirj
 wKRIVz5K3qZCDfq59bqVyxc8Bc9YtbsuVschH3ors++PW6HEnyuEThe3d
 F0jRYaaPLUQEzT6MwJ+h0K9NDq4/csiQixYIBneGb92QIFJAfTUqSFQc1
 tt3t1lKtqz3tQQKV8OM3LIiSViD5wcXbnAuKEGkhgqquhRdLe+eHDl+Ut
 1/OfItv315BQpHHejsFtr/O+mB5hxx07aHysFGFntbMhntlFWXaorOADi A==;
X-CSE-ConnectionGUID: umxkPvpqQpORoBS+828r9A==
X-CSE-MsgGUID: MN3ty9KSTEqUv45r8tEO5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99787827"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99787827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:52:18 -0700
X-CSE-ConnectionGUID: uM5jG3YlTRaY6OjlClP06Q==
X-CSE-MsgGUID: sGIalGysTByjjQpuDXnV5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274519653"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:52:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 06:52:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 06:52:17 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 06:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZjaM4CG1ZPM6olCWyETxP7L8EUTPX7cwMeu0El5L/9AbyKGrZ58ceAlE+usoznBIOzR3u+KBA8+zyBlk4msyEOHdluBMbhvQsS58toH8prqy/FQ1ixz1a+ifdnuK379Fbf3VCN1P4yyeEU/+EHJVSeTqR84GI17m4P0OWHMNcdwYCDhe1Cimsj1TFPD1OXvcCOlAkg7C3tPyvV/XN6vV2bAMM6jA2RXQp8KLyUcyfTStG7MGPwjzPQbEwVWV0rwGeebNfRH/GzIx2JRa+BoyHJC30sXKHRx/6+vStCzZ1r54/K3QsSsRYkSqygNITTNcbuCPo1eqwfPYUOQGtc3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNhNXlEt+w44YsGTTE6ZY6QkdcWBx4OQJu/a7dSatUA=;
 b=IJJDrh46o3dIL5BEI6TG/ssFLUzp5vsHJf8gUAT3NPNsxdOL0n2/28rIoEoDcuJsdghiFqkJ9b4DPke7T+I7nOGXZ+tHsIEmlQGksnJcDQ6Qqy5O2dw39MdGNIWRZHWmxitYmZIgaFGai/QUFHZI7fwZIGevxfr0Soxfyb3rojRno9Z+mBcIe/y94aALa/roZ9z1ZpPMJB9+KasGixLc8n0kwRFN2Ucgwpm55l0tiAXsx7tLiPk2Ur1oqYTWELEDvvWQTNUGyKFchASJCCEz20mG0JZiPziTx3Efg40p90meLgNgJKwpaz1/GFz3GesFRi40tfncBy+9tw1zcLQchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB9806.namprd11.prod.outlook.com (2603:10b6:510:3c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 13:52:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 13:52:13 +0000
Message-ID: <bd507d1e-5d61-4d73-858f-1f44f37431c6@intel.com>
Date: Mon, 7 Sep 2026 19:22:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
 <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
 <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
 <e37b716d-3fcf-44b0-993c-70b39fe59951@intel.com>
 <d76a1ee0-7317-4cf5-b521-46cb9998fa88@intel.com>
 <f3d29b84-0849-4513-9a55-f6861e92c076@intel.com>
 <9d6388b0-ed43-4210-abee-62c6ae3ed2a5@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <9d6388b0-ed43-4210-abee-62c6ae3ed2a5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd5421d-b503-4c32-a699-08df0ce73853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XvVSLoczHldGdq7YMvHRAcUAexDDhE2uY6vOVSERBxi8ScCR8XCsoHCsh2zdFJ7lNeu4i3NCZgggvUmjlgbIYkxRw0iEoayDS6UYYHkiHbwgWpNKkGhFXo7QNw4dXnpKvu36lHG1IstFDz6d4JD24PsLwcy3AiIRiQ2E7zbNnBrjYPvwFQQqZXlXrTP1KesPSni3Lc4CFf3o2vvZC2WzZVoaMSQbOEzpa2tzda76rPIVAfBpFUt9B2jh4vyFzo4NY4bEApEkhG8jFpGhGHsTXlErx1/YgAKWOjGF5p9eXpgt7xCkgyrG278/6AnNcMJMLZDXvOl3aMr7U37eQADfe8f7wJY+wXWtKIiZgU10gvSK9DTDpsx/IS1nxKOiptUL/FekjijxMUs3aLLNkCDOn9SbrCkf1dt5jhAsqfFsvNFP1bJzaxmfTllQwQl0q9rPOR+r7Oyg1cf3Ole1tQctpYzFlEktUBH/i4o3SfsEvNt/vGtOBrYvopPu50aVRPgFJC8mlFniF/k7TvfFfRPrynXDHPfIrrw9WEz5JVJ9F7Hpgf4q3IZmeabhPXRSdyTpfYrwzUJQpX3KSzoZwJh080jzaGB0JD4Z0dLe082rX7D7GcwgyUe2rGF2jPkBRboduu/y7/stohVZ8YklK8uOO15uzwwh1rqbbX6VzG+6NXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0hIWTZPaVV1Rzg2emhvNlVCbGNyVEFmQ2ZZUlphc2VkblNDR0RFUFhoWXZI?=
 =?utf-8?B?SjlGSHdWYjNtRnhvNkpvaTQrSlBDZm5GdWFubklQQ2lGRG8rYitPZXQ3M2lS?=
 =?utf-8?B?bzI3YThnNzNjMXhQMUFPQnorb0x1Tk8xV0V1L3hkamNkVEtBOFRKWTBSc2dM?=
 =?utf-8?B?Vm9CKzJEMlgwek5lQjJZcEFZOU1sT1lZVnRUZkg0Qlk4azBaNW9yRWZRcFh6?=
 =?utf-8?B?M0ptZE9aand1TFhobGI5TEpxeDdtMCtZRWxnd3o5T3dBQjRyenpzRWZOMHB1?=
 =?utf-8?B?K3hBSTFsYkZaWVRaL1ZSZmlYc2JXL25xdjBTSVg5djBWMTZRUmtwYW4rVmlj?=
 =?utf-8?B?N0lOYzBkYkUrdjl5cStVcUo2UU9vVWEwT1BhbG9uZEFSYlNGd0J2UXZPU2h2?=
 =?utf-8?B?b3M3dkluRDZPb2hhRm1VdWdZYTRGKzcxdFhhYVlndUtIQ0FBUDlCNm8yMkp5?=
 =?utf-8?B?YjAyT3lxVDFRZHBnSnpBTFlYZGFzM2NxSGhTTmQ1U3lVVHJZRGZ5MndiaWlj?=
 =?utf-8?B?YUhMY2J3dmhDNktBM21uTEZzRXFRU0hhWGNvL3VhYVo2azJDSllvbGIwaGxN?=
 =?utf-8?B?S21BcXRSaWVjalhTeS92cEQ5VmpwN2xSbklmT3lYTlJBVS9DUlVENjJWZzk5?=
 =?utf-8?B?U0Jndi9xc2hQMVp6WU81cXJ3QVF4M0R5a0tvL1JmNkZGVUEwYVNSTDlaeExi?=
 =?utf-8?B?Wld3cW96Q2JkbGRDRHJ5bFlQZUY1OGcxMEkzMllkbVBybGIzRXRQUloybnZO?=
 =?utf-8?B?V2ZTNDgyMXpwb0N5SEg4WE5QZGpPOEJ0V21pa2xjSmlWYTFjZ3FiMUVERG5t?=
 =?utf-8?B?cGdHMlp3YzN6QXNhYzZjR2xGOEZXcE04Tnk0TzZKODR4cWpJWTQ0bTM0OVFa?=
 =?utf-8?B?ZVJGazJsK3J5UmdoOWNUazFkc0JjdnlkSnRNcDdRWXB4cTVwbXJlV284VHFm?=
 =?utf-8?B?WmlKVlZWcVNtT25KTGdmd2dXVFM3MDBnVkUzREhtVHRUNnZ2bWtTTXJsRnE2?=
 =?utf-8?B?TXBFdjZHN0JmVm5POFlmanpkamNwaytDVHp0YUcwQVFYVEVNTHkvQk1IMncr?=
 =?utf-8?B?TmRMR2pERzY2VHRSKys2amhycDBmV3gxZERFZHpwcTMyTzlybUR0S0JxZyt3?=
 =?utf-8?B?RTNCSm9rbHNXREpFam9vS2R4RWNsNEpnVHhTb3VKalBaenR4QnZNNGNxZWoz?=
 =?utf-8?B?TG83ZlJ2Si9za1g2eHU2dFI1QlhpVW5GcTE3dDJic3I2K2NqY0xPbytoUzJu?=
 =?utf-8?B?Q2t3OTlSaEZRNWtQRFVnN0hrV0NSMzNLdmVDNi9NK3BmamVMcEQyWE80cVFT?=
 =?utf-8?B?dEx2VHQ2WkRwck9UUmt0MEg3L29NL2hEcExFUGNJbGNhRVBEVFg0OXpDNVNE?=
 =?utf-8?B?VElDV2NZQ0wvNlFzbnZScldET1Z1Wkl2SEpnSm1yM3JqSTFHK3BtTUxoYnlM?=
 =?utf-8?B?eEsrYWdhNEVjQWpoU0VZQkhZcmFzSkxuMzVOM2psdlJlVmE2cTVzMGU0YlJ3?=
 =?utf-8?B?bnl5dkQ2TzI2NWVTdGVXOHMrM3JYU1ZrZDdtaUQ3dU10a0tzYXlSaVJCTDhI?=
 =?utf-8?B?QUpPazJKUUNNbVd3WENaZk1nTXVOYVFqbDY0M3BoWkhjTUoyZDdockhaSTZD?=
 =?utf-8?B?bGhmbUI1cHMwK2VSSXRjaEw5emYrWmJUL1FadlA5aWx3QmsvajU0RWJxV0hr?=
 =?utf-8?B?dnpubzQwSk1IN055VEY2T3MyWXViU0R6d0dETWJYNzBrRmZtUmlyQ1FVZ0Jw?=
 =?utf-8?B?WU1PQjAvT2NiMnRPRnRVR3hTQjRtNFIvSmlIeFRPUUtodGpnUXp0M2h6Uncz?=
 =?utf-8?B?S0RaVTh2T0pLRXJ1cUxiYy9WUTh3dFdGYW92ZmVmMlNwdmsxR3J1Skp5dmU4?=
 =?utf-8?B?UjNQdXRaSTg0WkN5U1dSL0RYRjhPZGFPQ2hBUzJtd21CUmJGZXFGR2V3cE1o?=
 =?utf-8?B?c3JadlozYWo3V1BQQWpRdVZQNTJHQ01WUmtZMDRCUUdWV0VEYjlEUEtiZkxR?=
 =?utf-8?B?WEkyUzZXNXo5Ui91cFAxMlhtdk1GRElYaGd3YkFFUjJsRW51S1Jvak9ySEJW?=
 =?utf-8?B?UnFZaWRzZXlhazNYS1MxdlRtd3ZleE1PU2hnWkFHZm1DSzRETGRxZmpYSlZu?=
 =?utf-8?B?Y1NHZllrSDNvQzZ2YTEzQ1ZDTFdnS0N0MXh1WkEyZ2RSdUhCOHF4VmdhamtJ?=
 =?utf-8?B?MVBYNkJsWVhNYzk1V2kxVmpkSUdqMmxJbmN6c1RLanpBRGFEK2tSMitmMVBo?=
 =?utf-8?B?OVRleWZaN0FDV0lPekQ5dkJjUlN3Zys0UUNQU3gyMHJnWnZmcDFrelVOODJq?=
 =?utf-8?B?VlZFc1VLaDc3cUw3MmpyZ1R6WGVvT2JyOXg4SG04TUtIODRWN0lsdz09?=
X-Exchange-RoutingPolicyChecked: qpZxiSpkuvmhAC4H/pKVuaVvt26fTcvQN1Sw7IcfUqL+zxH9sqVmBxxuI/7Qyn2WfvqkcczvJB37E1PMAzO7h3rXmRNDvz05vlHwPRqW1wnm5F0EdPGl/s5g+Jt7MOA+9WX5EXmViKJWSoNXQ9GtIfRIWBsCnCJTEWcjI6LUG6fcvZLBXzsaelkBxx1Yxy4eG7AVeXMXAnEYoA39a6JkTvBG8FKMCA30Iyqp7W+GL9uR3ODv9Um8Yctn+VGOXjibTiNnA3t5kcqUTv5yJoK8+a3lNTkyf8dCpcP0kwnU3Psqd66ivrTcARhlrapAx8W+5jFRTndp7w8rydaGbnz1nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd5421d-b503-4c32-a699-08df0ce73853
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 13:52:13.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOb24+DwGK1z8C4lULfun1m9LqQbV/sZGB10yLyVrc+vitI7Yi9lc85zieo5CA7QAEJFSC8ONvvhNMUur29V0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9806
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


On 04-09-2026 17:27, Michal Wajdeczko wrote:
>
> On 9/4/2026 1:11 PM, Tauro, Riana wrote:
>> On 04-09-2026 15:48, Mallesh, Koujalagi wrote:
>>> On 04-09-2026 02:36 pm, Tauro, Riana wrote:
>>>> On 04-09-2026 13:55, Mallesh, Koujalagi wrote:
>>>>> On 25-08-2026 01:05 pm, Tauro, Riana wrote:
>>>>>> On 24-08-2026 16:34, Michal Wajdeczko wrote:
>>>>>>> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>>>>>>>> Hi Mallesh/Michal
>>>>>>>>
>>>>>>>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>>>>>>>> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
>>>>>>>>> and update callers to use xe_log_err() with the propagated error code.
>>>>>>>> Bit confused here on the usage of SIGID. My assumption based on documentation and discussion was
>>>>>>>> that SIG ID is only needed for error logs based on severity and requires a resolution which can be documented.
>>>>>>>> Am i missing something?
>>>>>>> from "How to pick a SIGID (the uniqueness rule)"
>>>>>>>
>>>>>>>    * A single underlying failure therefore legitimately produces a
>>>>>>>    * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>>>>>>>    * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>>>>>>>    * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>>>>>>>    * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>>>>>>>    * follow a fault from origin to final effect; it is not a duplicate.
>>>>>>>
>>>>>>> so in this case, some sysctrl timeout may eventually lead to a reset and/or
>>>>>>> wedge and/or runtime-survivability-mode, and this intermediate FW SIGID may
>>>>>>> help in any postmortem triage, and if we don't reach that final state then
>>>>>>> we can still provide some generic resolution based on site and errno (COLLECT)
>>>>>> What if the paths are also used in non-critical scenarios for ex: sysctrl commands are used for
>>>>>> general counter telemetry, gpu health querying and firmware status.
>>>>>> Wouldn't this be lead to a lot of sigids in dmesg in case of some unrelated failure ..
>>>>>> Why not only add sigid for critical paths when we are sure it will cause a chain of failure
>>>>>> instead of these prints on every trivial command failure.
>>>>> Ops I miss this.
>>>>>
>>>>> I agree that we should not add SIGID for every minor or noisy failure. The intent is not to log every non-critical cases,
>>>>>
>>>>> but to capture important intermediate failures that can help explain the real root cause. If we log only the final critical
>>>>>
>>>>> failure, we may miss the earlier cases that actually caused the issue. That makes triage and postmortem harder, since
>>>>>
>>>>> we lose visibility into how the failure occurred. The idea is to use SIGID only for meaningful failure in key execution paths.
>>>>>
>>>>> Even when these failure are not fatal, they can provide valuable context, make debugging easier and reduce
>>>>>
>>>>> mean-time-to triage (MTTT).
>>>>
>>>> Suppose a user uses invalid entries for gpu health or counter management, won't we be polluting the dmesg
>>>> logs with sig id and cper logs unnecessarily since these are not fatal.
>>> No, we should not emit SIGID/CPER for bad user input  or invalid query parameters in gpu health/counter management path.
>> But the system controller interface is same for all where you have added sig id logs. A failure in sysctrl_send_cmd or receive/send frames will be
>> displayed in general non fatal cases too. And it could be due to invalid request.
>>
>> This is not a call chain that leads to a critical failure always. Need conclusion on this because one of my patch has a similar condition.
> we can discuss what to do in case of explicit error (failure) codes returned by the FW on specific commands, as it looks that unlike the GuC, such errors/failures could be caused by the invalid data provided by the user.
>
> but IMO if the FW sends corrupted frames, which I assume is a part of the low-level FW communication channel, or we can't send some random command to FW - isn't that a good indication that there is a problem with the FW communication that should be reported?

In that case, shouldn't sigid be applicable to guc, huc, i2c and all low 
level failures.  What would be the documented recovery mechanism in case 
one of these fails especially if it is a one time occurence?
Wouldn't this approach result in excessive numeric logging and sigid 
being used in the entire driver ? From what i understood in the initial 
series and mallesh's response, this was meant for errors that require a 
recovery
or fatal errors. Am i missing something here?

>
>> Riana
>>
>>> These are usage errors, not real device or firmware failures.
>>>
>>>
>>> Thanks,
>>>
>>> -/Mallesh
>>>
>>>> Thanks
>>>> Riana
>>>>
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> -/Mallesh
>>>>>
>>>>>> Thanks
>>>>>> Riana
>>>>>>
>>>>>>>> How do these errors indicate the need for a resolution.
>>>>>>>> Do we need it for all kmd logs with components or for errors that need a recovery or can be recoverable?
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>> Riana
>>>>>>>>
>>>>>>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 ++++++++++++-------------
>>>>>>>>>     1 file changed, 13 insertions(+), 13 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>>>       #include "regs/xe_sysctrl_regs.h"
>>>>>>>>>     #include "xe_device.h"
>>>>>>>>> +#include "xe_log.h"
>>>>>>>>>     #include "xe_mmio.h"
>>>>>>>>>     #include "xe_pm.h"
>>>>>>>>>     #include "xe_printk.h"
>>>>>>>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>>>>>>     #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>>>>>>>         FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>>>>>>     -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>> -                   unsigned int timeout_ms)
>>>>>>>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>> +                  unsigned int timeout_ms)
>>>>>>>>>     {
>>>>>>>>> -    int ret;
>>>>>>>>> -
>>>>>>>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>>>>>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>>>>>>>                      timeout_ms * 1000, NULL, false);
>>>>>>>>> -
>>>>>>>>> -    return ret == 0;
>>>>>>>>>     }
>>>>>>>>>       static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>>>>>>>         struct xe_device *xe = sc_to_xe(sc);
>>>>>>>>>         u32 ctrl_reg, total_frames, frame;
>>>>>>>>>         size_t bytes_sent, frame_size;
>>>>>>>>> +    int ret;
>>>>>>>>>           total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>>>>>>>>     -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>>>>>>>> -        return -EBUSY;
>>>>>>>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>>>> +    if (ret) {
>>>>>>>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>>>>>>>> +        return ret;
>>>>>>>>>         }
>>>>>>>>>           sc->phase_bit ^= 1;
>>>>>>>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>>>>>>>               xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>>>>>>>     -        if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>>>>>>>>> +        ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>>>> +        if (ret) {
>>>>>>>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>>>>>>>>>                 sc->phase_bit = 0;
>>>>>>>>> -            return -ETIMEDOUT;
>>>>>>>>> +            return ret;
>>>>>>>>>             }
>>>>>>>>>               bytes_sent += frame_size;
