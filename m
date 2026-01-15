Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04CFD4116C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 11:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CBB10E11C;
	Thu, 15 Jan 2026 11:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvmRjLk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9A510E11C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768476632; x=1800012632;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gc3v9NjBiNseUuvMOVmuX63/v/RZa8EDfNccpUGKZLs=;
 b=kvmRjLk1oo7ti1HaaYxxfFics88rjW9TACHVZGhlCBlC5O8iu7kIMKt/
 MrUL9TcV/ciC+nLZlRU/vzyhklA0I8cUyAScQgckUQ7mVXSTqxIWtqLuK
 QxTTXd55a+lm44XKhaMm6ItJrz7tq4Wkkr11Zg55GoTla9zY2QJx/okYj
 M9J4y+ziF/PsEADwJfxyUwD3AfGLgvmb5IHei6RvrJYseNtYP4j7P0ZTD
 I3rgZyqGV1GL+R0eI8PAz6xuwsfnTby0WRPioK3eWuYxAwR5c2HfUCM3L
 mr7/oRYdcxmLfBWXWe3U3O8j4LiWVjxlkB1HDNEB3ChOHM+rxCX616o5w w==;
X-CSE-ConnectionGUID: uYhGPB5ISLGYWVpWe/zvYw==
X-CSE-MsgGUID: NWr/bnPWS8Wld1hWoWJPyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80891637"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80891637"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 03:30:32 -0800
X-CSE-ConnectionGUID: uk7c+KuNQl+I8nbMrD/o5A==
X-CSE-MsgGUID: cm4Ii7nORhG4M3oGN4LyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204139507"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 03:30:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 03:30:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 03:30:30 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 03:30:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bR2GICSdD57/XmeFvQX99Flp1B9rsaae3CQtURN/cXNpnqFaiclu2N8NsxFEteDlM1R+TaYdbS1VhwjdGHJRDF4QW5PhyiKD9tjNNXx55fRlJWn/lAXiLpsAYXn7/poEBcyn08uZbAqCvsSv0C21N/LI9mxUGi2gwK6YDbo1L01XuFRHPmJiEJpmxFgUhPOMKnOzhfwbfV+MXV5X/JzFYT/uCfqjJA9xhcGQH2HOEK+H77uZVC+7VtjJW5g9RNq22S403Mo4RcFG0lWB4KmUXqinoTz6146rt2vcALbfTv0Ya0c21PCqMV0+wBc8uQRTtd2MR9WCUWhXIagpr6x+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc3v9NjBiNseUuvMOVmuX63/v/RZa8EDfNccpUGKZLs=;
 b=xPUXhE4EkAjWgQzTk+wTG1ht/vdDpum/7F7HXBocrHLCvuWltRRL6kVw8RnmjVvemsiOPIW1QCdh7toC+p+BCBpUA/kmxFGH/Zh3tfrAkM/bradgbUqsQXmwNj9zYWQ0VJow8WVBFB1PJOmAYDQB99xEdr95ER5gmSoSqVB50bhP3C5ug2f7yFmtZgnKltcOYYNBujjmUKCj7gF2JA/xu1aD65r93yH6pwD7VDQPFbDwFNc3xqnCBT3Reu8C7M29P4VdTzJ4HuUeO/MXp9qjKdCULrnWVcmnEXxls6sbBp+Lsf+mSk0Bd3piVC4UUl9JOGhA6B6+4nq25VXYLjdGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 11:30:27 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 11:30:27 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
