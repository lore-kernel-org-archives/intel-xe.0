Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E14C4706C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A41F10E526;
	Tue,  9 Jan 2024 23:20:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF2910E526
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704842421; x=1736378421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VHwbh9We889a+jyJ9ym+2s076Yhd719FQzUzMkJxhBA=;
 b=KJbNPJhxpsMCZDpRUdc9H39kdBAJsQAFpT8GDaF34euYnm+7wHuqciT/
 tVqiMLOaotcKNxJ6iqmTty7Irq13YTnDFYWJASJdCM/OCyhfrjLrjmCYE
 Ayy0nO4a+XV61wpU4CMn1LxvIQbj7obMyP3y+cBFxVT+eRk+eeV63xw6O
 9/5av7B+JcKHbVwtzMdOZS3mfKQRjbM9osqjk1Jilgpf9/mGkPY1SqltZ
 ydmeI/0DFnhjCHwhxLYPxaPDIbpu9aUKZ48qRIRDqbOBYP7U95/K6Ss1C
 i9WSIvdLC684O/e/7YOSwK2YNbZMDgp0ocCjfa1MD0nccRYl1X70Esawi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="429537311"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="429537311"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:20:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113241116"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1113241116"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 15:20:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 15:20:20 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 15:20:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 15:20:20 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 15:20:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2pntaJP4eAQwnkDWtEJSWyfDlApqXMAV4AHBOXDZ7+JZ39tIqOOR9mUdi3LWXgpAgyUam1fyZrr7yVn+lFSDxvFbyHiC1CYgIoFRY3nBOCietImryyA7QXnSpNs8CA3gLUNQocucsnkl1WySr9NDucfV+6CgReuFXCU/RJs9Nyg3paXX+XEsGNTL+TuVSnwrprFnvQpBuNKqTswi+Yclm7AhLLL5pLA503XZ92mt8Saz+IJjXlBDMdyF/72HOQB4INBNojihRwo8d4gShrBU3gFa2ScQ+o34wDgONlnvVYZcZIUf5BH5xCZXTZEA8sulzKvBjcC5esWpgR3uEDTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr1AEXYWWSvcQEDds0PaWjl3pupJE/FjYGOkE2UhOi4=;
 b=dHqeGeulA81nJymj9kgaKU73mPAu9wqdIRxDAl9kK+J/5ca5CeRGfqjd13kAChUNw+16Bi6eYfKxMaOxFrI9Pe2qiaKMSy+Wya/NTbDlvNRQU0k5PmJmS/u2aEj3CoZiYJmVhLX97GFe6foQkanrRfOpeZ16xrR+ZZV5YSowz2zrKvZzEJsBeBSggpEXIKQ69ulepCy8XA8n4xuCV1iRkHKseZF8+fOCJ11bVKX2gLRVzgI6bPHmo+OwbPfqRUp11UTfWO8piXvjjasBcWfeCJbNhrIikDo+G+sJfwSQvmRsNzNBv02Y3HaFAAazK+1r31W0HlzhZKmNSmfVJdy1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS7PR11MB6014.namprd11.prod.outlook.com (2603:10b6:8:73::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Tue, 9 Jan 2024 23:20:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 23:20:18 +0000
Date: Wed, 10 Jan 2024 00:20:15 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
Subject: Re: [PATCH v4 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl
 handler of the mmio debugfs file
Message-ID: <trlpqo3psodsop4tylsxgham65qqlad3m7oyp77cshvef4wlaz@onash7nbbrki>
References: <20240103071243.1978967-1-kelbaz@habana.ai>
 <20240103071243.1978967-2-kelbaz@habana.ai>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240103071243.1978967-2-kelbaz@habana.ai>
X-ClientProxiedBy: VI1PR08CA0262.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::35) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS7PR11MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f8557e-dd51-4c0c-6cb9-08dc11698adc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Q4u459qMau6izyglONrog3uTWA0MPXCzgWNL7QALdi9Ru/68xrGVIeY0J+p6i+N/hlvz/4E7vmPU38lQG4rof2Ty28mFsFNrY/9VXD9/lII+ZmsjlP0Q2Vuij3at+M7UwV/QnKJioa+C+zxQf68p8zdWraPdjXOhijCo/ZMJrmo3H8hazVXgFIs0g1wu8oz6p2S7WXHz6PiFQBGZA5cwrTa/z0M4RGF6o6E/ncSdkEsXSnZo8sk0Zx7vuoEqyyB95l+qj58rqUqfB0/LOvGsf66b5/f3iGj3XE0vMFuLvn1V4/LWtITH14XNDRgOu8HJCQyJUnnNZ/nO4m2i7NDuk+uKSOFc9YzQdyPrHynQ71pQQ5tqFA/KZ03JInPW9bYn8lZyKWd8TlWLVTlyec3pTGuk8inDXk/UYH7L9+1yA/ctz7sELmW/9a2Lvkpu3gMO4l2yCBX66Lpo3AZuPQBJOwsIufnLW3xkuTLf73d21bIwv7fLLh3fkHoLMqI8x+LBA0ZUtn7SYcelQnnjfhtwIOJfm4BMgU10270XoqQ7gY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(5660300002)(33716001)(41300700001)(966005)(478600001)(6486002)(38100700002)(83380400001)(107886003)(26005)(6506007)(6666004)(6512007)(82960400001)(86362001)(9686003)(4326008)(8676002)(8936002)(66556008)(66476007)(66946007)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODNBdHpKaFY4RnlNSlF0ZmpGdnBYeURmYjJKNGlyTlpBMUdXeTREa2FDemNP?=
 =?utf-8?B?UlpLdDE2WGhUQmhHRkh5Rm1VeWlTaEhnSU4wMHg0Z0lPTTFJMkpEQ0VQK21Q?=
 =?utf-8?B?QmFLRWRkNzgwbUpXVjR2RGpod0tQc3d1WUFjRHBheFJuWmVKN0VSN2JsQWxx?=
 =?utf-8?B?b25peTlnYUd0bkpCZmZLSjAxbCtxd3U3bVZPN2tZQmhha3ViNFRJU1laOC9U?=
 =?utf-8?B?YUR5WEZUcGZ5ZXJYUXpyTUJZSDZiWmZiaFd5NnM2Ym51NXN2SmxYc1NLaDRU?=
 =?utf-8?B?ME5DVHJJMDVXZGl0NkhoZnp4N25oTW5QTXdJRjZxL0ZkQUhibHpYTFZUN2gw?=
 =?utf-8?B?Z0xlbVU1SEtzNkdocTArTk53QVVoK2N2N0g4U0NuWU9CaTN2U1lFN3VaYU5Y?=
 =?utf-8?B?NTkzaU1KTC85WUdGcG5XdDJwV1FUbS9Zb3dNRWNyOW1vVDBHeURTODg0K1Y0?=
 =?utf-8?B?UWsxL2U4N1BWdHdoRDRZUnMrek1QelNRbjk2cXFZVkRYbTZiRjcrbk1MSWtQ?=
 =?utf-8?B?V2x6MHk0WVZSb2txVU9ZbGkvSEpOdU1KeU1yamxxNXVEWm44b3FQR0JnZVlP?=
 =?utf-8?B?UENmSldCSnZLZ3FSczQ3bG5xdWJDOFRqSFFmRnRwQ0FCbllkZGEweW1GNW1I?=
 =?utf-8?B?Mi9wRG8zU2swdlorMUs3N29iZDZIWUNPNWMyM2dVTm03akFqbitzZ2dhN3A4?=
 =?utf-8?B?aGpLZ0J4S1RMckE4MjVib2FIa0ZMUGFyb203ZXcrVjJESzRmeHEycC9XK3hW?=
 =?utf-8?B?NS9EQnZFZmc4NEhsQzhza2FCV0ZvU0ZJTzYzbFRueUV3R1NtMGdpNkNyUExj?=
 =?utf-8?B?d0pZRW5RVzRZcU14UGJJLzFCbVZxYnhUWDAvS0krK05CUDVodkJaYm05eVpY?=
 =?utf-8?B?TGFiMkVSbWpOTGRDWmZ6ZEE0dFFNd1EwVHhjNW5qRnVXaHU2NHVQeVR5MmNZ?=
 =?utf-8?B?bnJtQkR0NDBmb2tXMXhaSnNLeTkvZkNzUy9Wc3I3cXR4MGQ4VFVrZWM2cktz?=
 =?utf-8?B?NHFpVU04S2FUblpGeUxjSEg1TkZIR1I2Y05yaFNRS0pvbWlqQ1pjcktOQzZh?=
 =?utf-8?B?L2szdUZvSWcxWUVNWUNDRVVXSWlUVUEwNm5NYXJkSFY2QkJkR0F6ZkU1elQ4?=
 =?utf-8?B?MTh2US9SeDRacllWeEdrQ2Y1YzJTUVJCTC9OSytRM3A5Ukx0cmZ5cnNJTEp3?=
 =?utf-8?B?N0luRGJEeVlSOVVhdDVkMG1hMXRwYkRYTGU0aXQyclNhSytybElBb0huNGd5?=
 =?utf-8?B?Y3JINGdzZENibkJLRzdrUlNoRUFQYkxCT3FKTEJhNWcybzRQZG1IT21yZlVM?=
 =?utf-8?B?Zm50RlJ1UFhMMGpUME9EczRpVjFydGRUUjFxTzRiWU1NekZKR3F6Q1Naam84?=
 =?utf-8?B?eGoxVElxL2lOalRCUGRJYWpvQUxhT1haRXArQTFvZmdrWk80TnZta0J2a1FQ?=
 =?utf-8?B?VUpJTzhWUjVYaE44RFJVcm93QjcrODZJaHZzclhHeXpCc2lLcVRaTUlMUXpX?=
 =?utf-8?B?QUt4cTM4L2pDK01YQm41U0FhbENEZ3FVQVpRRkxJLzJmTGx2ZjB1Qk9qNVIw?=
 =?utf-8?B?R3pXd2V1V1QzdC9tRFl4aWh1WlpVd1lIOEFFMjRyNWdjNXBYc0xQc3R5OFlH?=
 =?utf-8?B?NHduRE9OUHo0WU1kdkNmTkdLcEwzZkE4cytEMnEySHhrVTl1Y0F3V3ZhMnhZ?=
 =?utf-8?B?cldQS3VWMmxhbE9pdFRGUjhmQmpxQTN1TzFDQWZzRGZFRG5NZU5OcmlIeERR?=
 =?utf-8?B?RFhnMnkrbGdtYU5IRytHM2pmTGZtbjJ4NE04c3dkUk5KRWMvRDI2dmI2bnRt?=
 =?utf-8?B?T2kwMzdoNGJjT25zZUFObkt0dHI1UkU2SjFnTTJsN3ZwK2F4Mm4vejZvVHha?=
 =?utf-8?B?YmFzM25lcXF3WXlsdWlOakU5U29GWG5XSGhHbThYeklYT21ONzIrYUg1Z3pq?=
 =?utf-8?B?eE9PS3pjNjZHTXhwWWw1SDNBYTlBeWxiME1YVWU4RWdhTGJOZVd6T2dBaTJQ?=
 =?utf-8?B?OUgzVG03TDdQVXhEaTg3WGVLZTF2TTN2aDVFcndIa0ZiVzREV3pNUTVvMy9H?=
 =?utf-8?B?TWFIbHF2dUw4Tk44dmJhRmwySFZUa1B6QnBMM1Npc0JRZUtGSTRia3BncnVG?=
 =?utf-8?B?aE1MVDYrS1ZUTktia3hJaWJXR1RKN0M4QkdSb0xyY0ZDTG41Tm05UU14Rk93?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f8557e-dd51-4c0c-6cb9-08dc11698adc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 23:20:18.0982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw/U97Lbvz26SXhH2Qc2Fg7q/XqmlOaTt8zYDOE6IoyWT3W3fDTcqeBRHXrJFgYwpVY9w/2JX9MjoKzty2vklfGwjeGXZFhOHPQzyEYf1SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6014
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
Cc: intel-xe@lists.freedesktop.org, daniel@ffwll.ch, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 09:12:43AM +0200, Koby Elbaz wrote:
> The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
> and therefore, recently removed.
> Nevertheless, it is now restored for debugging purposes to function
> as the ioctl handler of the 'mmio' debugfs file.
> Note, that the non-admin user's limited mmio access (aka, whitelist),
> was removed being irrelevant anymore, now that a user using debugfs
> must anyway have root permission to use it.

Note that having root permission is not enough to get raw access to PCI
MMIO/Cfg using sysfs exposed by PCI subsystem if the system is locked
down:
https://elixir.bootlin.com/linux/v6.7/source/drivers/pci/pci-sysfs.c#L1066

This debugfs can be used to partially circumvent the lockdown for Intel
graphics devices. I would expect the commit message to explain if this
is fine, and why.

Thanks,
-Michał

> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      | 107 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_debugfs_mmio.h |  43 +++++++++++
>  2 files changed, 149 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_mmio.h
