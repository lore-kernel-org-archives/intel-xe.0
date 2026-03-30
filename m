Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A95FF494F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 12:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3968510E605;
	Mon, 30 Mar 2026 12:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bId42Myj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A365A10E605
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774875406; x=1806411406;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B+pHc0kjkewfvYfS37MGzkbDmW97U8USjDDg1nG4tRQ=;
 b=bId42MyjNfKT44XkS4aTrPrDBpaaVR9xJGZrO8Qkn7VICLyrU9mjM742
 OSLroEMqjBo2CDIXWNvqtUXptM0k+wDZF27BPCvfXYEPuDN4ewmxY46bz
 cbWEfwEAMjs+R+dk+yFs+9toE29mjPYoAaDDMSlt9DHQ5Ile2f9kFYb6i
 1mH1ptlUGtkiI+RT4yfMqz1+9RqNb0T8q/xyBIpOr3TK2+aJ6IM1J0cqW
 85IcNGxtJAuf20KpkoI/6g9u+0VRbWyvagOSTuWpr58mwkBx8EhuYBOaM
 aSz8bU+K9j8P66XgniL1lTVZbCS0yOD/Sd3PGOGJsB6RGABVLgEdZfa4r A==;
X-CSE-ConnectionGUID: pX9mHO+tQd637SOzBgdt9A==
X-CSE-MsgGUID: qt2bACs5SNuop62z+70ePg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86169259"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="86169259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 05:56:46 -0700
X-CSE-ConnectionGUID: rvXzOlWmQXawgA+piK8hKQ==
X-CSE-MsgGUID: /otuCH/nQruIn4cb+mdRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="219407788"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 05:56:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 05:56:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 05:56:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 05:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4wPn/tz2lz7+nkWyjJl7WlOtqy4AUxt/A5BKzECtuKR0xPcrshEE3fzF/4s2N9zIuBoswQdgigu7LfDg67JzgsxRvN0lZJMuiyN570tRO1YZKkVQPt/7K8eETo7231yePz5g+3VvUhrnOnhbDoC6dFpVs3ibyw9G8RCUf1J+U0Y1TRVgHicvFghwzqC14bFDbD62w3XGCdwa0voAYfVrZIR1C7ExE3iVXkWdq/pqbeoiIfZB8Q1ZUT7kImjQCkx51mWNacphl2vs2qLIon0usy/y+3rJJmw299W20NOKXhvaJqeuGWJl3mt7E3Af0jxJuugXWnWmWi568/xTGPhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz+yFcF+PyMgIKyKYXsiQcJf5WC1U5iLK7mCec+qcug=;
 b=hXhIwO27nlEq6rerCbv98RDapOA1laZo+vZM4A/3PIjv14XV0EmFifctuJFZ6KVQF73PuZbAzat/idnbpg5wQfBaCMunm48aP3k6qFr0B44lUeKZhEPk0cVsFKxWRv+pB2kyE6VEF/mXNYsJfRg4zYF3Tqhwu4jpsuoK9ENhP7E+qt3cBQ2+JGa4h1+fIeSE8+wX6PGF59V7jQ9u/0uI9SguvaG8dRr7hWlbgNOlD3brLCxhIPBb9wAtrZQm9Dv1UPYuOSNX09a46LODRsSn5KVw7puCHB2Dsogr5OdrNN54l7OYHDYM6WxPt7m9BD1e0cO/b6Xy+uVmFP+ygTmgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Mon, 30 Mar
 2026 12:56:38 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 12:56:38 +0000
