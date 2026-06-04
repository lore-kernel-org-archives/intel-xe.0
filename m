Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C175CD6E57
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 09:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BA510E5D9;
	Thu,  4 Jun 2026 09:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVR8B81Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFFD10E5D9
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780566539; x=1812102539;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L2Bxvo6ZCfXq8ekKSeSaJbM+yXJ6lLU4lJcvz4hqY+w=;
 b=NVR8B81Ql54z87rLp3clzj62Gmy+QLHtdWCyrGCu3KpSsqNbp4IUNPwI
 jLXrj6PBwqdVNR6LCUylqFjzc0eODTRM4frD1jNkMZOAve4RssUUhnues
 nNo4Fy3DcIeITZV3QZbKjUI1WIbynRg/CxhDPkyyu5EpAx38yNQ7MMS36
 Nq/i2GtvQ7j+6MUKhSJfGQC4I3n9pdTazP1SLUog0e9R+ZKvCYaL31o47
 /BC58fp5yiqgbmEn19HMyFId/roT9uyOzHIABq2hWWLkoQrwqV1lJMbgw
 NGhOJJ6iirELkOmOv0EOXTjDgjhI8k7ao3fmCXJvO74Rdw93YaB0q6d+I Q==;
X-CSE-ConnectionGUID: /nwoUjd2R3K+oSF+AsnugA==
X-CSE-MsgGUID: XAtnZGyXSUebkmgOJdJRsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81246846"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="81246846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:48:58 -0700
X-CSE-ConnectionGUID: 2cRZ9c9kQnyvF6Zzz5EJ8w==
X-CSE-MsgGUID: AcipqOGAS9Kp3wbewXZVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="238164551"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:48:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 02:48:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 02:48:57 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.59)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 02:48:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFHoYyIGT8SI70fJZ25X+5330ycA0ici8IUu3U7bJBFMuRC5i+l4ANTKiQsaEhlibb1ScBikNbpAdDadXNJmZdX22da+/p+cZWYiZQ0OIIV1RQK7JI5FRRxYXWmWC7/KAaXZiuh1eUt45sMS7KgdIqiEFM666Ebbvsh/gSXqpYgojLZGcpZJv8wPs6sL7topf2xeqS6E0/Adi5jkGaH2K4sr/7Ir4ZweoNVc+NPymk9FZxUBjsjIk3T0KVhc7WDTtAq07NTX67fzOB6BzafY9v4yTBsdLbx/CrJPPnDn6j0Rf7qQ57JXrhw997GEI2Q3vCX6tHeI+LNR/wqXdAQlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r/jd7ogmjkhAWtcnX8nqXu4O/D58qMI84cdAqkFsyg=;
 b=WPa7VE8Xl1xFqj/zSIFr2OQhAYplH8xNytIExAHfOoUD7FNtnyF3rAqMaoPcLW7f/3Cu+rWQPnRrwIdYme4vE5cHQ5o/nUjfSq3yfizqCVkpgjIEYRIzhQH8arIVI20+lI/MagMXFotdotb415T/ltlTehFHc/NEhrJzzDfNRwFmdQvnFlXSPCnyTMiS/DufmZUvVtJn8ZZjzYX0DZqAbT/K82DKT15oI324A3FrshmYAsw6dc+9AlLeIC6/PSrAOKD63kP88tAVGStUYUclz/VvFv/JnCp4spucfviU6Xy5VtM9RUoO0ca0Eoq60PZP6ODb/OmKtF8BEZ5/Tw3A2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 09:48:50 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 09:48:50 +0000
