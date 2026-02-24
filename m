Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7831F4BB8E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 22:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F03110E332;
	Tue, 24 Feb 2026 22:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euQKwreO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920DC10E332
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 22:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771971105; x=1803507105;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xLvAiF0W/kmOCZNcXhPZ0W9spvDDpvm+ahI/gCERl3Y=;
 b=euQKwreO+d9uH1uT/jzvjM3yRoSzKAf7X/gpTR5reObFGQlG4Yfe8/sg
 L5qrj2tCjxFi68v2yL+PMlb5YoiX3eRyxZRJueOuBoCid8rWyY+K95hny
 pNQKLqnjo7L31CGkvYHyMeHbQg8yvhmtjL9yBoNwMxgArwhb+QfLjSxkS
 vAcOmD33pHX7hfSPI6LMWAwFVJ3wu4nRCkLQuCLo1acxfTw4FJXjfEq5c
 dKOJjhxyO+99xlppW+ExWJnCwZzkUvZysFK/oLsT9qM/j6aCx3U7UEdD8
 B+5LVh0HfDHHjuE5iytkSyzS1v4lo8ju5dallbohsWoQm/xpcQ+IVarK0 w==;
X-CSE-ConnectionGUID: AekRsUq3QR+YFTdt74+NhQ==
X-CSE-MsgGUID: cG34SfCORweUCq8W8u/xeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76609658"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="76609658"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:11:45 -0800
X-CSE-ConnectionGUID: IXcY6oPySimm6RtMmVOjHQ==
X-CSE-MsgGUID: BgESG7bOQ4KQMeahBWrLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="214224645"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:11:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:11:44 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 14:11:44 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:11:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcJwOdtCVpgLricMeGBo68K6sH2JbAUkORZDNHS3VXFsPVt7EKgLduk8j1Tb8xY5yfwFJx4OZAa06Jnyoa9ydOQiiEBYmISF0UvgOHtj3MZ2+LkBmLqhsxmVvmGeWmPzsRU3ZnPbQm5Ay5LCvUnSQ1/spFNeqWr7crrfzXj7e1syDkR3ITwGA2bU1lRd6u8ZxR4wI7mtiY+9EYzm3u48lHcT6WfCeCk9EzC9cDJOBDpoCIdAGZb+EPRHbhbbruR1TBun9R9Pl1spV1o+gW/entVC4xBCojAlVwcnjtsPUtix2deinKbk0LPhYuncLNfSt2XPXMUdSumGxn5zFXLkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0zpscSh6A6XQPdM9/BGXkjpvZB9XGKUp4dgkmIBHms=;
 b=YHy4DNaILfDaY/8tjvwc7jmpf9m7Pzae33KMe6hpe7TL0UJq5n3W8myw4T8BjziG5J+qDdId8lHwiJpTkCv4hOfEhWSO0qsCTA0MGOAtwdeBpkL4tM95RrTbkRk/cUvY5O9kHlv3VaHMnremy1O2JDLLu/+FrWIx6Op39RR8jsU2lskuERjVN59lu2cCVD9KILBCTeYJXv2KJKB32eHnezqEZ1Aiaj6Gg0oM2/StuJ4kIEDxHncyJIKJneL5hxEoW5hjuO4ht+MQVU9RtzRAAUjrxkjGSYgPSqVWf2DUs+TWNMwKn2McCmby2zucHM7WnZ0CU/xrFMJW33eetGeKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5877.namprd11.prod.outlook.com (2603:10b6:510:141::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Tue, 24 Feb
 2026 22:11:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:11:41 +0000
Date: Tue, 24 Feb 2026 14:11:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v1 5/6] drm/xe/bo_evict: Introduce xe_bo_restore_map()
Message-ID: <aZ4iGmnnvHK2fZ9M@lstrano-desk.jf.intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
 <20260224102618.3105171-6-raag.jadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224102618.3105171-6-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0326.namprd04.prod.outlook.com
 (2603:10b6:303:82::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 948119c9-f71f-4c05-a882-08de73f1b002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUdLeUttS3RSa0ordjlZR2EvazhNeml1L0N3OEhud25jNm5veVV5M1I5L3Vl?=
 =?utf-8?B?KzVBejJaMGh2WVMzcGxMZGdwL1pranFPTmhLS2pqMW8xZVJCN1hZZDBiNHZG?=
 =?utf-8?B?SGlpRHNvMnlQU2xoNHA3aVBkTzZ2eGRiMUZaK2xjYzhJeXlycThEZkVqaTU4?=
 =?utf-8?B?ZVgzVUVjblFXUHdVaVdxTlJCMjNXNDZMWHNaTVByWGhXK01ZcitjdThYalJS?=
 =?utf-8?B?MmgyYUF0aVpNdWdNTElMKytxVHBZUTNPRzBINmhVc0sydXU0NVh2UFN4SGV4?=
 =?utf-8?B?YkdUd01kU1pMY3RwZFZ1S2JXZ1M4L1Nkbm1tSm04STV6eWJieERucHVEeDFk?=
 =?utf-8?B?VWFSakRXQWpGNmp0THA2blB5NDIzU3VLWHRGNk5vdGdNbXYrZk9jLzQzc01w?=
 =?utf-8?B?RU5jcDF1OGJNTUVieHVBZGRNR1hZei9TdU82Q2VnZjV3M1dGVnlHZ2Nxc0gw?=
 =?utf-8?B?aDJhVkx6ak1aRTJNc0YxaGtVMWZnK3dwVTNmTVZ2V203OWh2cVRWVXJWb2pv?=
 =?utf-8?B?eW9VSDRNbGJzaDJWbTA0bjVxcGwvcUtHcnNGVWNHRlBmb3hqRGtUUVBsWTJY?=
 =?utf-8?B?aTVVQ0hjNG5ibU9RTk5pb0NZUVhTNFZlamcyL0YvSUhmV2M4UXlNRDBjVzQv?=
 =?utf-8?B?VzNRcEFFZS9tWTlZMWkvTHdjTlBCMVhvcFNMbk45amVPczY2L1FqcEZBZXN0?=
 =?utf-8?B?REc0TCtLVVZLVDl1UXlkTW1sNndNMktXZXUwaE0vQXVIb0VOMkhnK0pLSDhU?=
 =?utf-8?B?dUtNcDVDNFgrb3k1ZWZoUkt6aXNYdE50NzJ1TFNMQUptb3kvaDNNQ09KUjN1?=
 =?utf-8?B?N0VVMmtSNnpzcElkbWZqOXRNblV5MVJFMXUyVkFBSTBCNGhYeXJSUnlUS2FO?=
 =?utf-8?B?SmI0bWJFendVT2x4TU1lOXp0WnBwcUtrZ1RxK2pBMys4Z3FNWHF4a2VIOTRt?=
 =?utf-8?B?ZFk4Q3dKclZFYjhFdmxGMGM2bDhJWEQzc21MUlNzU2JzbXFzanp4NmZ2dzly?=
 =?utf-8?B?K2pCSVJpVHYyOTVZZGwrMEVET0J1SHdSZjRncnlaWkQ0ZHcrbVREdk8zclIy?=
 =?utf-8?B?MkVKUzZUbmxtdlVYYnh5bU9CeWNFRC8vc3RZVVJ5OG1NRjBTcG9IT1JwNU1p?=
 =?utf-8?B?ZkFIbW9jSWZtd2RON1FkTVQ5Z1lsa1IxTkxNUFV5MnVxRGNDSWxsdWlBQlFG?=
 =?utf-8?B?KzcrZkZ5V1BGeEp2NTBCdmV2T282QWhHR2JnZFhkOFh5aE1vODg5bnNEODVl?=
 =?utf-8?B?SldLamhXM3BITG5PUng3dnEzYm41Qi92a2NlTFN3RGlFc29hSklXVlRHZzQ4?=
 =?utf-8?B?dVREN0NEZEx5cWVlNFdSUTlDM3lBNzVveEZYb0JlNWord0l4NGNVTUVXb3k4?=
 =?utf-8?B?cy8zb0ZZSXN5R3pYOFFxMHp3TXJSS1JOMklRY3kzQyt2djF2RGlRa0hDZSth?=
 =?utf-8?B?THBVc3VyazBtd2JxVzkvZ1lXL1ltUVJQWXdsSWlheS9IK1JrWEpMS1dsS1VJ?=
 =?utf-8?B?Y3lYVSs1N09qaEtYdWJYVllNZ0dpWENBUmtYRS9vWHpHSm5sNFcvTmY1eGND?=
 =?utf-8?B?S3JmZ3Y1WkRCeDl4T2l2Ky9Eaml0YitBNFZqRHRwc2Jtdkt2b3A4TzJOLzEv?=
 =?utf-8?B?SWtJbzFnQ3M2UWJnTzBFYnJNRC9IRklMQkhidWNFWWZyTUpVcXREaGY1R3pl?=
 =?utf-8?B?QlJYaTYrYVJ4ckdTdUxHUWtJVFhpUllGakRnNkFOMDBpZEdwWWhMcW1XMEl6?=
 =?utf-8?B?WDdzZGpUVG5JRUdWd0J3SCsyVjVCaC94QXZiaFhEdlA4Um1xdHFzQW9FN1pM?=
 =?utf-8?B?dG1pdDZvSFNjenF5V084UGYwTk5mMkFuT0VSWEM2ak1sVTUvYXBIMURpRnYr?=
 =?utf-8?B?aWh6NEdDeURFK09kTlU5Nmc2MVJKWFl2Z096QUcyVXBGbVhyYy85ZnJ4U3BL?=
 =?utf-8?B?TnErM0JrRTR5a1NVcTN4U0tnN1UvVjgrU2NYNnNEYmVuekV0VHZVR2gxcnVD?=
 =?utf-8?B?ck5udUFhSm16SFRteDNYa0FrdnF2WHg5S2JvaU05SWVkQXRtekZsUTRXVlk5?=
 =?utf-8?B?QThKNCtWNmdYRmhQRFNZQURwRnczSWc0US9BS1o4b1NYeE5iZVhCZWNCd3h3?=
 =?utf-8?Q?2+EU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Znd5WGdZcHVxcWdWUzRuajI5KzJNaDhSQVluWFRTOEgyL2QrR08xcGhKQUN1?=
 =?utf-8?B?ZllwTzhYRWdTMTVyalBPQ1pNd1o3TmFZOEs3NHlnMllwLzU2OWNXNmIwUTNi?=
 =?utf-8?B?THNRZ0JOM0RtU2RXbFR3V1NyK3NNdGJUTzZacmd6Z25qVUFpZVhpSTlkbjVL?=
 =?utf-8?B?MHlvSzA0R2pmMDhzbm1WWHdsYWd0cjQ3SWZqWEhwWU5HWWdHS05ML2w4aDJG?=
 =?utf-8?B?WGM0UHRvZ0FSUkRxV3BUUDJGRU9vMTBVZjd0K0ZyMHRYeWRFczRta1dzWFFG?=
 =?utf-8?B?ZjQvTkxJdVF5OE1NOTNLd2tJeElwaWMybXlrYW9WemRPSjFGODEzK2JSaTk1?=
 =?utf-8?B?bUE0ejBXY2ZWdytCOGthMXBYQU5JUjQrLytML2FQV1pCVkhiNk5xZFRvQm9N?=
 =?utf-8?B?Q0RhSk8ydHk0MnAyWld6dHhVWDlHSnVZTDJMOG5LQTV6L1puRE1FdDhKcG40?=
 =?utf-8?B?VVorajZNOWQvRDl4WkxiZWVVQXFZS2IrbDRFcjdaUjYyWXEyS216MDRiSG5U?=
 =?utf-8?B?aWhQWVF3UGY0UHBYLzltdGdkaEl0elBaWUIyQll6RWV3eXBzSTQvUmFqWTBz?=
 =?utf-8?B?ZjQrb1plZ1Z3aHBIQ0tqZlM3RDlzK2Q5RWMvbTFvM2krdnhtRHd5U2dBMGla?=
 =?utf-8?B?dUczaUlYdjNCa1d6SFRwdmE5OUxGVUV6ZUpZRWE2SWx3dDBEclZZVTV2cVF5?=
 =?utf-8?B?d2pkeDhQTFo4Vm9QQ2FLKzFUTERScXVRZHArem5TaGxyVWZrUlBabnFCTkR6?=
 =?utf-8?B?RHR2czl4TnZoUHRrSVFjeHFBMmhubHBMelBOUUxKdWs1WjArOUpOWDlCcndh?=
 =?utf-8?B?R0VveWN6bGcrWVlTMjZlakw2Z0V5NWtab2QrdHlCKzcwK2czOXZLNTB5NTZX?=
 =?utf-8?B?TjJ5aURyc0FKcG92cnVuWFBQN21BQ2h3d0krSnR0QVJ1LzlOcXpVc0o1U2Vm?=
 =?utf-8?B?QTJxNEo2Y0IreGc3T3gxSFVlK29EYVZLdmJCdms3YjhaTjYvRXcvTUJnYUxO?=
 =?utf-8?B?UmpmSWFmT21NRTMxODRCcjNHcDVpVmV3NVpuVHprakNySzc3QlkwdUwxMWRD?=
 =?utf-8?B?Z0RRUWRBbVJOQWVIRzB0VEdHNXdoT0FaRnppVG8rSnFNOFZQc01IZHJPWlFu?=
 =?utf-8?B?cEM4SXZnUWdVVXhuREhFdnh6ZFVKMEN1NXRwcUlHVVU4MGdSdG1SalNKQWtI?=
 =?utf-8?B?aHBLSkpZNk54dTdBMWR4cnpPV1ZkVGMraXQ4N0ZwT2tyTiswM3BreHBiY05P?=
 =?utf-8?B?ek1PL0FJOTd4MENRSFlycUxsd0VvZnpjb01Jd1NQOE5XZ29kK2M3WEFnREpl?=
 =?utf-8?B?Q3RwWThnK2UzcXM4T1k1U1RZK0djRWFxcW1aYnh3ZVlWMWVkWjNwZ05MQld2?=
 =?utf-8?B?MTJSL2dBTnEwcmFIc24rZS95aFAreFAxQThjUzZUeXBMdkcvdCtjelZQdk9r?=
 =?utf-8?B?RFFNUkpITVhPOC9XakhZS1dVTnR0QmpuSlNqWXNqcUZ4ZldLRmtYWWhPZjRY?=
 =?utf-8?B?SmorbXFCVHFaNnVBVHlWaE1VT2VobUMydmpHQWJlcXdmWjV3WUtiQU5ObU9s?=
 =?utf-8?B?RUZhK1dSOWxsS3V4aFZVOWJmMHprZDZxa0UybkVpTHZWaXI2bjNOYnlxMnk0?=
 =?utf-8?B?NkkxQ2VBZUx1TEhtcHBpRWZ1elR4Y1prSjJDTjRwVkY5OVZwNmxTcmlvcUJ5?=
 =?utf-8?B?MTYzWFcrUm9IVWZSN2ZhWkl0OUV4b2xaZzJkZDJLQ0dqM3RkcDZkcXI2K29B?=
 =?utf-8?B?VEZ1VitjWTIyUGwreWM4MDVydGZrZEdlNDVYc2hJbWhsbEJTNWdLWWpiekd1?=
 =?utf-8?B?Q0hKUEhKK2VZUWt2cW9pWFlxcWNYeTQrd2RDTmNCZ2Z3Rm1uUUZNbHQ5ajEx?=
 =?utf-8?B?WHh1dW85RS95UHFrRGRtMks2VHdaMkt1MWdKUThjSEtjMTVGNllZTEhGMjQ2?=
 =?utf-8?B?VFUvaWhZMmJQeFVOT09nY0pBemVpYlZUazRjWGRHWURlRE9MdzBvMWw2Umlk?=
 =?utf-8?B?OVZ0Yk44djhyMDl4dURwaWpWa0NQYkR1WVVGdFZaR1V4QWRqOC83bWE1b2Vn?=
 =?utf-8?B?bEhrVUhkemNNMnAySlhvQTN3VTE2Wm9iUnNTclBSWmMvMk1ZTFFCVkUwU0ZH?=
 =?utf-8?B?amUxSmh5OGozVHZCbFlObjc3aEtBbkpEdjllQ0ZpRk1ZZ255VVBTN1Z0RUk2?=
 =?utf-8?B?dWJJbXJ2Ykg2Yno3cWpSdnVlRVNxSjAwSXA2UnR5azVEZERNdkZFQzIvVWFC?=
 =?utf-8?B?NjNBSHVramFEOGtwdnA1UWhZTmU5dTNtcXo4SW1LaE52QmVtUFFFYThvYkdq?=
 =?utf-8?B?dGpzUEIyZnBwTmlLd09oWlEzaFQ5b1FsWXlXMGkvUGFiRTE4cks2N29hbUsv?=
 =?utf-8?Q?4vS2GouUqfqoahRY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 948119c9-f71f-4c05-a882-08de73f1b002
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:11:41.2286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9SWfTtWdzQxJfTSsIm3OlFffdlCTCO6ktUFOeuI1O6viSv4VouvhqPTog3rSchfJq6CeZqqExcbOXvoqMPVMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5877
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

On Tue, Feb 24, 2026 at 03:55:18PM +0530, Raag Jadav wrote:
> In preparation of usecases which require remapping kernel bos after FLR,
> introduce xe_bo_restore_map() helper.
> 



> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo_evict.c | 34 ++++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_bo_evict.h |  2 ++
>  2 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 7661fca7f278..0624c3039cd7 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -189,14 +189,8 @@ int xe_bo_evict_all(struct xe_device *xe)
>  				     xe_bo_evict_pinned);
>  }
>  
> -static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> +static int xe_bo_map_ggtt(struct xe_bo *bo)
>  {
> -	int ret;
> -
> -	ret = xe_bo_restore_pinned(bo);
> -	if (ret)
> -		return ret;
> -
>  	if (bo->flags & XE_BO_FLAG_GGTT) {
>  		struct xe_tile *tile;
>  		u8 id;
> @@ -212,6 +206,30 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
>  	return 0;
>  }
>  
> +int xe_bo_restore_map(struct xe_device *xe)

Kernel doc. Maybe also explain why this function is needed during PCIe
FLR in both the commit message and the kernel doc. I assume it’s
something along the lines of: “During PCIe FLR we repopulate the GGTTs
for any kernel BOs required for driver restart that lost GGTTs across FLR."

Just guessing on above but if we had kernel doc I wouldn't have to.

> +{
> +	int ret;
> +
> +	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
> +				    &xe->pinned.early.kernel_bo_present, xe_bo_map_ggtt);
> +	if (!ret)
> +		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
> +					    &xe->pinned.late.kernel_bo_present, xe_bo_map_ggtt);
> +
> +	return ret;
> +}
> +
> +static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> +{
> +	int ret;
> +
> +	ret = xe_bo_restore_pinned(bo);
> +	if (ret)
> +		return ret;
> +
> +	return xe_bo_map_ggtt(bo);
> +}
> +
>  /**
>   * xe_bo_restore_early - restore early phase kernel BOs to VRAM
>   *
> @@ -270,7 +288,7 @@ int xe_bo_restore_late(struct xe_device *xe)
>  	return ret;
>  }
>  
> -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)

Same as above for kernel doc, commit message, reasoning.

Patch looks sane enough though.

Matt

>  {
>  	struct xe_tile *tile;
>  	unsigned int id;
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
> index e8385cb7f5e9..d4f5b87243e7 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> @@ -14,7 +14,9 @@ int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe);
>  void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
>  int xe_bo_restore_early(struct xe_device *xe);
>  int xe_bo_restore_late(struct xe_device *xe);
> +int xe_bo_restore_map(struct xe_device *xe);
>  
> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
>  void xe_bo_pci_dev_remove_all(struct xe_device *xe);
>  
>  int xe_bo_pinned_init(struct xe_device *xe);
> -- 
> 2.43.0
> 
