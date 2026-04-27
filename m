Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9253FF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 15:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BB010E7AA;
	Mon, 27 Apr 2026 15:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoSSbE3N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EED810E7AB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777302200; x=1808838200;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zui+jVs4HXSytzftgoAq5HwDJMmatYtURW9MfwoC7DE=;
 b=KoSSbE3NehVcAMFFiX5DqIT/OXKUWEgl8wrKwRf3OfTbREFQ4ytPFNB/
 QCTpb+qnLaGLEeEQNF4uXS+CL9vDIxD/9np4RasG5lAdk/Ns/t6A3kW0C
 sOspceJcQV6uNbeJ9JLKLUgfHRmQGQQmhdGDRQg95LcyGiA4Adg6IcCad
 0Ppkk/F9TS2xJAhyq2sOUSsly2Y61RwDGLGZEqm1YOg+PB4YRKhCsTT6y
 mMHwaa69bgedLVCwPUntkHeerTv/mTcHupDBOh4gO4xDOOsbe2pvJAcQW
 Kg7jSnMysox2u2sB6R8Aps7WyjA5a4jIAxsXKA0wYkEzg70sHpRHEcx9b A==;
X-CSE-ConnectionGUID: KB/F20V4QFWN02HrvGZvDw==
X-CSE-MsgGUID: 4/oO1p8LS5ypr8nRUHQzNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89278364"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="89278364"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 08:03:19 -0700
X-CSE-ConnectionGUID: gu2BEs/CQVS2IQiseH6PIg==
X-CSE-MsgGUID: 8An76ZJWT+ifogS2yHQNkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="231022639"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 08:03:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 08:03:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 08:03:18 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 08:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfjQe6N2I3UQ2J4vsatLT19F7A5Sg/khnTf6+oDu4zP3dPfYIxwBzLGqRmgYGUSj+qBEb9qr8kK5VhAXKqtaVQqx3yDQuIvwF/1/KnefktMpcTKGl8phEUGHpXq85jCS+lMagvuLAiIbxRjU/zIDCAsUmRUwZzSL1SEPgDq3b9Bnj0b9BJJnyLg7Pq3eZSxEFLVZxeETmlwHI47QtiS/Qwzu/yWi5BrPUXjEAW+C8mJCqzRzQ8WL5T942DCVpTo4OaTipAPZHFrdh7MNY5FZ4k93O8YSsFFcc6pEqWt4pAqjLL+R403ODNzuVrEyXSQb4CJPKxjvxXNcvpB7Y4faBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ke/2HlEvyFUx0KjeTl9XHhnKgJXH9IdS8P4Ox2rdu9I=;
 b=i+u/F03V3uape25PH7mc/0f87jS1JOg4egcZXJmZRqvxvoQ7dkNV/ZhTD853b4Romu3E1Kn9GhLxWNvo9t0Gprgsj1jP+4U1WmElDTK1UIqIK8EEW5ea6pt0r8gPbc1C5kfzv+VTf1HckSE8lEsCFEzW4tLEKqtZBDqA245eq/STR2NmKYSTahgPOTqsC85K8N2rf2mc+RuOjKj6K07VScnJ6g4l3mbCZxVxpKNm1Jx/kmaKuZnJz4ALkTPPw1ux47ERktpp/oCPGd75TcBSblQCt6zYoeUoyUtMOEkpTjTMxSbbqv+NVuAf5+5Qm65PQ5pUhhyOUHr/tgI7xmfvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9253.namprd11.prod.outlook.com (2603:10b6:208:571::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 15:03:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 15:03:13 +0000
Message-ID: <aa7d04a9-1ced-439d-9135-b95531d61add@intel.com>
Date: Mon, 27 Apr 2026 20:33:03 +0530
User-Agent: Mozilla Thunderbird
From: "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH v6 3/3] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260410102744.427150-1-raag.jadav@intel.com>
 <20260410102744.427150-4-raag.jadav@intel.com>
Content-Language: en-US
In-Reply-To: <20260410102744.427150-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9253:EE_
X-MS-Office365-Filtering-Correlation-Id: 0017e459-52bc-4e70-e952-08dea46e1a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 6T8uoB1ZHr/FgnZGixnIf4dSvt4TEnzKymPpiDdiMYTO9b2qj6ZFr9LjQ8jPRx3b3PMhCQN1DpeID9oZ7wmz4sORCCrj27AM/Gw6qh6M4PeOJZiHnguXzKaOQjSSAuMDQRZrLCI1xwoZ/c4viin/tUu2z7OIgCCdrwa/C/i3LgCi1r2t4IXfENBR6ZaluVknyjsG/UCUZrNGagsIgi2AW3ZdGVOXAm6isYHotKXupp3sDov9tagfVkca2IKacwxAEW90gw2h6VhrDlVPfG6PXBQkDmvC0gmY4B+Zfb4Y8Tim2USiuT0mSudh8Dkij+HPqs0sDX+CcRuKWcH6+Y1HWkxHY0QM5ZIqV5GriF6ILMSgM//cJsgDzCcI4k9jFHKZfdM17nbcSPmH0LCkJ/legOPb7EVUu3Emo3vaC1RVDbKfcttGYo2iETu75yZEVSb6NbKVh23LFzTb5DmdzqMrKKRdUW4/LvugW2sf2pC5xMRvhLD8jF3BXrtcKrd4hJJZjXkWdvf+jaqz8sOTCf/nnnc6fjkQO1QAgBNhWDyoPMVoZJFeSpg7uA6TDD7DS+XdKIlzXY9ie5NJbMlt8IcgLFnM36MwYmliWDarRipfu1dGmCyJCPRnJDTL7UwYheRw2CuNVEdprAiljrW7TGrWv1amzqV9694SIjZLGD+opVkE6LZ8rPy23pE1ougMOfzGRy4DhPHjD0iDRTkhrEyU+9Al/5cU/ghscGsSc0cBxgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui8xOG53a0NFZGRBK0d2V1JKQUZJMzdlMS80QlplZ0c2MitvRTFJd1JBQThj?=
 =?utf-8?B?dm9MeFNiQzdTVU9Yc2hEZnhxTVpSTUZEZit3WVdMa3FCRnRrYXlYSnJaTmxw?=
 =?utf-8?B?dHFGTEJ1RmgxcXppcEhWSXkyN3JGZTg4elJHdXJlNWpwdFdhVk5qOXk4aEJq?=
 =?utf-8?B?bkFpT2xYUWNuMHdHblEvR3VNLzdpY3NDMTNuckVOL1h4cEhaZ2svdk1YMHZR?=
 =?utf-8?B?bHRsQjBGV2tmZFdaK1NZeG9WbnhrL2M5TUUvbHJYcWx0b0xyZzJNbXdZTnZS?=
 =?utf-8?B?MHBzTzJuaGVVQUtnQ0xOY2FoTVVJM05SOFBOVFQ5aGpWNGdaUVNZcndYSjlG?=
 =?utf-8?B?Z0hwaWpOVFpmaE9nQUZwSzFQYk5OQXM0NWJnNGFxUmQvWURRUk9kRXdWWUsw?=
 =?utf-8?B?NDl0dXJtcVRXSXFCdm5EVWdabFU1MStpbGFRdFhXTGp5N3d2VDEySjI4OGZ4?=
 =?utf-8?B?WGVGTTkwMEQ0N2d3cXppeFZjR01qc29VckFJYzYzZWJyeTkyTUhFQ0ZNQlJt?=
 =?utf-8?B?RS8xMmNoNHFqVVFxODhRRnFqT0hReGFCMUN0NlJvNTFXNWtaMjJiaW8rWlZT?=
 =?utf-8?B?d0Q2eDZ4NU5PaEdiUHpPMWdYZWgyMWM2OGh3KyswU094M2R6emlXOXhmY0d3?=
 =?utf-8?B?ZmZTU0VHcVlMVkxRT0RKaXZGVmdLL25EQjlvRzFqcjN2M3NMa0dqWEEyUmdo?=
 =?utf-8?B?M3lkZlhBSHFxYlpOQkl2bFIrRUt6bWN4MlZ4TG1pV2FwZHBENVdXWkxhRlRV?=
 =?utf-8?B?L296cnozTWczU3crMEpreEdBbjdCUkYxUWYyMllOV0g0ZGIrNW9MdlhhczNu?=
 =?utf-8?B?SDEyZzF4bUtMSEtSNWFIeUdDY0F0Qk9JVTIzdlMybUtLNVlrRnpwem1nUkdL?=
 =?utf-8?B?TEV3dHNJdjlldDZITllrMzBMU0J2VlFiblFIQ1pzSWNZUXJVQ0Q3Qys2bXBJ?=
 =?utf-8?B?TXhIT29uN0lveGNRbi8zYk14RXR0NUM3OGJmSnFQaXZPcU1wSjF4eTY2N1dG?=
 =?utf-8?B?bFJRUUtEY1ROdUdLQVMvSDllOXhkem1xNHNYTUhId0lwcWpBNThVTkFQQUZ4?=
 =?utf-8?B?bHVTaFlSRDVHa3VxTUxab25VejdNQ0c1OU9rN1pJTE5NR1VsQ2ZqVmRaeFJa?=
 =?utf-8?B?eVJ0UGkwdzFOYU9MT1k2REQ3dExqQkJ6STBXeDEraExKaVlJa1JFVDYzaktl?=
 =?utf-8?B?TGY4ZGJ5bVgvRnJMZFRoWlZiWTJBdmpNZnJwNk5vRGpYeUdZRTZFeXFIY3VR?=
 =?utf-8?B?MUFjd2kxWDlUN1RydlArM0ZpRUhDNWplazZaU25zc1M0ZG5pUDJ5dmUySFhD?=
 =?utf-8?B?Z0d2UnZMbkxVaS9UdkxsTlpNR05DUHNsMFlkQ3RtenBwTHZ6TDg5dm8ySEdq?=
 =?utf-8?B?VXQrN3l3L0ttSzREZTd5L213eS94M0l3b3Y2T2srNmhqTWdIUVdXc2V6WldN?=
 =?utf-8?B?UUgwK2tZeHhieW5kc2o4RVlvRlRKSnl6UVAxY3NYR3NCU3ZVeU40bHJwR0tU?=
 =?utf-8?B?RDZ6Y0p5bWNtVE9hd1N5VzRzczl3SSs3THZES1kzc3UrZjYzT21NejJWa2Q3?=
 =?utf-8?B?VnZKNW1zZmc0TEhqUmNyKzZoL0xvWlBwVnZWcVFXdXN3czNrYzJHR0RoZWVM?=
 =?utf-8?B?ZDc1bTQ1eWcvRVBndHdaTFVaMkNwR3dSY3hPREtNVHgxWWI2eEI3eXRLNW85?=
 =?utf-8?B?N0JwNHhRTGpBaWhuTmNLSWF3Ny8xSFkxSkwzUW8zNXVOM3NmSmRSVXVQOXY4?=
 =?utf-8?B?WnRJaEpESWNsMTlQTzFuaFNmS05LZ1RLZDBmei9RN1NHOTlNc09uajVKb0J5?=
 =?utf-8?B?V0VnWXFONXFYZXdoZXlJMCthS2N1cUg0Qkl1Wkt0Qnhod2VERHpMWU1pdnFr?=
 =?utf-8?B?SEdzQTI4WHBLYnRpR0JrK0dEU2pEU2FMRHFOZkdyWnIrN0lVOXN0K1FMTlB5?=
 =?utf-8?B?bHcxLzErTVlRT1FxZm5rR0hvdXlFM0VEUjhLVlFUMFk2US95ZkVFbnZLQ1Bx?=
 =?utf-8?B?L0ZjNldVL293MTJmUEltNTVzK1ZqdjZjbDgzazZaRDhnb3JJZC9OOWVYL1Ba?=
 =?utf-8?B?STR5RGE4a0xLaXhBdkM3WEJlSUE2aEp5QnhZb3B1bktJK1pYN0dvT1R0QTRz?=
 =?utf-8?B?dlVrdDd4aG91MXByQklYc1dJeTM4Y2dlaTBnZlg5RStseG90ZkxpVGR6eXNR?=
 =?utf-8?B?Y2hvOXJvTnJsRjh3YnNQemZ1OEo2c1dIZnYxcVdLdUFzYzJZNGJZNkwvRHlU?=
 =?utf-8?B?UDUwNFhwckN1SFlJbWQ4elRzV1RabE9YZ1QzL2JKWUZwcUVvclBjZ3J2U2I1?=
 =?utf-8?B?N1U4bWJTTlpySzJXTG92ZGxOMndLa2RjU09Zd2JQaU1EWWVaT0JwUT09?=
X-Exchange-RoutingPolicyChecked: pDkSmq167Q2uPhkvCF97x6R0x8NHH6Iujlv6n+K64RsChEUHH/xYs5CaM9iwDHliH6ijvPGm1jjWSWoQfSbagd0J/XgrnzfojufsrqD2IHRAs8H4FeqUaF5xk/C26XvhDZho5u5hTYT0x/yYhEnK4C+NIRNcoCZeZK+ElBV0AnDwGixU/keZaSQ3Tk5Oq++B8HQzGGrslazomJu92YDZ7vCVV8w9SWoat8FAYQ4v8oFIhkT3WXxobR5POIecBnCk9VNFAKzHIHzAvmmKZgziBFkp4siBLuZfoKJDaOl+8HVNdyfeIVsTg6kvO45kMMyBIJ0LDuqoC3FFHfZpzf+XMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0017e459-52bc-4e70-e952-08dea46e1a7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:03:13.3553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcw+zRlg7+KVnA1hlrbYZr73qCo8R3hZaoszPLUDk8NBIzN+tUyjnaMy4uhxN0Vru/1Bo4danj3nqszAPqLdFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9253
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


On 4/10/2026 3:57 PM, Raag Jadav wrote:
> Add initial support for correctable error handling which is serviced
> using system controller event. Currently we only log the errors in
> dmesg but this serves as a foundation for RAS infrastructure and will
> be further extended to facilitate other RAS features.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

LGTM

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
> v4: Fix Severity/Component logging (Mallesh)
>      s/xe_ras_error/xe_ras_error_class (Riana)
> v5: Handle unexpected counter threshold crossed (Mallesh)
> v6: Drop unused xe_device parameter (Mallesh)
>      Fix unexpected counter threshold logic (Mallesh)
>      Use xe_device parameter for xe_ras functions (Riana)
>      Shorten dmesg logging (Riana)
>      s/xe_ras_threshold_crossed_data/xe_ras_threshold_crossed (Riana)
> ---
>   drivers/gpu/drm/xe/Makefile           |  1 +
>   drivers/gpu/drm/xe/xe_ras.c           | 92 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h           | 15 +++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 73 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>   5 files changed, 183 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9e6689c86797..0e6e91a6063c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> +	xe_ras.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..08e91348c459
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +
> +/* Severity of detected errors  */
> +enum xe_ras_severity {
> +	XE_RAS_SEV_NOT_SUPPORTED = 0,
> +	XE_RAS_SEV_CORRECTABLE,
> +	XE_RAS_SEV_UNCORRECTABLE,
> +	XE_RAS_SEV_INFORMATIONAL,
> +	XE_RAS_SEV_MAX
> +};
> +
> +/* Major IP blocks/components where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMP_NOT_SUPPORTED = 0,
> +	XE_RAS_COMP_DEVICE_MEMORY,
> +	XE_RAS_COMP_CORE_COMPUTE,
> +	XE_RAS_COMP_RESERVED,
> +	XE_RAS_COMP_PCIE,
> +	XE_RAS_COMP_FABRIC,
> +	XE_RAS_COMP_SOC_INTERNAL,
> +	XE_RAS_COMP_MAX
> +};
> +
> +static const char *const xe_ras_severities[] = {
> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable Error",
> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational Error",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> +
> +static const char *const xe_ras_components[] = {
> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> +	[XE_RAS_COMP_PCIE]			= "PCIe",
> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> +
> +static inline const char *sev_to_str(u8 sev)
> +{
> +	if (sev >= XE_RAS_SEV_MAX)
> +		sev = XE_RAS_SEV_NOT_SUPPORTED;
> +
> +	return xe_ras_severities[sev];
> +}
> +
> +static inline const char *comp_to_str(u8 comp)
> +{
> +	if (comp >= XE_RAS_COMP_MAX)
> +		comp = XE_RAS_COMP_NOT_SUPPORTED;
> +
> +	return xe_ras_components[comp];
> +}
> +
> +void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> +				      struct xe_sysctrl_event_response *response)
> +{
> +	struct xe_ras_threshold_crossed *pending = (void *)&response->data;
> +	struct xe_ras_error_class *errors = pending->counters;
> +	u32 counter_id, ncounters = pending->ncounters;
> +
> +	if (!ncounters || ncounters > XE_RAS_NUM_COUNTERS) {
> +		xe_err(xe, "sysctrl: unexpected counter threshold crossed %u\n", ncounters);
> +		return;
> +	}
> +
> +	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
> +	xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", ncounters);
> +
> +	for (counter_id = 0; counter_id < ncounters; counter_id++) {
> +		u8 severity, component;
> +
> +		severity = errors[counter_id].common.severity;
> +		component = errors[counter_id].common.component;
> +
> +		xe_warn(xe, "[RAS]: %s %s detected\n",
> +			comp_to_str(component), sev_to_str(severity));
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..ea90593b62dc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +struct xe_sysctrl_event_response;
> +
> +void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> +				      struct xe_sysctrl_event_response *response);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..4e63c67f806a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_COUNTERS			16
> +
> +/**
> + * struct xe_ras_error_common - Error fields that are common across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error severity */
> +	u8 severity;
> +	/** @component: IP block where error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier specific to IP */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause/checker */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @cause: Cause/checker */
> +	struct xe_ras_error_cause cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_class - Combines common and product-specific parts
> + */
> +struct xe_ras_error_class {
> +	/** @common: Common error type and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_threshold_crossed - Data for threshold crossed event
> + */
> +struct xe_ras_threshold_crossed {
> +	/** @ncounters: Number of error counters that crossed thresholds */
> +	u32 ncounters;
> +	/** @counters: Array of error counters that crossed threshold */
> +	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 3edde46a9711..c6ea32f3471e 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -6,6 +6,7 @@
>   #include "xe_device.h"
>   #include "xe_irq.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -34,7 +35,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>   		}
>   
>   		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
> -			xe_warn(xe, "[RAS]: counter threshold crossed\n");
> +			xe_ras_counter_threshold_crossed(xe, response);
>   		else
>   			xe_err(xe, "sysctrl: unexpected event %#x\n", response->event);
>   