Subject: RE: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Thread-Topic: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Thread-Index: AQHcgbPHJKahaN80dkuJQth+yS6/1rVTIIzg
Date: Thu, 15 Jan 2026 11:30:27 +0000
Message-ID: <CY5PR11MB63664C511ABB31D479FF95F4ED8CA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
In-Reply-To: <20260109220026.2468067-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH8PR11MB6658:EE_
x-ms-office365-filtering-correlation-id: d5564aff-ef8e-41e0-407e-08de54297b99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SVhodDVLVXFpN1lwOEpON3luY2FidTlFY09FNWpsTWNPbVF0bVR6eVplZXhR?=
 =?utf-8?B?QkpzWkNKVjBVb2pFcTBkd1JkNkx3cWZOVkgrcE90blpZTmp3S2xCTjRrMVds?=
 =?utf-8?B?T2Q4NzhQYmk0SVZsT0Y3RzZPdS9FVmc2dE12ZVRjSU9mR05mVDlJMFhsL0NN?=
 =?utf-8?B?UUVUdERGREpFYmV0OGtXdG91Rmc4NWlZWG9ubndvdng3MXlvMHVrQUhrRmxW?=
 =?utf-8?B?cm8rK20xMVBtU05EajdIK3hVWHF6dXFTMXZ3YWw3UFh5cFFwV2RYUzVaYnh3?=
 =?utf-8?B?QXlrSXFRTnFKYnFLUFljZy9icVRHbC9TMUhTdkRRN3JZWFY0QlEwSUlDLzEx?=
 =?utf-8?B?andkR3NianJvc0hYNHUvUGlXcHBHMWlwTFgzYnZUSmd4REhoY1kvVUpJY3hn?=
 =?utf-8?B?T1RZc2lQKzU1WjRJWFFiMWw1eFIrV094cUJBc0Z1eFprZ0FEWWQxM2ZMZWFG?=
 =?utf-8?B?VFFoTkdrWlUxS1pCeTZ1RTNsQldGZXJGa0RCdDBkUmo2djA0MG9UVFBFTEQ1?=
 =?utf-8?B?c2RXS1ZsaWI5NWU1cjF5S0hQSWVCeWhrek9FZVU0L0hRcm9Za3FWWEd3UmJT?=
 =?utf-8?B?dzU4WjhlU084Y2ZIMVVLVmkzSEUxcFlTYTIydWdjRGhxYzJBM0k4dU5SUVNG?=
 =?utf-8?B?R2hacEJNbjBobFpFK0pLSjJCU1NGbjBOUmZiVVY2ODVENHZLaHRSazhnUjdh?=
 =?utf-8?B?YTI0YmRPcEFwYzUyQ1ZramR1aHVXMVlHZUZ3NS84K3hLWWI0R0xuUFFNTjZq?=
 =?utf-8?B?c2VHWTI1eFh5bzRnRUxFeURoSkVtOEhnbzNWVnU0dmNnVDMzOU5tTGJTZGtS?=
 =?utf-8?B?RlFRdjhzdUMxdWUwL2V2Qnh2SnkvbXZ6UDRHc1R0aERJd2RUMmFkRXZGV1J6?=
 =?utf-8?B?aEQrNTloSWJzVlNIZDB3cVp1cDNBaGlUejMzQVpVVUFoNFNYdFNtUmxidHdL?=
 =?utf-8?B?MGl2L1FNUUdybnd2OU9wdm5zOHZpZ1Q3N0N1WStIbnlpd2paeWpWdm14WlNv?=
 =?utf-8?B?dkQ1OW9EV2YrNmlXWEFaUVZFZnFPT0p0bU42dDNEUGJWbFZLSmt1UEVrdHFI?=
 =?utf-8?B?NU1yRWdILy92N2dkWUdtejFvSmQ4QUEyRFNxZXl2bGV5czliVVc0WU5mSE5X?=
 =?utf-8?B?Y2h3K2xySm1QZ3A5ZmtVY0dSWUJnYWVaMGd2VkpNUVdwSnNQbmUra3lmLzFn?=
 =?utf-8?B?S0I5SDdGRExocGFxUnRMcE5lWG1yMEx5MFlQY2UzdWZjKytlWG8weUdBbTZE?=
 =?utf-8?B?ZW90RW1MNXAzU0wwRm0xNSs5b3NjbnZIT0YxT0Z4NzdNUG9iYzJMMUFYbVIr?=
 =?utf-8?B?My8xZW14N0twVHYzNnhpY2FxYVRienZoTnpYdkpxV0o5c1BTS1o5bldoQyt6?=
 =?utf-8?B?R1pubVF4am51VGF1YktsbVJ6SWdFNlpQS2l5MDlrU0dwSzlHYzFXUWhQTWhv?=
 =?utf-8?B?STR6YWVhdzJqcUt5eFZCQ2N0bVZ0MzJNRmc2bzBuMEU5eDdhNUg1VFNwdExl?=
 =?utf-8?B?dXpTNGlkTDdIL1VKMUdKNVJDU2pWOVRSZ0tnem95N2p3MWZkaEdDY01VUEpE?=
 =?utf-8?B?QmNxcmc1UlNrQU9odTZGbWNuaHZaL1JYdndmWG42RU5IMEZJT21ZWmdENmxM?=
 =?utf-8?B?QmRSLzdTNko3WUltZTUyMW1CV09UQURxcUNBS3VESE94dncvUUtDQ3pmQlJD?=
 =?utf-8?B?eW15SDVNYUJseDJ0UU5SaW1FdDZrNUgzNXFaYVhpVkJKbmwySmVycmxmYUlJ?=
 =?utf-8?B?OHZwN0srZmozb2NkVDNFc2c1WkNDb3ZrNmNZdzRlenQyT0NITnZrTXZtemNO?=
 =?utf-8?B?Y2x0OWNBVUphdThEQ3JFUzN5OGFqcUFqaHUwZnZCZUpubm5DL2wzWWVseXcv?=
 =?utf-8?B?Wk1mNXJ1di9CR1dvWGo1aWhKcUk1WXo5eWxwZXBwajdiMU9GVTFkN3hjcm83?=
 =?utf-8?B?NHpNUS92OFBhQVFGS01lQzZ1bDd5TDl2L1ZpN0xHa0xxUkdCT1hNUWcvUzlS?=
 =?utf-8?B?TGRXa1AyS21QQ3JzcTh3dUNvYmpDVmtheCtxcGkzRFA2aERDOUZjVmlyVDky?=
 =?utf-8?B?ODJsQ1BvZGZwZFN3T0pMWkRDTHpabEgwbWtNT2dRRjI0cVpYZU1vdjl1cmVZ?=
 =?utf-8?B?bEdralFLUFNDWncyNXlUaDloZVR6TlB0d0drTklTYWhocHVlNHdKb2xweXhU?=
 =?utf-8?Q?EBBm38DN4T0ZtqHmOR9QlmU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnZ1ZGhvTmkzS2FHMWtqazdLOEExRmdlT0JOUC9QM056ZXpEUG1UZjRiS0Zp?=
 =?utf-8?B?ZXVKM3pTMFE1djduNkdpVXFpTDJtaUdxRUlwQlV3Mk5BZ2JiUWRuaDUxYjZD?=
 =?utf-8?B?RmxxdUE2YWRsWXZiUTYvYnhPeXBlNGVOMUZKZWgvVTNBYUZHNTdoOUVtckZr?=
 =?utf-8?B?alRnRU1FaVhGUDdVUGEzaW1UaTRMNHEwSUwwNjBhemdwVDA0eTJ6bnYvV004?=
 =?utf-8?B?SXJrdDEvNE5yV1RjR0Q2WmcvUFU1OERzK1AvcXhZMWZSVlNDZW1UcHBVVUIz?=
 =?utf-8?B?WEhDbXRLNFhVVk5IMXd1VG9laTJZYVFXSFpKclVPdkYzdW1IQ2llN09Nd3FP?=
 =?utf-8?B?djZoR2J2QmNGeDZsNUI2UVBzb2tiWUtTSkZUSi93ZmM0bFkxUHQ2bC8rOXlQ?=
 =?utf-8?B?VUVEdEhPVGl6QkRyamNkOG1qT00xQTlrMFZ5L1Q1WHE0N3Q1dVlyNVR6cmVQ?=
 =?utf-8?B?Ynl1V2ExeENLU3k2NWhTdzhCcmVxVHZMQk1SS0V0WWdUWVVHc1dKQjk2UjFF?=
 =?utf-8?B?QTJOS2xwVklqcktGWEJxZm9DQ0plQXBHN01TODd3MmF1WGNqSDJ5MkxaTHVC?=
 =?utf-8?B?ZlhvS2YyajdIMXBUS0M4MUkxL1NvaGVXdmNwcmVCZ1AyRXNzQnF0MUxPaUsr?=
 =?utf-8?B?emFDRjYzOVdUVnJLY044RlNkTkZJT0lkcHNBR0wxaXlnbTJqdG9QQnR4UXo1?=
 =?utf-8?B?dXQweXFsYlJNeWVsMllQRXFjOU5YOHpQRGRMVHNOeW1nN3FYUFB3aVhYc2tM?=
 =?utf-8?B?akhRTHN0TEw2aDQvOWowSldSNi9Qb21Dd2gyNXhFVHlvVnZxS3JpV012d0g4?=
 =?utf-8?B?QTRFL2RoMURmUEp0MDdqamlZaVJia3NGYmU5cDlhVHFSWCszOEg3cUFoSlhS?=
 =?utf-8?B?SGdUU0RMV3RwRGs4d2VkdHM3TnhjZTd1dXRFSjR5dVVSR1JmQ1RPejEvTE9E?=
 =?utf-8?B?MnlDZTJONHdQaHFrZjZBVFJURVpXM3VtNFZHLzRwN0tvSXBWNm9tQ3hWVU5Q?=
 =?utf-8?B?NG5uMi9MZStxME1oSGphWWorYUZ5ekFwWkxTSkJaZEQrUVNvTE1penJnQSti?=
 =?utf-8?B?OWNFcGFDSFkvSUd6N0poTzdiYWdDamNYQmtvTjJzdTc2a2pGMlRxZEo0NnFw?=
 =?utf-8?B?b05iSmxrSzdJaGRrWFJIdWJ5YVlCRk4xVWJiSmdPckV0VnZJaUxSR2JzY2lh?=
 =?utf-8?B?M0RxZk1hVUk5L1RWY1JUaEsrVFk2MjJKV1lpMGR6QTJUZ3hRTU1kNEdUWXl2?=
 =?utf-8?B?SlR5cFplWkpUc3MrZVI0Y0JlU25yek1DR3RlOGhkYVgrVnFiR1NMNGk1M3dR?=
 =?utf-8?B?SDZTM3RldE5MeWVhSzZGSzRjempPWjRreEVXU1d2YnhiQ0h2aVZ5TUNCTnZC?=
 =?utf-8?B?REUrZ2lGM3RsR2grTy9Fd0Y5NHNGZm9kUE5SazVsbVVVaVdVMFNnemJJTkJq?=
 =?utf-8?B?elBzc0Q1NWl0bG94NGxUUzhDR1ZpWWQ2MXlXUjNXck10TUx1bzFzRzRJTTVN?=
 =?utf-8?B?dVU1QlNqZkRjTkpZYWx5aEtjSHh0MmxFeEpyTjhxT0ZOdHUxTW9EajFvYTAw?=
 =?utf-8?B?L1pKZXNwWlhmMXhveEtMaTJ1c1Z5c1E4M3A4eWxuejJnZ3lON2MxdlJzb1Bo?=
 =?utf-8?B?K0RQemFrSXNYREpHeTVPUEU4Z2dpNERSK1N1ZDl4UVJneWp1UzVXajFaZURZ?=
 =?utf-8?B?dGFyKzVvclRCRDdOWFM2bnpEZHZsQXplMitjK0R5cEdKUDVyZ0ZZVm4vTmNE?=
 =?utf-8?B?UkYwaFVvOUhJQzNhQktrOHdNVndOaFFTZkFIekt6N3pjTGIySWdxcE95NTRD?=
 =?utf-8?B?UEpLSjNteW5NM1pRWHRNUGlVdk1LYjM3UVB3S2huR1VWdGJoUTIyVmlES0FJ?=
 =?utf-8?B?M3drS3loTmZ6Y0RFb096NE1Ndm5GZjEzc1JBNk16VnNnYWZDZ3czSUtRUTBL?=
 =?utf-8?B?Z1FxSGEwSlgxcjNkREhEb21OK2l0Q3BqVFh2ZHlHeVZKUFdBa3JJTUdjWHRx?=
 =?utf-8?B?RTJpNThQNzRlUnlBWDlyZlp4Vm9LWGYzOVZHVm93MS9Wb2E1ekF0YlU0S0NH?=
 =?utf-8?B?THM5cGRhTmU5QzFyMlYwNldhL28vSmpXcW5YUlhWMFIyQ0JoT3d3NXBISFFx?=
 =?utf-8?B?d2hCWGpZQ2p6YWpCQnpQNTFJSkhlNFNGckswMzcydFdGNXJONVJVR3hnUjVT?=
 =?utf-8?B?MUVwNytUWm1FTWFobkN2Ni9JODIyRFdGU2pGNE9CdjRVdmRmWm1RVzdRQk9C?=
 =?utf-8?B?MXRaa2RrNTNXWGg0aXorNmplV1YzSXNHV0pTMEZqOGE5UC9vV0NHdUhxT3ZL?=
 =?utf-8?B?MmRjV2o4Z0VtZ1NmQVZjWGRPZTFNZVRDM2FjTHlGSHVKNUNrN1ZYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5564aff-ef8e-41e0-407e-08de54297b99
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 11:30:27.6562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZFYwASy90LsT8+8cLk3RGk0i5iI4/CDA7AJV7Umg/W7qgfX4qh+ju/qf3S6a7JK/Yay3c6MHaVuGy+fRAveEo79QqapWkF+qFpq0YB3ZlXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
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

PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS94ZTogTWFuYWdlIG52bSBhdXggY2xlYW51cCB3aXRoIGRl
dnJlcw0KPiANCj4gTW92ZSBudm0gdGVhcmRvd24gdG8gYSBkZXZtLW1hbmFnZWQgYWN0aW9uIHJl
Z2lzdGVyZWQgZnJvbQ0KPiB4ZV9udm1faW5pdCgpLg0KPiBUaGlzIGVuc3VyZXMgdGhlIGF1eGls
aWFyeSBOVk0gZGV2aWNlIGlzIGRlbGV0ZWQgb24gcHJvYmUgZmFpbHVyZSBhbmQNCj4gZGV2aWNl
IGRldGFjaCB3aXRob3V0IHJlcXVpcmluZyBleHBsaWNpdCBjYWxscyBmcm9tIHJlbW92ZSBwYXRo
cy4NCj4gDQo+IEFzIHBhcnQgb2YgdGhpcywgZHJvcCB4ZV9udm1fZmluaSgpIGZyb20geGVfZGV2
aWNlX3JlbW92ZSgpIGFuZCBmcm9tIHRoZQ0KPiBzdXJ2aXZhYmlsaXR5IHN5c2ZzIHRlYXJkb3du
LCBhbmQgcmVtb3ZlIHRoZSBwdWJsaWMgeGVfbnZtX2ZpbmkoKSBBUEkgZnJvbQ0KPiB0aGUgaGVh
ZGVyLg0KPiANCi4uLg0KDQpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRl
ci51c3lza2luQGludGVsLmNvbT4NCg0KQnV0IHlvdSBuZWVkIGFsc28gcmV2aWV3IGZyb20gc29t
ZW9uZSB3aXRoIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIFhlIGludGVybmFscy4NCg0KPiANCj4g
Rml4ZXM6IGMyOGJmYjEwN2RhYyAoImRybS94ZS9udm06IGFkZCBvbi1kaWUgbm9uLXZvbGF0aWxl
IG1lbW9yeSBkZXZpY2UiKQ0KPiBDYzogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lz
a2luQGludGVsLmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4NCj4gQ2M6IFJpYW5hIFRhdXJvIDxyaWFuYS50YXVyb0BpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyAgICAgICAgICAgICB8ICAyIC0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9udm0uYyAgICAgICAgICAgICAgICB8IDQzICsrKysrKysrKysr
LS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9udm0uaCAgICAgICAgICAgICAg
ICB8ICAyIC0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYyB8
ICA0IC0tDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9u
cygtKQ0KPi4uLg0K
