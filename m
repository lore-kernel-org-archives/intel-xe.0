Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83985106B504
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 21:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D24510E19E;
	Wed, 25 Mar 2026 21:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJH5AKPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5359410E19E
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 21:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774472405; x=1806008405;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=LJH5AKPz3gyu2l93AKGX+nopqs5XoO9aaNUqlNnkqdiFu5XJSG3hxHa4
 2It8LtCE9wekoWQmqEpO3mlMnHGXO3xANwqAFpMoZM1nYb2Ca+vTddA3u
 HMbnUpZu2YJWfgX/18HXkdUU+S+drXviN6muWqRU6Qvk19QsRVXg4Am7O
 OooOP3PMzpAo5mAnMcBuBUlUfRootzUL0IGAtItXoVUKyTrTFfNN/8Xua
 8nZ8tAm3h3ouP/3cSmtBy57FADneh5o0k/a+J1pCNl0DO3jl2yV9Qpw48
 ++VrfnPEDEjptnouEUMN+W7aO0Qzy15HiPDPhmWok4NQgbrLiXTDqsqzF Q==;
X-CSE-ConnectionGUID: IL+xLG9EQrWawLHRfqVKtg==
X-CSE-MsgGUID: 85w0yLXISGOU3425L+H81w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78119527"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="78119527"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:00:05 -0700
X-CSE-ConnectionGUID: tZWIOx7aTiaM36UXGaKLtw==
X-CSE-MsgGUID: o+BP7bYSSqWAzCWdgZbTFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223992553"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:00:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 14:00:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 14:00:03 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 14:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmNGJ6nkI7xscKid1XAc6ZSJsWj3ehu1eaw8m8RBboBXFSqJk/gyJTj8OpVQ3an93LW+yJv7tgebEFqWUkqZxS0FvAwpIIXksv1iIWBPOHhGXMzSeGI8MIomNPR6/qlvLWQz6F/8d/YJZmJViviCZ9NF5QKl5Fyk+cozjRXosYn9/7XUmfrLKGnhmH88M+mLja5MZZPt5B5Gxg/9O41Fq+Xc2vtSMCyCc0ucrmwl5giKA4iKQiZ7UxaGyG9Cwm+ueTBjygoqJ/suSO2foZD3QFOaCPVwVwv8PH9Y9ladPStp9v1P79XKETGXAHWkfA8y91ejyYCCB7zbzmhPe5oXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=HM6Te8AfCJtVSrF+5/+FXCIjaS6RwD0oNoQgQQ3eHO3ETr2SFYNSfsf2dvpUHsUEfFC3QIfdubAxk7111r8l68PEdKtGmeXfKk0ksJajAtkuL8zOn4nZ03gXtEPcPQ7Wh5WHOh4UuDPRZwU8w17bjYOwVvelxui/AR54cLBdyuexgOU7iLQN2nBFKLkOu3ZD9QEehc2b2mm/i9Wfb+pAEuAMg4XQgg1P1YpDtRnTD7NwNekyBezCNRoFK4DecbCEJaRSFHApyKTJRvXvqkY1LbZkbjRQW7nr1mDPrBn4+zq5z3QHX6748VUuTZXUbRAs6e9ctmJFsOXAXKlfJCSaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 20:59:58 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 20:59:58 +0000
Message-ID: <1ca148d6-84d7-4028-90c2-9a9474444284@intel.com>
Date: Wed, 25 Mar 2026 13:59:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe/pxp: Clear restart flag in pxp_start after
 jumoing back
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
 <20260324153718.3155504-9-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260324153718.3155504-9-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::6) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d47d57-b57a-4bce-430c-08de8ab17942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 1wHpj6nBJg2+2TOegimNL+Gulyj5O6CSr9ADj2zt45QoxeifIJdCJADhrQbOMNd+c3I3dHUYnKjYUQwO75M+IIifAzgBtuXyE2I2CfGfbvUzNMC2VNeodKdtiokYdBu0DvcT5FnGvWwy27zf/YKEG9JH5sIICxmJLaavA7Jf7yBnqdjClrzm9AVYxwnvHm1fxd5VIEyko2B/b0UamfdXGmJD2iPPvQIXEPHCOLVgy3QKn1WqdsXkXWFSM0EHj5ZJNUmhlA4BpQ7P344hL4fn079cjfawB6G3RjgNsHovl+7epCUlopxGkGaABEhGFazNlzaEea0jwWVyZ3lp1kdgfcHA6l8uoAeQqNuSPOEJw6pQcC1QyOOP0JKYNVb8R4ZC+LeMwK/3Vi5d56nAa0xv4bxOnPNe9cOf3v2d0LFEFvEE1++4g1/Fvi582Dxf3vdxm37expW9MtbOE01GLcRULLpBrcTt+/VHY2JEbjah20Zou0ZqDOFw5MmNYNlfsoxFMEnMp1zpFIWdUq4l0tg9DDcvbkW79OmTWab/b3huAi8hhYNMFS/pM8hscV4bMXQ3T/eXKiUwiUC3A05qhkNZIkXfap0V/JpyNYn4+xGeNRTNJVGhjhrD0LAVOmaQ+oYw8hcZ7ju15eiXMappBKWjnA6+KK0AdfRojIyx8JpA1/VYa4LAVk/JWHX54sVfUMf78Cat+4pd88mvCq7+rVLCjv7OlWwUDRVtVeGVS17uDO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ujg5UTk3NGdRTVZzeTZ5OW9KVXJkTHQ4Ylp5a2F2WkdGekMxSUdUeDZoSllB?=
 =?utf-8?B?cG9sOVBZRmdrSGE2TzltUzE5cnBvcUt4YlFKcmNWOVVxY2Q4K1hVTmhNNjJO?=
 =?utf-8?B?ZnhWcG11UkkyejFMMjBDbXlLQklhTkIyWkNEWkRvSFczY2U5WkRUMWtCQ2hu?=
 =?utf-8?B?WitaZWVNenZBR0hFVU9GcUQzQnRMWXE4ODZsclUwckp1MkUvS1g2SWFBYkVh?=
 =?utf-8?B?Q1F6YVlFZFVSZm5mVzgyNjlKMnQyYkFuNFk5MEJCVnFNa0dLVHRIcTZlMENU?=
 =?utf-8?B?SUJaUnNjTy8xQi9xdWM4djN5bkV4RGlFUzFVVXdzSzJMQ1pUS05uTzFjZkhZ?=
 =?utf-8?B?MHVRM04wU2EzNHljdWxxbTVidnVkREhIZ2ZjNThvSTRabnhpTkNzUCtYYVdM?=
 =?utf-8?B?LzZLNGtTNTd3eHF6WkZsOXMyMTdFamNIL29Feks1d3huQ1N6Q3V0YWpGRGw3?=
 =?utf-8?B?b2U1dlljUlFXMFN2WTBZZ0hSekFxZnFzRHdzeG5UOGVwYkpXbUsraUMrVTMw?=
 =?utf-8?B?dGxGazFXTW0zMGpnMEFhWitZRVY3ZlZITnBCek5MMVFQQ0I2Q3p0VjRyOGNi?=
 =?utf-8?B?MWJyUTJ0a0ZPVkRVQXl6aUIyOEUzR0Vsc2ZzbE5FNHNtQ0JHSmpEQTBDS0py?=
 =?utf-8?B?Z2lXTENpY1FlQWlCOEVCQUpvNDZhRTJaRkNoWEI1bHV6R3ZteDhEUUVkRThu?=
 =?utf-8?B?UVZkSklxWDZqY1FiWkwweFpjSkpQUE9OU2dPcnVHak1xYUlWRnlWbW5hdDBz?=
 =?utf-8?B?dndoOVYzZzZDYmQvUU8vZlpBcGVsT0p2eGVkTnBLL05aSkdVQmFTQWVtVzN4?=
 =?utf-8?B?aGZDeGk3eWFoTXpNcVd5cGN0VnZpdFVvbExXc1ArWHVEZHE4aXR0TWZxTmg1?=
 =?utf-8?B?b20rVjhZUVg0ajNEV3N2QWZYbjlsMTFiclg5dlZXRVZ5VWIrTDliS0F1b3JZ?=
 =?utf-8?B?emFLVFJKT1ptMlZhelRzWG1pUUVlSVd2ZVZieitSSGM1blgyeWZhVWVGTFhD?=
 =?utf-8?B?RWhxMFl2VWVYamxpV2hsZXJudUYxNnlzd2RTRXhiWitPaWZ0NUJkbjZNNkJl?=
 =?utf-8?B?ZGdOMDg5NHJkTnRFcVd0TXpYVG5TdEEwakhMWjRFKzl1N3A2MUxHckVFK0FT?=
 =?utf-8?B?T0ZQeWFGcjcvYjk3dVphdWhyZnQwTGpFK3pZdnhaNDhId3BFWXRZS2VjRk45?=
 =?utf-8?B?RzhkOXQwdll3bFliMVY4VTJ3aXhyUFRTOVVNNHdOVjRXdEZ1RGYrUlR2dDA0?=
 =?utf-8?B?ZlRxVlRqQkd0NFpTaHkrV1ZpUW5ibnJiM2pITVI0VDI2Si9TeFBLaXVtdGdT?=
 =?utf-8?B?dVBha0k2b0ZxQmtUcERPemdLZnhSbnBOWTRlUmZOcFNYT0ZOdTFTbithVk1X?=
 =?utf-8?B?TFNtN00rcUZ2MjBBaWQzOFB3UlFKKzc3S0xQQmR4STcxUTBOc3Q2QXhDMkRl?=
 =?utf-8?B?QnNpYVhoTnd1UU01S00zdFZGVEgrVk0rQ0ZQQjF6SEJXUHdJcGk4Ymh4OFNi?=
 =?utf-8?B?UTdQZStvdEtBVENBZjJ4T3BLQ2RlYUpiTnpaOHdwbzVja2Y4TExYY2F1U3A5?=
 =?utf-8?B?TU9yb1Nna2VBdkZHdlBzKy9IbWZ5WmtxRTZzMFczN2xQWFlScDBuUHJFWk50?=
 =?utf-8?B?VFFlMlhMQjkxdERlTVg1elFvQ1VlUi9jZi80NkFVbXJGdk4yQThVNEN6MVhh?=
 =?utf-8?B?WlRJZVZDQitVN0FLZ1BGcWVDbGZaNXpoTVVZTWcwcWtkbGFsNEdETjdkVE50?=
 =?utf-8?B?aTg0Z0R2ZVBPQVMyaXFreW1JdjJJVDdvUklVc1NjTkM0a3ZjRFcxTFVKaVdJ?=
 =?utf-8?B?RnJqYklpQkI1aTJFSmZjWWpDTWNLS1o4eG90NGhrZ21vcENkS3ZVVHlZZGZo?=
 =?utf-8?B?NW1DaXJiY2ZPVUdiRGxLL2RZL2NKWGNzdjNFcDlIMmRJa2d5TFRhdjZldVVa?=
 =?utf-8?B?TktOZERFYVYyaEpjcTN6eEplZ3dGSGpCZ3hUeTN3ZjM5SWVIL21nenNjdm44?=
 =?utf-8?B?dFgrQ1RXZEVFaklRK05wbElzUHhhckFNNDVKeE9EckV1cEs4SVZkWVFGOGpk?=
 =?utf-8?B?WVQzN3NMVWczRDY1TUpycXlNUDZ0ZjRTSlI4WTlHMkZrM2RUallaa1pVeXdY?=
 =?utf-8?B?WS9vUWw0bGN4ZU04a2UwSW5tMEpmWnN0NFAwNmo3UzVQbFhLWTF0ZWtOYU5Q?=
 =?utf-8?B?bHpIaUpOa0pMYi80TUhOdmNSV09OK1V3VUdHQ1VxcUo3N21kQVRSTWVrNGxh?=
 =?utf-8?B?b2Y3UUt5cXhEdkZtRTg3MlkyNGJFTWZMVjZzV1N6QmkvSG9VNTBTdmtUbkxi?=
 =?utf-8?B?ZlhtM0Z2U1RraXVQdjJJOW9nS1VjODR1UFdiZ2Jwa1JkS0RPT2NXN0ZJelZ2?=
 =?utf-8?Q?MULVIqdLbtVz8Jxk=3D?=
X-Exchange-RoutingPolicyChecked: TKISrePFarlng/rNnrnnnJIFslBDG8Pasx7bjyjvGa+8gHcmKytU0OozUi5yA5SXX5Fxd7TbtnPE2a5npO8gZTN+R34Xf3WIXAJp+ECyB5MhOKDtFKT6lRR6HEf+eLZrzzNa0E5PaoWdemTumBQSW0009TsHdYVBbE17GalPMPHf0+xGzfhrirhTAlOvuMTY8I3BXgOM9KvdokzCQonLkvsJMl4/vGzAkfjY9Z8YP0ktydTtPGuPK8xJtdorJJ1hya6OJffz5zsweFQdLRmgwJldzI8dVN2Ev9ex5IMKUO46NlAW82RNF0V/nNfJ9ViXmIw6ympRrg9+eB+ttLfPng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d47d57-b57a-4bce-430c-08de8ab17942
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 20:59:58.3356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKbPqYEm1TQTrEV/s6wANGRLCVr8AqPKmfyATHBOVKbsqpEze1RCmx1X11ec5DupjWtJqsT8Kk7sxb5xEflgkVzIfn/tNZC6VTs1aX7EaoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
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

Looks good to me.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