Message-ID: <0e935641-1e96-4e75-ac44-21ad87bb57ea@intel.com>
Date: Mon, 30 Mar 2026 18:26:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] drm/xe/xe_survivability: Decouple survivability
 info from boot survivability
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-15-riana.tauro@intel.com>
 <aaXCL5mABQdwlG_X@black.igk.intel.com>
 <8f5dfe3d-e390-46b5-909d-4f437ba81fa3@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <8f5dfe3d-e390-46b5-909d-4f437ba81fa3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0168.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: b67dbe1d-62e7-490b-3e99-08de8e5bc7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ELH3sVhGdEoflgWXGFcxeUZqeIGi/slNqmeC2eh9dl5MxgalTj9N23Xu1uc9dNxNbcJL+S1Ds0SseL/96Zj6+QznQHB1H74nmXzYGnk2ue3jNzU+HfanVBOAUfN0hTGOWgkb8tfNad0/Ib7J0kVhNcIu57c58d+wa7KfDrYNJaE63R5jIjOzvFRPqBFaV0C3kvt7Ntq6EjNJD/+BoSU69mUkP3VvVOYTZ83KV2K6GYRZgggWzxJYcxlINCbs/CGj9vPinJ0m+MvwvQQA7z/OoGOYRbKuuAPgJHLqwHdtJ/OAo0In3Iu5dwjkPch2pVAG9d4jshK821LHJr5eArQH4CAHBnZkm9zDx+nEo1swM1Wl7fUWvEL5n05ExfX4c8f3QOkt+2y3Pd9jLlTj7LQR07jrLuqmMY2eDpgJmsrLHRko27oA5RmZZ+IO/tKp+ZrlA55cIpKes+R1tbsSXOCNdiqTSCKtgTxM6GBUYDZFYIgLVNig7SJXYcV9AXeYfKLANmCulIZHs55Cv7cBVp7rUfvDsnJZjnWITGXrDX3pl3ou2phXIz1ssTrMclq/B8AX97cVCcylTi5ShI6ZW8FgAiqC0qMYejz39pdHSFNiwVhVlu6nQGovm4PfzmJlSCbBNeBPhhPmv/yDiXtFKjG5pMEP3FFwIkKL5x4L2QJ4mx1uyxtn/TIwovLRMgHrJKZ3dcHkdjaf47VUzGhPLWR7a/Uhw/3xAteUteFR44/ZnU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGZqUW9oMkZZb3RVckFkUWg4eDF2VThpQmRhUUg4MjdFbytZemdxT1ZQdXlq?=
 =?utf-8?B?YWdOdHNOOUl3RlEzeStDL2JJb2VOMDUwZFRGMXpuaVkrcjRlcEZpRUxObjBU?=
 =?utf-8?B?SFErYzNBS054NjVjN1Z4U3F5OVJzR2gybFErYk0zV25WTk5lUW9tN3FwYkQ3?=
 =?utf-8?B?Y3FMQmJ6Z3lQNHpFbGNhSkhjOWhHT2xQSExIZHcvTVRsK21pNmltYzV3WW5E?=
 =?utf-8?B?R3FJQTdJbHZGWFk5VlQwblBTSlNldk12dWFrT1kvdSs3R3JBUzZ6SEFQS0d4?=
 =?utf-8?B?WkQyTEtabnZWVkVpMlIrdFZPWXhLeEMrdllmWFlQOHZDU3AxMUVXcXpwMGR2?=
 =?utf-8?B?d0hBYWZadFAvNVBjempPK2NHbHFTdmVDZ1ZvdWt0TDg5VXoyRDBRNGZ0dlNB?=
 =?utf-8?B?NXhxZUgvVWpUcHVlcGswQUQ3NUo2Mm5jRjVNQmFhempJS1NVWjNGZ09YZXhz?=
 =?utf-8?B?V0UwcDZzeEF4T285dkxFOUdpN2hUVFloUzBRSlNxS053TVFuWjJXLzVFeURi?=
 =?utf-8?B?eDJJVmtyV1F6ZDJ2ZEo3ODl1N1FWS0lJd1VwQWdrMmhLQVFqM1dDM2JMU3Mx?=
 =?utf-8?B?QVkrRFlsVS9XbzZEbEMxKy91ZWpPTCs0VDRjRUk2dFVmOWp2bDhwNVhrK2JZ?=
 =?utf-8?B?cGY5S1YxL1J2ZEUwb2IwSkxsdXdMd1RuUnlpQkwwQ3lLVWRDR21UQTVXejRI?=
 =?utf-8?B?YU5MOS9PR1hhTTlmbml5WUd6bWhKVmxqaHppKy9MY0gvYVVyU0J3UFpCQVNt?=
 =?utf-8?B?RHY0UDVPVWozamNFUlJKcjdBckxDd3FhdHEyRVZNZnhRZmRyaENSOE9ObDRC?=
 =?utf-8?B?QkVwMnY1VzBOMHNHYWI4bE10aUN6enEwTGluME1yYkx0clRwcFhVR2dOaVNW?=
 =?utf-8?B?ZVVEUWlPVzQzN2UrV05WZUhrL0V3ZmtjOEF5Z3paYTUweUFJeFZuOWdCdFpW?=
 =?utf-8?B?QTdRaUk4K0cvZ0J4RkpNUFdXaURLM3ptNG5LOTJiTEYxNVprUklIa0haV0Fu?=
 =?utf-8?B?VlR6eGRwQXo5Z2svN2o2d2lLNm8zeGhWMlppNXQ0WTY2YS82ZHlieGNjem16?=
 =?utf-8?B?MmZSZDI4YVk1bXlXREt4MjRlbnh1dUE5eFF5UkxGbWxDVjhKTkUrQVFpa0JH?=
 =?utf-8?B?M2piK21hRGJoYVlkMnJCYXBsVTBHbUZrNW9LRFl0QkFWblZhOXVJQzQ0ME9x?=
 =?utf-8?B?dXgvbTlxSUVlam1Wb2xLRGtsWmFtS1hSNm4zS0lPcUxyWC82Y0crYzhHR2xW?=
 =?utf-8?B?ZkxNdHdUekx2Z3I4Y01BK2VUMml0cGE2MGVVd3ZUWXhwM0JHTnY3TjJ6emc3?=
 =?utf-8?B?TXZsK2N4WGFyaTVqNC9FbjB5R1Z5UDliZnhjMGd1SG1zK2FHTUI1MEZWV2JW?=
 =?utf-8?B?Umo2NEFoWkZWQWxFZ3ZJekdFTG0rNisvUll6ekl6SjUyNVc0bmt1eFdpS0ha?=
 =?utf-8?B?QmdZdGY0S2NITU1IV2lCUlhHMy82SWE1aFpSUEZpZllteGlXSTB4L0pvdnpr?=
 =?utf-8?B?UDN3VC9SZmhjdjJuTzdIdjJGRlo3ZFFRMzQ2SzZkN3R2VHZzSWZaK3YvVWUw?=
 =?utf-8?B?NmxFT2kzR2ZWZ1VGVFJjdDh0SUZHR2VDUkprZlFIZjlzeVNLK0FmWVpTYTNE?=
 =?utf-8?B?UWpoWWZZbmg3U0lFOUNaUGtLOUUrMjRXODRhWWVmYXFBSk5ONTl3M1Fiekc5?=
 =?utf-8?B?VEs4VHdVWXBlY2FDaEFlRXpjQUV0QlBWU0diTW1ZdlFreWpnUDNINTNOSVJ0?=
 =?utf-8?B?QTVhaDNDcEZmcWJMNld1Ryt5S3VtTU55WEFmZVRLNDIxVVREQXdUdUFadWQr?=
 =?utf-8?B?ekZFOU9rUVFRUU55UEprZGtVYk9LMGpjTy9uM0wvSlhRQnhJZDgrU3phWVF4?=
 =?utf-8?B?d0FOd29QaTQ0Ry9DYWozT2s1SEtKOE5Palk3QVgyUm1HeVhHUVBBNnlWR092?=
 =?utf-8?B?TTlkTERUVnFKOVUvWm0yU3I0MEhXc3lNNmtzVG1zUUhkZVhZZUYvenFxdC9N?=
 =?utf-8?B?OGU0dFMrUHJyWDVDS3JyRlJ5M3luZ1JEdVdraG11QnZQcTBCcG1rSEZQQzRs?=
 =?utf-8?B?a1pqc2R6Nm1xaHlPeS85TWlCUGdBQ3ZZRThRQVFJa3hKazFFMVZ1blFQWE1m?=
 =?utf-8?B?aDR4NGJNcjlYUHZQa3pLbGRuOElvMllsbFByMm9OTDc4ME5xUHE2VGc5c2Zr?=
 =?utf-8?B?TWhaYXRBUmtZZTVyQTJLeUJaWi85RkdMTVlBcG9DYXl6UmFLRlpOS0lIWFli?=
 =?utf-8?B?UWtOSWRrenUvZWFjbnlUYm13NkZMRWI1NHYrTGNyM2RwMi9nNTdoRFZkb3Ey?=
 =?utf-8?B?bUx4SE0xS0lXVWNhZnNuNXZEaWZFT0lvTkkrUkxLenVrS1VOa3Bjdz09?=
