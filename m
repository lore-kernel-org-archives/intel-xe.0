Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF7CCEFC37
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5F110E17D;
	Tue,  8 Oct 2024 17:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAqj3C87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C636E10E17D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728408139; x=1759944139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1WGgz7GCA5Lm1PCZVjWdVOCBOoOeVPKjYgNWx9wxDEs=;
 b=jAqj3C87rmtvWujNCtkQhaczlprECTtefYtMjVpyO7g3K4lmLeWdsBj7
 6U+CbuHpJBQUIpvRmWUdF72k+fHN7kJZ7gWYPnRnzpgyU5iST5qdxlk3d
 Bl2EEdNK0qg5Cei7xLfF5zFyBpWOQs8Wa6YxfMcvF65PIjX4KRcCcJdQO
 og4LXBpRKE6m0jfQv6KoKQ1nil7aahMH3SD6D+w6F7roDwQ10JHlQI9pt
 oS634g2shYjas58b+v1JrSDLTsFu4sdZaUyVSlw7OiNS4R0Q82+QRyXmf
 /08Z5KLPbGC2AjCf/6njBETqGJDo3oZdXpiA2slj0o1CBZ+YhMMH3B162 g==;
X-CSE-ConnectionGUID: WBdCnFo/SVCzjmYJ9oxjpQ==
X-CSE-MsgGUID: /yubeVGlRSygNr9ktoGm3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38283382"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38283382"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:22:18 -0700
X-CSE-ConnectionGUID: we0TotK0S9mwNJCbwKRlIw==
X-CSE-MsgGUID: f/Y4KkHSQCulKiQ2k9/qvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="106740398"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:22:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:22:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:22:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:22:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:22:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIzF22Wbv/fRv37EjAMNsbZbt8SIDkIpcmqMoV29jfkBhcZSSscQ3tldfjewZWeCLU0LWtyjBouMargApvFZXCJzeCjAAi9VnYp1+J+SwZCzwkYGDFVDO6EVDuBcxBxph8+cJC1unZ6WsGJrqdfUSevbkyPjoLo155kj73/csg3LP0TkWxEt9jGb+dPW5Q8IeyzECQ3QIpwFjppA0EXt1LMmng+vgHs+UVTe2vDQaWU57IuKjgV5vwUzQ7Sp+bJkSXgzI1WHFOvjb6ZxQcI90yulscarfuM396lufFRrUZYfvqgRFiIMi4n9klNTLEFiNJekDupqeMYqYUim3msA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jKkqOfeXSfJe5izLC0hhstPZjN3TbVmtJXj8+cOrkw=;
 b=VHRTZwAdTMKKjwL8ZFiFEvj3/aBuRBVZj9NjsFF7KLm4rIjHquM7bhbIlBxVVr8/FrJwSySrm7GZU8ASB//AKAuxwfWAtdz87lMB366O5k8YNubxJb3jUL1OgH1dHodmCNXtn61Moen7+tn6Cof2d0ZYJ3hW8MPOpNk6h8m01Pg9pKu/Y5a6lw3nWrEOlKER9XhlqoRuZwokpTGBqYGXizuZy4MH0+gdM1BAcgTAgxcaPTgpSNBSDaYfa1sH9K5eEgoYjWAAH6uJImyKXoOy65O0wOu7NSJ0eKNu/QJ+ihD5A1bp2zsSF9Z58qU7MvZYGFq7JPjqg2tUJ3mr2xXZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB7942.namprd11.prod.outlook.com (2603:10b6:208:3fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 17:22:13 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 17:22:13 +0000