Message-ID: <e32ad075-18de-4793-9f5c-90e7dcbbbd28@intel.com>
Date: Thu, 4 Jun 2026 15:18:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 14/15] drm/xe/xe_ras: Add support to
 offline/decline a page address
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-31-riana.tauro@intel.com>
 <DS0PR11MB87180D9FC0208049671AE89D81132@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB87180D9FC0208049671AE89D81132@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee9a508-4157-4abd-30af-08dec21e7afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099006|4143699003|11063799006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: E5zfbimd9dWYFOvkeYmAa8ucBtGBjr0OOamNUoH23bxrnKv5L8d1Y+Ngza3kh5B4DQK+R67sUZufVH5gX3R5lC+sUXRY0MNWhuo+mYcqrYrw9hluLumaFI8XY78ee64uN+aMxgSaDtL56iSQ6W0DTRgxbMxEu5ptIv+XAuF3/WA/UCxtML09c3jheyoAuYXf5RLoJo8agXUZo5C4RxSuueBPDXvUS2zDWzYy+aZOF84uG67Zi/IvAUdUfR9a2c/kThGhtbiVsoUlIRwQTV6x3bZh7zsmskFdAYczVdTfO6wzkq7BXaZjEA1D3maI/zt2AvVSNf7DosSh0YTjkOCp7rquIBD62CsFZXoZ6M8YsDjYN2ay/p+B5WA/zZlQHvN1xC3CLGPsPq6x+tORN8zNVmeiO38IF02cHkpNMHPLyHCs4k4Iy78xtR/NQKL25RbD7vny1yiYD8dMkzKKNslf+gKaUeOPfFj2WCC0IgvozmOce1NOHLYfkD9+7xPs6IXOw0RiCV4EVJcljMX63ZO+px5seTuZnoZYDQ/gTaUWHtRg5KCC5CGWJZkV39GRtnQrZHYFyAqV2gqPv8msq5SpZP8xZ/zVgEOd79/NFKQmyfe39IJQoLzwzG5rp6QjZQzED7Bp2q1gQ5m3JaYocs5VCPIJVsJdqjPfjbkw8VnFEXmiG/vkRP5KCFSS0C+4d0PRuhb4iG2Dn1R6YqDz+n3/Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjVhSHRyRkswRXNJVHBEdkYvbmZLRGJwOEVJOEZRa2JXKzUzM2t2OTlHWitX?=
 =?utf-8?B?NzNvRThZb0ZQbU5uZUhRdDBpWFpoUUVjZHBXRkVpUTI1N0ltYTR6TlJzaFBR?=
 =?utf-8?B?Z3JEQUNEWXU5dm9LNTMwcFpCbnF3QnNOZklZODhuSUUvbXY2cFBaUGkycTNE?=
 =?utf-8?B?MWlPUTVjTVNPbTQxUzRIbkVGdEhNZUdKUWhKZlFpaDhQb2pEdFpwb2lWWk91?=
 =?utf-8?B?QnV2RlE1WDhJMGNrWUFQc1FPSExzUEFtZ1QvckxJN3p0ZC8vWUNpMnJEdzdF?=
 =?utf-8?B?dnAxUVZyNXM1MHdScUdGb0hBNHRveW1EV3RtQ2lTVXpMcEI3bUxrR2dpVnI3?=
 =?utf-8?B?b0VaM3ZRZEJ4eGs0QWRWZnc2NlA3SmpXa0t6OVRDRVNLVFFTeVp1QmJQbEtJ?=
 =?utf-8?B?THl5Y0cvaHVmM3BXd2cwcHRNMnhHVjdOcS9RZGpHZ3ZQSjlJa0ZLOUIrMTBa?=
 =?utf-8?B?SFk3ZWpwa1Jqa3FRTm1DUFljUlVjeGFKNVlRZ0lOLzZ6RVJTZ20xVHl6UnRZ?=
 =?utf-8?B?c3QydHBYa3lCeFkybXRuM3N2UFpybWx4aDdYSGFPTTZRbDVic3VVRTVidjU0?=
 =?utf-8?B?V0FZMjNRdmFFb2FFSDc0UlluSUhxMTVDVFE2bU1VQ0NZcDlsVnhPdDZraWl6?=
 =?utf-8?B?c0xSMkJRUjNVTlB6d1lDR0YrblE4ZjB2NmJZT2dpUHB4bzg4Z0dxMDRHWkxJ?=
 =?utf-8?B?UW1iN2c5c0U1WG56bVNjVVdjVzh4clRrb1BWcXl6WVlySE90Z2djalhLbTd6?=
 =?utf-8?B?Wi8rU2QrN0hOTzZuWi9kVVc0eTRyZk5icFo1ZDh1L1FrbWoxNlAzbytmNWhE?=
 =?utf-8?B?eCt2YU9LUjBuS3pLbEN4K1luNHA0dWdBV0d4WDZmNDNEVWpaVHFlQjRJcHlY?=
 =?utf-8?B?b09jKzQvZU5xUjdDa1kyQTVxQVY0Q1pQMTlCY2N0d3ZxK0t5UUFhb0pyL2lE?=
 =?utf-8?B?d2F0U2tkdjZHSVFxYzZUWEhLNXQ0K2dqTE9VOXJCQVVFZ3RjaTEwdlZ5eFVz?=
 =?utf-8?B?NEJxb2hOWEFEUmJhdW5VRnA2emlqQmlwUzlkU1E1YkJJem9BV1J5R2xoQ0V0?=
 =?utf-8?B?dWtQWURXc2lYMGRVTk8rVFY0WnZ6Ty9Ob1RLQm83YUFXZ09rVlloeFJPT3Zq?=
 =?utf-8?B?dDB3ZEN6Y05rZm5telQ3cGtFUFNhcEludnRPNlBOVG40elRqWlZuVW10aEJl?=
 =?utf-8?B?ZkM3NEhIaWdtZktoTm90aWhHdGlFVkFtRnNWWVAvZ0JxcEZmYzk0Kzl0SXpj?=
 =?utf-8?B?dXpTWTBDUEk5WkphblBwN2xUMUlXOVlac1hDL3ZQN3ZBc1J1K2xTYkt0TGV2?=
 =?utf-8?B?MXdxTkIwZFZOR2ptTUNxR2VhY0NRcTFVZzVtOWdGcXJibkZMOUs3RUoyNkcw?=
 =?utf-8?B?Nk51S2gwWXpaS2NxRFlGYmtpZ3VMUkd5Y3VWTnRQNFNqalZkL1l3Rm5ZWlN5?=
 =?utf-8?B?WUNHOEN4MlRGVmF0aWZUTlZqQVA2TWY4OWVST3VKZU9SbFVLS0U2SmRQVERT?=
 =?utf-8?B?cHhOb3dMYnBzZDZLSnFOd01UZVZIQklkblc0WENPbHI1dFZtblM5dVAwMUpO?=
 =?utf-8?B?MHZBRzZ6L1JjT20xY2REVDJSUHBsKzZvd3VUTXFMS3RaYVN3TFNyTlcyQWw2?=
 =?utf-8?B?WDJkc09JbHJpRzVVUG9tcGs5NVJmMWV6REwyVzZwc3I3eEtTNVFXdjI4QUtr?=
 =?utf-8?B?bmQva3FrOVBDNGNWZEZzT09RMytaa0lIeFM4QU5hZ1VidVRWVUM3STJOb3dX?=
 =?utf-8?B?VmdaSXVDYU5YT0t2MDl0amJoUTVqazNoMDJ3eDRMNE0wMmoxZUl0S1ExRjcr?=
 =?utf-8?B?YnRybTJQZTlHWWYxWjBOU0g4MzUvcmRTVUlIUUpKUVpGV2xxU3hRNFo5Szhi?=
 =?utf-8?B?MkVtRkNJbVlBcDlEWUZjZ3l1WXJEdXBjNktndm1oSGMyNmhDQS9WRk9FNk5O?=
 =?utf-8?B?d0xZOWhUeldwQUYvUDBvSkgvK2lXeTg1WTV5VFRRWWRVREVScWVXOVdqVmlQ?=
 =?utf-8?B?Y0xpRWpyV3lnOGJkYXJyM2VGNGl0Y0hPSHgzbDlnVisyS2RBRFJ3azQyYUk1?=
 =?utf-8?B?cXdKN3NlWGl1MG9BSk5SNHExakN3eWtqcmhmMmFxKy9yWXBnQkJQNHkzNXRK?=
 =?utf-8?B?cGJmSVN2M29WSG9oTmh4WlFwYWFvRmZMRklET292RnRtdTlrTHJPejUwZ1pE?=
 =?utf-8?B?UEg5M1QyMExaUzZ2MnFKVWcwYmtsVmdlaWlwZzNrejQ0UU1UWEs5NzRzS3FK?=
 =?utf-8?B?VVBJYi9QVU1PTGFCaWpYNzBLK2dwSXJkT0xjbDNaQUNNemNRdWgwTitJSHZV?=
 =?utf-8?B?blFsdHdoVE94TXJic2ZId1FKN1BsQ0JVRzJyU2x0c2hZR2dTU3ovdz09?=
