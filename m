Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D30FCCA472
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0590210E622;
	Tue,  7 Oct 2025 11:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9HFW2Oh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBAA10E622
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836597; x=1791372597;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hd8cX94pdzPnLFEuXsWDCVvjKSY45yLUUXkOU9hy+LI=;
 b=F9HFW2Ohs7odOWO1fudVIXX0cKgUIGiwcUWKbqUCer4W6XFfwmmthYU/
 MJ0Iiyq0RpdPVa5ZrZc0nQ2bZEPs5GKbV8XrEZByUycTlNvT2ZTNrpRed
 Ae3S8WadeKAgIHirkySMMGWm9nyXKG6iE+oOCbDbFTmg8R2h9eFPzyJf6
 JRjSkP0LAR4sYB3PuykMuebZYzGWhnlniPJgJiL9FTcQihvMA/Y5U2H51
 iNGVFO/PvXLcVLX2GP+zQOxjOTXkqxEY/mUEPiVTckNN6Yh0VL6Ad71X6
 ihcNgVfZTB1VizzSqfmhwoVzFBHfjpScaA6QvT+/YCirf0SdV41w8YAiw g==;
X-CSE-ConnectionGUID: GdUEfbVrQvCmkmnqISOlyw==
X-CSE-MsgGUID: nr7eNd0JS1G4ZkRKUlUqQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="79441708"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="79441708"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:29:57 -0700
X-CSE-ConnectionGUID: MGItcwZaR1+iLs4V0zr/4w==
X-CSE-MsgGUID: rQpIdIT5SUW2K3ktXBSfGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="185424542"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:29:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:29:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 04:29:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:29:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWkit1gRqexs8vNFnpSWfV/xm7lp/dseTaN4XhpYgdWCzOYeIfiGvszVUAquAL+PWXpyHxVUSlXW/fe6bfjB97Abzvo6HTs6gI0qsKfeuikmXkiKvivlKd4ROBqvs7p+NimmawpHi1geNNgw2QtQIsWL1mn5mTAZ1NVhiMW7Rx5n5uImlTJZAvcL9Q9lo3/1K4WowkURbB0A0eNtr9PzdRfy1x5o7FiUTxk36GK++lTHtrvyjJhtfKu/nVY+FAvyt376Zx1eQhUYP+/6yrqfFifTVzMVbnE+SjNei70wykOabJOQAvkItyOQXHGHAgf/ijnWmRSqYzOmazJ07kutoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iv9RUPfW2u7D3tzfIj5kX/DeaQBgH9/uLeT6iKo8aJ4=;
 b=bag+uawkghg3yx9ashvhFudYeM1ASRuQyk7eh3PSqqQOa83EqY3eJ0yVyd/ey8Mi9Wn9BIBjEYROywmxNr7KC55Tr3qzI6cFVvPJTXP181IUn6OIOEntydZhl8by9DiZuum5KS8YdFEcvuUTKCC4cQv/2xirtKuC1MBv3ZSryPeDw3DMXLLF4EVqqzFXHYK5ebIpkrVEmbEd2HJUNbUfNzYaYvon4LkUFRHezlL1L0+F3VYynyX2+RwjAGkCEgZNzksMI+YD6E73l9+bF4sjVrVf4A7138BIqXhYrL8DZVOKhcvFl5vLo9EQucXQ5m08vo7prKcsD2UR1Z+iVjf/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 11:29:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 11:29:41 +0000