Message-ID: <1da253b3-31c3-4627-a9db-3a9071cd86ea@intel.com>
Date: Tue, 8 Oct 2024 22:52:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 26/26] drm/xe: Change return type to void for
 xe_force_wake_put
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-27-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-27-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f5e7a0-3d58-4363-ca3f-08dce7bdbf9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnNSRHNuUUxjNzArWnhEc21WcDZWZ21Zbm5ESTBJcWI3SXd2Z0FMbm8xWEZU?=
 =?utf-8?B?a3hjM3g5WDExVTEvT0dsKzZIanRaaHpIQ2FzQ0pjbjFhWHVIRi9razNFRnc2?=
 =?utf-8?B?aHBGa0dCTUg4Y1lMcVFYQ0ZLNzUxMU5uM29ZRHcyUUc2a2hRMGx2UldtNXFQ?=
 =?utf-8?B?U0R3K3JWa01JUXdWdEFiOU9FSVMxb2Y1MWUxNFprV29mOVAwTG1zL2lJM3Y1?=
 =?utf-8?B?RU0vS2xKanVUNERrNm1kc3B3WmxTREN2eTZvYmZMcUsrM3l1ckRCdWJSMXdr?=
 =?utf-8?B?TEo5d3dhNm1vbUQvU3lFcEI1Tjd5b2c5QVlKdXRmK2haNGRvZjIyL1pEZVdl?=
 =?utf-8?B?YXVzYXdCaFpVYm5McFRyOTZ4Z1hQbTFsV1VSQUdEVzZyRXVjODNpZnd1aVhh?=
 =?utf-8?B?TjN4OGRwNzRaOERXOW90eWE4M2VrcU5BZ05XSE1JeHR1S3NCRnBvMTZqTjFp?=
 =?utf-8?B?WVJWTjc5WGw4bjVRWjVVZTZQT2lUaG9hdldTaFdOWnlCU2FZeXJEMDltRWJk?=
 =?utf-8?B?ckJxNXJNeUVwRmk4TExNNU53Ny9XR1gzMmNPUUMxL1NybFJaMHo5QXZwUFAr?=
 =?utf-8?B?YklTcFNjMmdXKzJuWS9JbUg2NndVTFRobHUvYmlGb29uRXFyckIxZHRHdER1?=
 =?utf-8?B?Y0VROHE2dHA0c250ckxwYjRqK2UxL2NzRUZPUGd3bHA1Tk0rTjNxTExaQktU?=
 =?utf-8?B?bHFyNGNjVldnLzZPUDlCQ2ZYalNVNTJwUk5QL2tRcFp0Z0k3SjVYRVljS283?=
 =?utf-8?B?eVNVU1MzZ0lVM2lPM2ZaYmpOT3R5blZXTXU3c0YwejdPUGtSWUF6OUU2VzVa?=
 =?utf-8?B?LzBBTVdncDFITDhQUllxK1dPZCtUMkQ5RVdvZjRwYk9VbzhqK1FNdGlDalJP?=
 =?utf-8?B?bHcrQzdUNWVLdXV4NElVaXluUm9HOStHZXQ1WkUvU2pwNmJ0WmNXZDhHY2Vt?=
 =?utf-8?B?L2ZYQWxzR0tGL0JCYmJUMVdtQUJaK2Z6V1lTNmhYcHdnVVBXMDZkSytibUcz?=
 =?utf-8?B?cU5hSThjTlRIdWhEYUFOSXBNUm1kTzNNVmpZZkxNZWlPUGx2UHBVa3hWYjZq?=
 =?utf-8?B?M1ltWGloRlFkeThiRE8xWnF4Wjg4Z0JQMm8vUWJJMzJybWErbm90T2lzeE51?=
 =?utf-8?B?ZTFYQmZDVFBlcVREMDU3WFMwUnVSVlh4YW5CSjNvRGJtemY4VUNxUDhvSVVw?=
 =?utf-8?B?WlU1b3BIM2E5YzVOdE9RR2RIOUh5dURjNG9PaWMyLzN5b2gvQlM3K1M4Mjc4?=
 =?utf-8?B?K0RyVjF4OGxMYUhvUjVnV3JNQjF0TVgvamJvZ3pQTWNFVUs3dkVMK1JucnJ4?=
 =?utf-8?B?QWhBaGt5YnhXTUNKT2pUdlZMZzE4am1Ua1QzUWVDMG1SOEdHZE1LTER5Slp1?=
 =?utf-8?B?c0VOTHNRTWxzZ2JWV3JaVGJMNjlFZGNoazJidi9TVGY0Y3FzNjJGOVIwVVRD?=
 =?utf-8?B?Y1FOVy9qdlFIVTQ2eW9FcGl4N3h1ZE1rU2FRT2d1UzUvcVdQbE1sNXJIMUUz?=
 =?utf-8?B?U2FxRHBFQjVuTWw4dmdpQXA1WkJreTB4WUFVYXk0RmMxQW9NTXU2L2FPK3o3?=
 =?utf-8?B?MWtmczhFa0lKSk1xWDVsYUtKZy92RGtRQjhuUHFpME1PejZwOC8wTzQreW1V?=
 =?utf-8?B?VWVKSDlzblZHYjhUWis4cm1RWDZEVmxkVW9rNWJQSXFpcTZqRTFJekZ4YnJw?=
 =?utf-8?B?QmlpS2VTTExPNk1GMGJZZE9XaUI3THc0bzAwTHBaeGUxbWtNK1g5TUVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEVQTWVJaXhwbWpQVVY4L0pLTWhDRldZcHVWWTVoVTJ3S04xOGRNWkt1Ujdu?=
 =?utf-8?B?aUpOeW9CeDdWTStxc2tKaml5VnBCN01ZNjYyRDk2eTZtMG9UQzNwajJoeFpE?=
 =?utf-8?B?VmZZQXpWb3U2S2tseU5sRm5CUUd6TXFTcGZhR1JPN1Z2Y0JyclBNMmRhS0Ft?=
 =?utf-8?B?NDdDbFFsTFJkaVNXTUZDYjh6VURFVVl0aDNzUlJJQmRZalNBdjFoRTVMMG9T?=
 =?utf-8?B?MUUyRzZENUtEdEhvekQzOHJ3dHUrMER6cnh6WU44S0pjWHMreC9oOFZNbkFU?=
 =?utf-8?B?RTNQdmVhSkY3Z0pMTDkzVVo0RTR4N3dWNi9mOU5NZjc0aWw2dzA4YzJ6RXZo?=
 =?utf-8?B?RVRhazZIckV0NUJDdmFEWVRNNUthTkpMY1YzNjBYR20ySWlxVVpWeXJla01V?=
 =?utf-8?B?ZWxSTXBUVEJJRE5pOXpMZSs3blJqcGxVRVcvZGx2Y1BBZktFMmxKZ2FpRENj?=
 =?utf-8?B?d1B2VmlBeTZLUG1SaDdKaWFpVkhsWGhBcU9VUGw5NWZJZUFZL2lpZUt4emQ0?=
 =?utf-8?B?V3pRN3J5bW9QZlV4UFdDaTVmdjV5QWpyajZwUzlLYmRnR3hQLy83UzRqZzdI?=
 =?utf-8?B?V0UyczFsTDBTWkh2RGxZWFM0bnhtcEt2VWw5M0txY0M2SHdDb2l1Y2UrelVC?=
 =?utf-8?B?TzAvNWJrLzhQd1h1L0l6TjVjcVIyd3FWYmtLV0ZvTzBJWjQxNlZCSFVXTVNW?=
 =?utf-8?B?NVpOWUJ0Q3JXT1JFR1MrSFc4TG5GNWluRG5JVE4waFZuRUNJM1ZjaWRvdTNC?=
 =?utf-8?B?QkgxUTFodXVhWll2a2t4VHJGZ3FWQ2ZBbjNHdWllNWdUSjliWlloc0UwUno2?=
 =?utf-8?B?YzFIeXA1REJlYzNEU1p5b09Ta2V6MENwVEQ3dkN3OG90RVFabUFtdDlUTVVv?=
 =?utf-8?B?dklGM2Y5cUlJQjZQK1ZzQ0ZZb1Z5TDhJSnBtVTJ5QWJPK3krRnM4eUduVmRL?=
 =?utf-8?B?My9QVXA2eFNJRTlobFpjclhROXFsUGNMcmlGa0tHM3AzTGZjbUFFcFRtdGNo?=
 =?utf-8?B?MEwzTmh6c3hUYmV3VzZKLzVzSWloblJ5b2pnQ04xODRkdnpHRFowb0l1MEpV?=
 =?utf-8?B?aC92VFBsY09NVlFtTEVjalkreHk3M0twUmpxSmVUMlc1emlnWGwzaGtvc09B?=
 =?utf-8?B?c2U5OUw4dXVZUlRNTXpGa1FZTmprODFMT0JrZlVWdXFPZzE1UFZacnBkOGdO?=
 =?utf-8?B?eGJyM2tvYmE1YzFiOE02SThxNGFFRFdRMVBVNHBuR3F0OEJFWEhXalJSOXp1?=
 =?utf-8?B?Ynl1ZkNBeU1JQTkyTUcxY3N1VlE3bkJSZ2VQcERMWUhIbGxsb0pHbkNwdyt6?=
 =?utf-8?B?R2J0QXB5OHZXeklmRGlmSkpUNGxraTkxMWZsM0drY1lSMnlnRmxiVDM0Y3Ra?=
 =?utf-8?B?YStld29kMnM5azFYbHpPaEx3dndnQldTMkxpdFBIV0o1YUFSY1Y1Mi9uRXAx?=
 =?utf-8?B?OFhwS3NIaEs3UWtnUFNSbW9rQ1NRZGhYVHdRaGFtOXkvbXJ5QnBLSWxYdWwv?=
 =?utf-8?B?TEJrOVFBYUdhTjRHRk9WTHNVUXZyT1hocGtVVzNtTzNvTnZmNUdSdGtiWVpL?=
 =?utf-8?B?SE5YVnB0Yk9LNlZSTzd2bmxGOCtsVkJsWFc5UzZMVlZEMk5EMUxnUzZpb2hh?=
 =?utf-8?B?aWluaVNFODFmeGlsdk4rSnN4bHlQand6Nm5oYTFiSFN6WEtDdDZLUGd1WE0z?=
 =?utf-8?B?djcraFZkYWpFWUZYZ2xMb3FxVjkxQU53WDBQTmNIdVFTT0JUTGxieTdlTUlE?=
 =?utf-8?B?eG1hSDk3QitHVUJFQXpybEpjK0NHM3hyZE5qcjBnc3MzR3V1L05vTGRXZ3ZN?=
 =?utf-8?B?NzBlV2gvd25qZjNPUGRDWWN6UE80WTFrc09RK21UT0xmSEEvaUdnMnJxVnFo?=
 =?utf-8?B?bzE1WG1Cd2Z0QmhVZWRLNVJGMzBBNHRoNFdMK1VLWE02WjV4YU4xT0g1Qmc2?=
 =?utf-8?B?WElhOGlnbXRVZ3Y5YkxJZGZleHg0MnJvVGVTY2lSV0Z1SHhkeG5mWWdzOU9R?=
 =?utf-8?B?TVllYVR2YjR4UVBNSzQrSEdnTXJQUUdiMCt5bFdVYVpDYjVWQ0dlUzdvL3Y1?=
 =?utf-8?B?cVRqMGpwTWNjTUFnOEJwaHdFUllDeWZtaWIzd25EZTYxam4yeU5MRTdxMGZS?=
 =?utf-8?Q?OWrWMHLFDvaMlQqrinecvr5LZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f5e7a0-3d58-4363-ca3f-08dce7bdbf9f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:22:13.2486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCq7RykmE5WhOD4iMJ5uXC3ZRpDNUwlGVyriSV3C4CxGnXHfeQ7iCTgGYZMcrlrz8nYXZAmYnu3n6YDsXIFvZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7942
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