X-Exchange-RoutingPolicyChecked: cQMmdwRGRGa2kwm9ZXDCCZEvzZ0lhy3v47xyXY3dYObTEpgn5mQDQY5ZCO41+861GGcT12XkeTJUxSR20SDAW7fp5SaPRjrwpclElv6rXUlA5OwviT776Vw6Ex6O8mPNq/PVV5YJz99eeChkReJpWSL0UUHcvI68VoLaLTlyS5hnFYS3yH43L4AQEEmWA98m/9m7aEkt/nepxycsaa6IN/KKT8ZRzZSQMT2jcQs07DmB/hQEt96mwRrRgjaUACtrEdABaDF7lNh5fdIfJ1PVIKigkOfYt2c33s2ily88DjNy7qE9mrx2T8pEUMdrf1EVr8ea3XfLUbjpkjV3G2fWZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b67dbe1d-62e7-490b-3e99-08de8e5bc7e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:56:38.2781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQJIpmjB+uNuzox/lIRgHoRd91HzzmpxmGAgC5NiPvvMDqC+bRAx+D016FNcZTRgHiUohXbSbsOgCHSDCCRmLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
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


On 3/3/2026 1:48 PM, Mallesh, Koujalagi wrote:
>
> On 02-03-2026 10:30 pm, Raag Jadav wrote:
>> On Mon, Mar 02, 2026 at 03:51:57PM +0530, Riana Tauro wrote:
>>> On CSC runtime firmware errors that requires firmware flash through 
>>> SPI,
>>> PCODE sets the FDO mode bit in the Capability register.
>>> Currently the survivability_info group is created only for boot
>>> survivability.
>>>
>>> Create survivability_info group even for runtime survivability to allow
>>> userspace to check FDO mode sysfs.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 12 +++++++++++-
>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c 
>>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index db64cac39c94..70feb192fa2f 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -98,6 +98,15 @@
>>>    *    # cat /sys/bus/pci/devices/<device>/survivability_mode
>>>    *      Runtime
>>>    *
>>> + * On some CSC firmware errors, PCODE sets FDO mode and the only 
>>> recovery possible is through
>>> + * firmware flash using SPI driver. Userspace can check if FDO mode 
>>> is set by checking the below
>>> + * sysfs entry.
>>> + *
>>> + * .. code-block:: shell
>>> + *
>>> + *    # cat /sys/bus/pci/devices/<device>/survivability_info/fdo_mode
>>> + *       enabled
>> Currently FDO_INFO is defined as (MAX_SCRATCH_REG + 1), but I couldn't
>> find this case in survivability_info_attrs_visible(). Or did I miss
>> something?
>>
>> Raag
>>
>>>    * When such errors occur, userspace is notified with the drm 
>>> device wedged uevent and runtime
>>>    * survivability mode. User can then initiate a firmware flash 
>>> using userspace tools like fwupd
>>>    * to restore device to normal operation.
>>> @@ -296,7 +305,8 @@ static int create_survivability_sysfs(struct 
>>> pci_dev *pdev)
>>>       if (ret)
>>>           return ret;
>>>   -    if (check_boot_failure(xe)) {
>>> +    /* Surivivability info is not required if enabled via configfs */
>
> Please fix typo,

Will fix. Thank you

Riana

>
> Thanks
>
> -/Mallesh
>
>>> +    if (!xe_configfs_get_survivability_mode(pdev)) {
>>>           ret = devm_device_add_group(dev, &survivability_info_group);
>>>           if (ret)
>>>               return ret;
>>> -- 
>>> 2.47.1
>>>