Message-ID: <449707fb-8701-4806-a301-c511d1894957@intel.com>
Date: Tue, 7 Oct 2025 13:29:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV
 VF Provisioning
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>
References: <20251006115013.1305805-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251006115013.1305805-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:803:104::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: c7870428-71d1-408f-9b99-08de0594ce93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2ZLbmdheTRNa2h6VDUvd2Q4cjVBajBNbEhSSEhNaC9JRDZicS9QVGQ2OEds?=
 =?utf-8?B?YmM4NS9IZzVha21Ea1NTNHVOQjZZUCs2emxkRC8zWGNUQkZJSG5TSExNdkNp?=
 =?utf-8?B?R25Gc3JTMjVVYS9oclpVYm9meDRRbW5UVXlpeGtGZ1AyVy9hKzNnU2V2Y2xM?=
 =?utf-8?B?ZDlPNVpESkZBREg3a1RkVnFmV3pWbXpFcWk2a2hYVi9sZ2V5a3VVbG9sUS9X?=
 =?utf-8?B?S0cwU3NIb1pzUitIRmNvRlJYVEg5WHNyL2E3N1FTaUJSZjBNWHVvcVZVZ0dK?=
 =?utf-8?B?K08wRjFsSjFYZWVxTkNKOTZVbjYzbjEyQkR1MitkZUNDcWs5OFRjckRwUVk3?=
 =?utf-8?B?SFZkMkp3Z2txN2RoU2pzdlJkK3BWSU8waG95Y2xnMGRMWEhIOGV4LzZBMmR2?=
 =?utf-8?B?bjd4WUZhY1Z0eUlJeE0rWGE5UW9hUFlhZUdvY2h3eXZvNW5sdDZyR2pLTmJT?=
 =?utf-8?B?cWg0VDFzSjdONDM0c28rNlYzc3FxSFBLOWFBOVphWWNNbmtFS05qWGVJQ2Nj?=
 =?utf-8?B?eHZoUkswcWgxLzBHdVZzTk9wb3BZcWtWQytTcGZVZFh1NDJ1bTkxVmtIVDRk?=
 =?utf-8?B?ZzJ2V05VV3psUmF4ZCtYVkhQN1NvVUJyYWlEQlpOS0pZdmRoNm9NL240czNB?=
 =?utf-8?B?UjhMTFBqcDVWNGE4WFpkNzkvdjlBTmpOSEtZNmh1VnMwejRMU01ZamtBck1I?=
 =?utf-8?B?aXdBQmFtTWlDRmQzbDkya0FBSkI4T3puRlJ0cFl0cXkySnFvZ1d4TzhhRXZ1?=
 =?utf-8?B?bDZkRU16OTRkTlNOQUw2a1g4c2NBcXhMN21XYldnSHd5SUN1Nkp0MXBmZkNy?=
 =?utf-8?B?RmJ5Rkx6aU84S1dvZCs0bmYvQWlMeWRCUzd6bnVzTFBFY05vSlp2U0tYd2Nm?=
 =?utf-8?B?anpva050VGE4ZUMrNFprQk9TK3pzaGIzRWlxbzZ2VDYxc3hrVUw1VnQyd0FZ?=
 =?utf-8?B?ZVNFVTN1cTlNVTNESFQyUVdZcjFJdmVFSmNzRksyL29hcWgrblNHbks0WlhI?=
 =?utf-8?B?KzBRUktLOStxT2tTRjVxUkR5N2xHSVRDMHBKa1dsYkt3MWQ1R3hGVnZtS3Z0?=
 =?utf-8?B?OC9kUW9RUXkyYXdQTFcrb1Y5bWpCc0hRd09WS0IzTHVmY1ZXN29xZURUZ1E5?=
 =?utf-8?B?SHg1TzJQSEZFMGNWb1VmTmdQK2VvWFZ3OVFnc29HTFhZVTlkeG91Tk44Kzkr?=
 =?utf-8?B?dkIvYnlQNW41Z01Ud0UwbUp1empva0xScG1tTG1UdnNWMEVZbW5pcGZsRkUx?=
 =?utf-8?B?M3VvMFV1SHVLdjBMNVVYSVhqZklHTHo5aVNjNGVRL0Q3VGQ2aWh1ZWtjNm9u?=
 =?utf-8?B?MVZ2U1pmYVI0citEYllwVWNJdnBTSCs0MmFadTA2TThSRlQralpURmNwcTZ6?=
 =?utf-8?B?VEJ5NFhSTVhBNmF5Z0tEK2ZUakQwZDl0VVdoTWwxQmV4R3FtWkkxU0JicnNh?=
 =?utf-8?B?bXRrRTd3ZmFlemREeEdFcG1EaW5aNnQvek1iQ255RTFDclVRUjBROXJDUnFu?=
 =?utf-8?B?cHRsaG5rd3F3N0hLbXR6WUhNZ1U0dm84KzluN2pFQ3hESWxzR0tYSlhsRTUw?=
 =?utf-8?B?Q2EyYUhlY05sdy8ySHVYdERBeHgyLzJUYWJtb0lzZzEwZE03SThJUisxVEp3?=
 =?utf-8?B?ejFlYWkyWmZZakk0aVQxQlgxSlE2UUZqRWNONlpvRzVQQk1Hd25YcTdQdEsy?=
 =?utf-8?B?MzBsS2QrYkRXQnlhMUVGRElsMUt4TEswZFh1TnNRQ1d3cjBXQlRJZ3czUnRn?=
 =?utf-8?B?dGFEMVUrRTVmZVplSTZOUU5SMDZvVU5tUUFIZTRjU0tkTUdOTnE5cjdRcWVG?=
 =?utf-8?B?ckNYRkYyZlNkUlBDUndPRms2RXFHVDdxNFBZUERDRzhkK3E3SmNiUEU1T0xY?=
 =?utf-8?B?RCszNWdHMnkvd0N1QXJ4cHhnTHhDdUdXSzV5d0tsRkdLUEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9lTHA3UTBKbkFzbHBlWURNNEpIU0JtMjRnb0xzU3NIUDV3dFVCb3V5Nk9B?=
 =?utf-8?B?cHp3R0tXalF5VjMyOWM3K214eXI2TTZWcmxpRUpUZVg4SDJ5NEtCaDVNUHRR?=
 =?utf-8?B?ZlprRUVXUHVMSVpuL0djd0prRC90OWVXUko1QlBWWHBXRUFnaVg0MFRsNVlI?=
 =?utf-8?B?M3JaZldJVFgrNy9oRzc4d0tOMzFoc0EzZGdWaUNqQndrQzJ0WjBoT0plSWRH?=
 =?utf-8?B?aXgxYmNEeW1ySFErRUEyQmNqOGkydzQyZEpHVk0zSU9ZQTZaSVVSc1FnOGJT?=
 =?utf-8?B?Z25jejh0MjR6ckJjekJnVGJEUTRVaHoxVm5oSi9jMk81U2dVc3FvMWw0NVdQ?=
 =?utf-8?B?cE1kSlY1djdoNG5BQzBHZi9HMmpmdEk3dzFZQ0FIcSsvUTFQUlQ5a2Y3L0F3?=
 =?utf-8?B?VXVHK1pScmdMa3lIaHhSZ1dITHZDaVd5QjBIazFUNlFVQURiSGY2MmZRMWJv?=
 =?utf-8?B?UjdDV0EwenZVUWF1aVUwR3pubjlJeXFjNytLTVQ0NURrYWJiRHo0ME1pTUhC?=
 =?utf-8?B?YUZwLzF0WUh3QkJ2clNPZ2NpUmI3UDBZdWIxcktFOWIzc3R3R3gvZ00wTGpH?=
 =?utf-8?B?a2tGaFY2aHJneEQ0c2NqbjZuZXdkVXlSeUNBSmthSlVNTGlZMUlwWU9sTVNr?=
 =?utf-8?B?YlJaWEZxdlo0MlZjb2ZQZWg1aFBsMTIzMk9vdHBBNXlkSDZiNW4yTXBNY2NV?=
 =?utf-8?B?Wjd6My8zRnFyeU03OU8xVVVwaW1WZ09yVldwWlErUDZSM2I3dGpHSHpSc0hB?=
 =?utf-8?B?VFB2NWxTUHp3QzhEUytLR2VMOHRXUzdVOTJUVWNXNjJiY2lkVXkySUE3OGNr?=
 =?utf-8?B?SmV6R2YvMUQ4U3NuSUpNUGlSUnBBcXQwS1dxQ0J6anF3VjdZWFR4WDhzMVBS?=
 =?utf-8?B?ZnZOK2pWcDVlTWV5RFk0ZUh4dGdCMEhabkM5d1c4dVhWTmJNRk5DdEdmUGNS?=
 =?utf-8?B?KzVPaHNtTkxGV2xkanRHZ0tqQmZIQ3lmUEQrUTN6Smh4dGova3BWaVd0RkFw?=
 =?utf-8?B?VlFlUnVOQmVEWVBkYnI0ZEo3d285ZFVSek0rakxIY2V1RWlkbHJDTmZjZk1w?=
 =?utf-8?B?MDZETFB1UWFVRmZUS1orRHVBRVVqc0o1N000K09oTVNSUWE1V2M1MFZnTkxR?=
 =?utf-8?B?d2RGY0dOSExKSzFTRGU5blUxRlZuZjRlTDhDaFpONFZETjNwbnZabUlSSGx1?=
 =?utf-8?B?Z3dxcmJqTVpuNkUrTGg3Mm9FSkExbDRCdjVlSDU5NmFIU1d5MUpsVFJHNnNK?=
 =?utf-8?B?QjlhdUNBUUNrbHpXUjd0V3NtTmk0ZC9PcHI3QzE4YTlIMms3L3JGWHFSVGFn?=
 =?utf-8?B?VkJDOTN2Wjk1Nzk1aWd3R2pnQUNMM3p3SVA5aWtQQmRWRFlyVGM2N0xoM096?=
 =?utf-8?B?NVhTZmtKcnpGdW5xQzdrTUdIb25uM1I3dUs0SnNTK053a1pSNit0U2lQMFla?=
 =?utf-8?B?MXhBejlhS3FxQUlkVXl1U01NaEtuZjUrcXNrR2tiRkY0cUdYZXZDWlp4Mmo0?=
 =?utf-8?B?akgzeUJ5T2x0UWx2YjZrK1JXY0lib05PL0dKeThLWVIxdy96aU82d1U4V2ZU?=
 =?utf-8?B?K2JiRGlSa2d5Q2IwMGUrQUdxNy9xY0F3eEZ6OEJkWXVsRWdpbFRnemNFc2gy?=
 =?utf-8?B?dWhIUlBWODNlZXdwU25zclVLRVZGTElUbnRDblErZUUvV3c2TGhES0c2MlBh?=
 =?utf-8?B?NGFqMlF4U2hoRnhsK1RwMjNXSEtPN0Q5Y0UvSmxIcjF2bVIydlA5dlF5d1Nu?=
 =?utf-8?B?eGNOMG1OMVYxdkt5ZjlKZ2ZPdDNTN3REby82dlV6MVM2QkNLZmtOM2lzTm11?=
 =?utf-8?B?MGxyZzRqQVQ2UUR4Y1ZwRHZaTC9VVjVGeUF4Z1FPK001c1JaMnY1MHpLd0V0?=
 =?utf-8?B?cmhYVWtuUkNDOU5US08wcUNOMWt0R0NHY0RSd0FhclRNbmJ3NVIxd3hucHpn?=
 =?utf-8?B?czBaSysyc2pRVVo3ZkphQUtzSXYvMUl3NlZEV3RPZDNJaTg4STZsdkRwSEVm?=
 =?utf-8?B?b2tIWnM5VmlLS1hQTC9pNUsrQTV1STVuU1pkbkxtL2lTRDB6Z0wxTmdyc1lY?=
 =?utf-8?B?cmo3RkpPWFJBS1UzOE1tKzBVRXZhaklEME9jQjExQnEzKytZSDdmUlM2dUxW?=
 =?utf-8?B?N3dCV1pVYW5KNzc0V0JXSkFqQUQ5cWFFVlF5YjJVR056OHZlZEpJUnZpbFhV?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7870428-71d1-408f-9b99-08de0594ce93
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 11:29:41.4271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGTXrAq1Efyv4njCfFaNvrZtquwOSRkeQ1n6Ax7vluxJ740MyCsl0ZjTva/d6PqvRUswc8/xnQIzaJ/K6T49GpRbrbIURHHC+9iYeSLb4R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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