On 08-10-2024 12:41, Himal Prasad Ghimiray wrote:
> There is no need to return an error from xe_force_wake_put(), as a
> failure implicitly indicates that the domain failed to sleep.
> 
> v3
> - Move kernel-doc to this patch (Badal)
> 
> v5
> - change parameter to unsigned int in xe_force_wake_put()
> 
> v6
> - Remove unneccsary wrapping (Michal)
> - Remove non required header (Michal)
> - Mention timeout(Michal)
> 
> v8
> - Fix kernel-doc
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>(#rev5)
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 16 ++++++++++++----
>   drivers/gpu/drm/xe/xe_force_wake.h |  3 +--
>   2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 5d749bad9496..1d8f52d79f47 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -212,8 +212,17 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>   	return (ref_incr == fw->initialized_domains) ? ref_incr | XE_FORCEWAKE_ALL : ref_incr;
>   }
>   
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      unsigned int fw_ref)
> +/**
> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: return of xe_force_wake_get()
> + *
> + * This function reduces the reference counts for domains in fw_ref. If
> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> + * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
> + * Warns in case of timeout of ack from domain.
> + */

Looks good. Please retain my RB.

Regards,
Badal

> +void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> @@ -226,7 +235,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   	 * in error path of individual domains.
>   	 */
>   	if (!fw_ref)
> -		return 0;
> +		return;
>   
>   	if (fw_ref == XE_FORCEWAKE_ALL)
>   		fw_ref = fw->initialized_domains;
> @@ -248,5 +257,4 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   
>   	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>   		   str_plural(hweight_long(ack_fail)), ack_fail);
> -	return ack_fail;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 70faec9ae2d9..0e3e84bfa51c 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -17,8 +17,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>   				struct xe_force_wake *fw);
>   unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>   					    enum xe_force_wake_domains domains);
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      unsigned int fw_ref);
> +void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
>   
>   static inline int
>   xe_force_wake_ref(struct xe_force_wake *fw,