X-Exchange-RoutingPolicyChecked: WP3kpsVotl8VsB5O9Byv+V0XCRY8pwT+G+rpFZOXRhI6NKMkfxo9j4iOpkjqt2oqfy5hl/tGXV2Gw9RkGymV4diigWBrFtyOpzL3C8kgTGKknnT41O2lvTEM8ei2du5Ofdm12vZBgkQif2agsXFoTRDtbF+7gb/heS9rskC10J6jgno9JaLlqr5u+YAxw0/KAZfVc3MWtp8/qVbeoDc4uvCKFZ7HRoteE1ecXBk1D5J4Jkp0kZk74dLQjkM/qaff5j2mBA0Wv1pHzPx0GbiTvGaQC19BBmr+K1DUVnX7qPOiq2bj7uKWcNF6MDVLpRK9BCB8PnQywKikDnICirO0Cw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee9a508-4157-4abd-30af-08dec21e7afd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 09:48:50.2473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tm/RtUHlxjDPjC/2jffRolHqeDBo4WmHueBXP5ivoZIAlEoutwilMD77oLLxA6SdmeYpsI88FVrYb2nheLwxmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
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


On 6/3/2026 8:08 PM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 25 May 2026 15:37
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: [RFC PATCH v6 14/15] drm/xe/xe_ras: Add support to offline/decline
>> a page address
>>
>> This will be integrated with the related address-fault handling flow once this
>> patch is merged.
>> https://lore.kernel.org/intel-xe/20260506141143.4033299-12-
>> tejas.upadhyay@intel.com/
>> Sending for initial comments.
>>
>> Add basic support for sending page offline/decline requests to system
>> controller and use it for device memory ECC error handling.
>>
>> Handle return values from xe_ttm_vram_handle_addr_fault() and take
>> corresponding action. Pages that belong to critical BOs cannot be handled by
>> offlining and require a SBR (Secondary Bus Reset).
>> Pages that are configured for log-only handling are declined.
>> Other eligible page addresses are offlined through firmware.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 124 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  58 ++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   3 files changed, 182 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> 2f9d25bda3f9..32c8ab587e2e 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>
>> +#include "xe_bo.h"
>>   #include "xe_device.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>> @@ -37,6 +38,17 @@ enum xe_ras_component {
>>   	XE_RAS_COMP_MAX
>>   };
>>
>> +static const int ras_status_to_errno_map[] = {
>> +	[XE_RAS_STATUS_SUCCESS]			= 0,
>> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
>> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
>> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
>> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
>> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
>> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -ENODATA
>> +};
>> +static_assert(ARRAY_SIZE(ras_status_to_errno_map) ==
>> +XE_RAS_STATUS_UNKNOWN_ERROR + 1);
>> +
>>   static const char *const xe_ras_severities[] = {
>>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
>> @@ -72,6 +84,111 @@ static inline const char *comp_to_str(u8 component)
>>   	return xe_ras_components[component];
>>   }
>>
>> +static int ras_status_to_errno(enum xe_ras_response_status status) {
>> +	if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
>> +		status = XE_RAS_STATUS_UNKNOWN_ERROR;
>> +
>> +	return ras_status_to_errno_map[status]; }
>> +
>> +static int send_page_offline(struct xe_device *xe, enum
>> +xe_ras_page_action action, u64 page_address) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_request request = {0};
>> +	struct xe_ras_page_offline_response response = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return 0;
>> +
>> +	if (action >= XE_RAS_PAGE_ACTION_MAX) {
>> +		xe_err(xe, "[RAS]: Invalid page offline action %d\n", action);
>> +		return -EINVAL;
>> +	}
>> +
>> +	request.page_address = page_address;
>> +	request.action = action;
>> +
>> +	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> XE_SYSCTRL_CMD_PAGE_OFFLINE,
>> +				 &request, sizeof(request), &response,
>> sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: failed to send page offline command
>> %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "sysctrl: unexpected page offline response length
>> %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = ras_status_to_errno(response.status);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: page offline command failed with status
>> %d\n",
>> +		       response.status);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int handle_page_offline(struct xe_device *xe, u64 page_address,
>> +bool send_offline_cmd) {
>> +	enum xe_ras_page_action action;
>> +	int ret;
> Either initialize ret = 0 or add a temporary assignment until the TODO is resolved

Sure.

>
> Tejas
>> +
>> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>> +		xe_err(xe, "sysctrl: Unaligned page address: 0x%llx\n",
>> page_address);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * TODO: Call function to handle address fault
>> +	 * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
>> +	 */
>> +
>> +	/*
>> +	 * Handle return code from address fault handling function:
>> +	 *  0: Address is valid and can be offlined
>> +	 * -EIO: Address belongs to a critical BO that cannot be offlined
>> +	 * -ENXIO: Invalid address
>> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is
>> not to offline
>> +	 *
>> +	 * For any other non-zero error code, skip offlining.
>> +	 */
>> +
>> +	switch (ret) {
>> +	case 0:
>> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
>> +		break;
>> +	/* User policy set to decline page offlining */
>> +	case -EOPNOTSUPP:
>> +		action = XE_RAS_PAGE_ACTION_DECLINE;
>> +		break;
>> +	case -EIO:
>> +		xe_err(xe, "[RAS]: Page address belongs to critical BO:
>> 0x%llx\n",
>> +		       page_address);
>> +		return ret;
>> +	default:
>> +		xe_err(xe, "[RAS]: Failed to handle address fault 0x%llx: %d\n",
>> +		       page_address, ret);
>> +		return 0;
>> +	}
>> +
>> +	if (send_offline_cmd) {
>> +		ret = send_page_offline(xe, action, page_address);
>> +		if (ret)
>> +			xe_err(xe, "sysctrl: Failed to offline page for address
>> 0x%llx: %d\n",
>> +			       page_address, ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static enum xe_ras_recovery_action handle_core_compute_errors(struct
>> xe_ras_error_array *arr)  {
>>   	struct xe_ras_compute_error *error_info = (void *)arr->details; @@ -
>> 135,14 +252,17 @@ static enum xe_ras_recovery_action
>> handle_device_memory_errors(struct xe_device
>>   							       struct
>> xe_ras_error_array *arr)  {
>>   	struct xe_ras_memory_error *info = (void *)arr->details;
>> +	int ret;
>>
>>   	if (info->category & XE_RAS_MEMORY_ECC) {
>>   		xe_err(xe, "[RAS]: double-bit ECC error detected at sw address
>> 0x%llx\n",
>>   		       info->sw_address);
>> -		/* TODO: page offline handling for double-bit ECC errors and
>> return accordingly */
>> +		ret = handle_page_offline(xe, info->sw_address, true);
>> +		if (!ret)
>> +			return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   	}
>>
>> -	/* Request a reset for other device memory error categories */
>> +	/* Request a reset for other device memory errors and if page
>> +offlining failed */
>>   	return XE_RAS_RECOVERY_ACTION_RESET;
>>   }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index fada9802667e..af03921c7cf6 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -32,6 +32,40 @@ enum xe_ras_recovery_action {
>>   	XE_RAS_RECOVERY_ACTION_MAX
>>   };
>>
>> +/**
>> + * enum xe_ras_page_action - Page offline actions for page offline
>> +request
>> + *
>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to remove page
>> from
>> +queue
>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to mark page as not
>> +offline
>> + * @XE_RAS_PAGE_ACTION_MAX: Max value for validation  */ enum
>> +xe_ras_page_action {
>> +	XE_RAS_PAGE_ACTION_OFFLINE,
>> +	XE_RAS_PAGE_ACTION_DECLINE,
>> +	XE_RAS_PAGE_ACTION_MAX
>> +};
>> +
>> +/**
>> + * enum xe_ras_response_status - RAS response status codes
>> + *
>> + * @XE_RAS_STATUS_SUCCESS: Operation successful
>> + * @XE_RAS_STATUS_INVALID_PARAM: Invalid parameter
>> + * @XE_RAS_STATUS_OP_NOT_SUPPORTED: Operation not supported
>> + * @XE_RAS_STATUS_TIMEOUT: Operation timed out
>> + * @XE_RAS_STATUS_HARDWARE_FAILURE: Hardware failure
>> + * @XE_RAS_STATUS_INSUFFICIENT_RESOURCES: Insufficient resources
>> + * @XE_RAS_STATUS_UNKNOWN_ERROR: Unknown error  */ enum
>> +xe_ras_response_status {
>> +	XE_RAS_STATUS_SUCCESS = 0,
>> +	XE_RAS_STATUS_INVALID_PARAM,
>> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
>> +	XE_RAS_STATUS_TIMEOUT,
>> +	XE_RAS_STATUS_HARDWARE_FAILURE,
>> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>> +	XE_RAS_STATUS_UNKNOWN_ERROR
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across all
>> products
>>    */
>> @@ -227,4 +261,28 @@ struct xe_ras_page_offline_queue {
>>   	/** @reserved: Reserved for future use */
>>   	u8 reserved[3];
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_request - Request for page offline
>> +command
>> + *
>> + * This structure provides the request format to offline/decline a page
>> +*/ struct xe_ras_page_offline_request {
>> +	/** @page_address: Page address (4KB aligned) */
>> +	u64 page_address;
>> +	/** @action: Action to be performed, see &enum xe_ras_page_action
>> */
>> +	u32 action;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_response - Response from page offline
>> +command  */ struct xe_ras_page_offline_response {
>> +	/** @status: Status of the page offline request, see &enum
>> xe_ras_response_status */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index b7a5e82c6eb0..12ffd011ee8e 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -24,12 +24,14 @@ enum xe_sysctrl_group {
>>    *
>>    * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a
>> + page
>>    * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages
>> from flash
>>    * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued
>> pages from firmware
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
>>   	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
>>   	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>>   };
>> --
>> 2.47.1