On 10/6/2025 1:50 PM, Nareshkumar Gollakoti wrote:
> Due to SLA agreement between PF and VFs, multi CCS mode can't
> be enabled when VFs are already enabled.
> Similarly, enabling VFs is disabled when multi CCS mode enabled.

s/is disabled/must be blocked
> 
> v2:
> - function xe_device_is_vf_enabled has been refactored to
>   xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
> - The code now distinctly checks for SR-IOV VF mode and
>   SR-IOV PF with VFs enabled.
> - Log messages have been updated to explicitly state the current mode.
> - The function xe_multi_ccs_mode_enabled is moved to xe_device.h
> 
> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled
> 
> v4:
> - sysfs interface for CCS mode is not initialized
>   when operating in SRIOV VF Mode.
> - xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
>   enablement.
> - remove unnecessary comments as flow is self explanatory.
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h           |  8 ++++++++
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c      | 10 ++++++----
>  drivers/gpu/drm/xe/xe_pci_sriov.c        |  5 +++++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 13 +++++++++++++
>  4 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..986f9cabb897 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -172,6 +172,14 @@ static inline bool xe_device_has_lmtt(struct xe_device *xe)
>  	return IS_DGFX(xe);
>  }
>  
> +static inline bool xe_multi_ccs_mode_enabled(struct xe_device *xe)
> +{
> +	/* Multi CCS mode supported exclusively on GT0 */
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +
> +	return gt->ccs_mode > 1;
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..91908faf3768 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"

beware that most of the helpers in this header are for PF-only, so including them in non-PF code must be done with care

>  
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  {
> @@ -117,9 +118,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +	if (xe_sriov_pf_has_vfs_enabled(xe)) {
> +		xe_gt_dbg(gt, "Can't change CCS mode in SR-IOV PF Mode with VFs Enabled\n");
>  		return -EOPNOTSUPP;

this is still potentially racy, can you consider similar approach as it was done in eudebug [1] which has the same problem but is trying to close the race by using a flag protected by a mutex ?

[1] https://patchwork.freedesktop.org/patch/678636/?series=155452&rev=1

>  	}
>  
> @@ -184,6 +184,8 @@ static void xe_gt_ccs_mode_sysfs_fini(void *arg)
>   * The number of available compute slices is exposed to user through a per-gt
>   * 'num_cslices' sysfs interface.
>   *
> + * The sysfs interface for CCS mode is not set up in SRIOV VF Mode.
> + *
>   * Returns: Returns error value for failure and 0 for success.
>   */
>  int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
> @@ -191,7 +193,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	if (!xe_gt_ccs_mode_enabled(gt))
> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>  		return 0;
>  
>  	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 9c1c9e669b04..0715f87a5ecc 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -153,6 +153,11 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	xe_assert(xe, num_vfs <= total_vfs);
>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
>  
> +	if (xe_multi_ccs_mode_enabled(xe)) {
> +		xe_sriov_info(xe, "Disable multi-CCS mode before enabling VF's\n");
> +		return -ECANCELED;
> +	}
> +
>  	err = xe_sriov_pf_wait_ready(xe);
>  	if (err)
>  		goto out;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index dd1df950b021..e26837091375 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -43,4 +43,17 @@ static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
>  	return &xe->sriov.pf.master_lock;
>  }
>  
> +/**
> + * xe_sriov_pf_has_vfs_enabled() - Determines if the PF has any VFs enabled
> + * @xe: ptr to xe_device
> + *
> + * Return: true if one or more VFs are enabled on the PF, false otherwise.
> + */
> +static inline bool xe_sriov_pf_has_vfs_enabled(const struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	return pci_num_vf(pdev) > 0;
> +}
> +
>  #endif

