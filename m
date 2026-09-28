Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752E0CA5FA3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 19:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361CB10E58C;
	Mon, 28 Sep 2026 19:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0GpfG2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFD210E58C
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 19:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790624327; x=1822160327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r416khHIWH4by0jPOKGO13Gcg0gzVx6VRrfiRsTHKBI=;
 b=K0GpfG2GBYvVmeIcnHr6pUAzFAIxS3TtyFF5pkDUXXPWETBXbdiiRAcO
 4UgMM/B7UvvhigTum51+XSl7Cqk1Hm21Ds5TUQzVqbk+s4hxfjPLwuNVA
 Aal1Hxn/FWuaMMSHYr34b4VN2rdvcMi2E2cnHRvY6TDH16QH2GOWNGy7o
 GM9sdQyZsWBYK3GyXaiu122n+Q8oYt4kVE3lJTdqT8t6bWIx5GjOwGyt4
 Sm7KCEq9lgjLbBAOGeaVMBHJgi0Xrdi+62tU1EUp65tbKUytALk4BVsju
 oQNUJH4lQrFeXQNFsGq8xjSeehA+rb3qUuGkhDlzpUbLNKpW7SkzewSKn w==;
X-CSE-ConnectionGUID: SedS1CWpTViVoBSTsWlfJA==
X-CSE-MsgGUID: axd7l28aTDeUXEVwNI0Asg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102705397"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="102705397"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 12:38:47 -0700
X-CSE-ConnectionGUID: JzOUvBhmR32Wke+X2eHT0Q==
X-CSE-MsgGUID: O6mqv5j8TFaHhOaEDxHefw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="272934656"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 12:38:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 12:38:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 12:38:46 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 12:38:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP1OFEKC9BAI4Uyl8ik3997Wmm70XAq8PqQJ3pdv71Ji9uJgi69Qgqz3A4UlyYQhcBlSJsnUtrDOHCC+7OkrWyqsOcXlwwOgBEgHght74XlENoOcTMvwzTkMh7xuSaRQZs+QcqZZrvsltIoN06TEDQUAlfCJsFUgo4X4ooDY/EjzN1ksHICNF0AKhfHGEan0KwrA3yyW20xwwBSRO8zfgUEJTNKZ9NubgA82P4meKq7sBGz2GBRpebYs6JZhIuoWQ0rsg6FclY+902A0I+YaZHUP21s6qqRJfmVG+dIhhFNJMdtNduIk9pimNIU7VWdNfUiLkINin5qMOmsJlB6thA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAHS1CrOb/5M1kglg9MtLqgl3wtiQmhlBRwGJplXb14=;
 b=RXiKseQYSrMRaUEPI3Uzff9RqE+By78tWeJA8Sdt903+52Rxik81qKAP0J90F+o3sxk5xyxfCNd/IQWET3GVX43alxLGHQ6OrNwec6+PriGYoePKQOCQgp8JmGAVDu8DItTPjNEjjXpS/DPRhTKjx9NBF+fPQARLHI/Pxn3zyJsF9sfDo5UkQ8ZSFmElNtp4A4t2cBWJXgkYre1xpWEr3xmJTvR1MTUM2Yn0zOP6SuyAJGZML8mY5BCenmLlSz36lgtOevo+KPE/yovvYqEOekJnFMdimy9G0w/9RHqm5xqdxN+yj3qP2jJmmHWMyazf/yf/vxB8BFkfnkYBBlhqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SAWPR11MB9712.namprd11.prod.outlook.com (2603:10b6:806:4ca::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:38:42 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:38:42 +0000
Date: Mon, 28 Sep 2026 15:38:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 04/13] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Message-ID: <arrCNETSdIpLzF-n@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-5-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SAWPR11MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0100f9-f2cd-411b-c7b7-08df1d9819e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|56012099006|3023799007|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pLzP23dy4MrUfRyNHYmTPbIrI3VzU57cIk/+8pbm3zZ02SMn0jc4OqR/kHIIboTSDgaY1EQuljJ5Kp3GhnUweWI5smgJW9Q5qKOkbN3NCCu3DmtjfGdWVH7KlQTQ+zMw/MToLdCtCU18ButYh23aR8fg/P2LRc1r1kyoB77FjX70PWlsaZoxjuIZD8/agYYzVXxmTX3LXRYo3i/oHkUTF5aPmIM9tXp1zjAaJ9qHqwqLrhKKQYVg9r+aD4YI3D6avn8uyJHBxOZ526/cSnL7nrkg9Wdetk2bKrWZ+4zNItDtpbU4910Zt2ncUeZZCZA+3IbmzQCuY+08xNs9L/vB9pxSoc23SU6kZas7CuHCul+j1CAFJoU9McNvADxorrKUOGx5h6NlvhIfk7nZ8D5yXyzaKZcpic3welMMHCUds4RwYCuuV5eRxaD+T9xnSU226RGc4uN+yNGA2WOV+Sz9/4kE14dniNxbZ9sdrsfRncnyzXvB0Im+fLH1mb5LT2C1gdQflR6tJuywYTXUCLSNUEC6ZK8J4tbszDe53PrjQy0RTSfgEQA/+Yt94Cugs/Y1I81ewCvx3NXoL0O4gA3RDLzb5zil6RGiva2+Y9/Bb4qMPJ38UwybAfT35FwgIwYW2za5LO41iKaoelSmporBncmzghRVg3nPMIU69i8/azY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(3023799007)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/VyKummvgrZ6/wTqxdJT4kWtlwel2hcaB2sVK1LcHIPzc9SXjA3xbzxZU63D?=
 =?us-ascii?Q?5INR/Ip1bTjH4GjD0G2R7/1VY/dqaObYUayedV+0CgXDdeN7qL0xmy9Nk6bn?=
 =?us-ascii?Q?DrW0EJ41ve7Seyhb8FmRdHehzjEmzGzchdl+66ea8/vO5g/MtA5KTfcBPJQ0?=
 =?us-ascii?Q?TEW7NjSlvbmpm3UAP/eRByXqI5+ZbpUvl/wLO7Qtu9VblNX9nLNNyPmLwFSv?=
 =?us-ascii?Q?Hot6YaIHnUDY9HoSXIIJ328JymCy6OV3N1lR11YhL6r+9bU+7V8KUfbNSm3P?=
 =?us-ascii?Q?IfAz09uyBXqAdCjNU0KgTAT7HGoWVhA9R2MDN+cRP4vWUZ5g8M2w0Tdl/6AB?=
 =?us-ascii?Q?49B6X8aJJdbmZkezwBfLTkbvWP3poJxJgqqwBkPqapWFS0eSTtujN97c6tXW?=
 =?us-ascii?Q?Vu4EQ3/V0QtAbCqGR6lDV3fgadbJWpG3oMECxWThRN8Hqm/8UrPUu/Yhhkrm?=
 =?us-ascii?Q?lcK84jHQVY2ijNWpMlygKnU4uXUpcw2s2eRGPaAAXRMAlnhVAOnNsP75koT3?=
 =?us-ascii?Q?bqYf1ouBZkVrX38KSp73AvvU/fHzCGeN4NyAmsk+NvUZedRrxH7MSe5cnabZ?=
 =?us-ascii?Q?NsexwGr65ypP8M1YW4PsOp4w+mF/aKz/+GoleXUSDZTz6/g8KSlma0uiKVQg?=
 =?us-ascii?Q?bgHvs/Y5O4O1X+59uT3eBq/fd7S5VP3efBiqDhz0FbhKLTihJsD48amJJQ+m?=
 =?us-ascii?Q?3pvT8UOzdgGFeSd3ozofEUT//52xAK4Vcvi7gorASw3Nj7G8t8gp+Qv4P/Vx?=
 =?us-ascii?Q?PdZ+FBFE9iN8DQiXFH7bzN358MhfWkNkZah+Bjg4Qac8rLFmls5BHY2XVXf/?=
 =?us-ascii?Q?3EvvbSkgdLCkufnnbBJ8DkypVIexmkqVzLGh+aiYUaQs7AG9Yn2akpdZ3weA?=
 =?us-ascii?Q?G1kFXA/jJOdf/vQ5InY8urky8fy3EgZHlBitJhQem0iXwq1oZY50FBqVN3ON?=
 =?us-ascii?Q?ij2TTcsD8svOO5Qqv4VK3b6CGsR+SKwAFJHlD6GL0FEACIGXhCO6xR/EOWA1?=
 =?us-ascii?Q?NDtemHAKk9EoNseBEQFe/haTisFQZx7Qnb9Va41zUviKolCzVWBQ6KjlmuZY?=
 =?us-ascii?Q?7ph58lzTMkk+2AbKfL4M0SC9INOXQr5BU+8m3/SyIB5Ngd9plmJNWgtV+Om6?=
 =?us-ascii?Q?z6fVCxrW35710YWZiH7m5valCoe+ryiLL/OMgSYOv2zmxAI6S33bJTZHQ5Oj?=
 =?us-ascii?Q?NPno3JRVClQ+9PRYHAuFAPmym3w8aNypiGvv5MwMNkcOdtdiEhHOEyPeKl6c?=
 =?us-ascii?Q?5523Tq2eHgwb4QXSM8qKg6Rf10U9EjrmJFHpZ98aViOCBa+qjjAoQPC0FV4p?=
 =?us-ascii?Q?1+08GjYU0tjgz9odscLeo0C4nC7MtJhWVA8EEXnLD3+MxNARnsIPE7krRYC7?=
 =?us-ascii?Q?cshb4UEXYkl5bzY3GOTjw6kvOmePNFtvbil6pPBTzE+DwpiqgAjY+F6fyZxY?=
 =?us-ascii?Q?tSqtFhNMEAVev8xcGrRL3hEGPY4R7fOr6pT//v2IkNDCQOfzyFct9zD1n89k?=
 =?us-ascii?Q?LwEQsHQV3GYt/kALI0/F6IPT1L9i9oKep+sUUMJZvoSjPzWu0jYTCoCSKAh0?=
 =?us-ascii?Q?6hq37DK5pJvFFw5s20hw9Cc7ApGerexxPAtoAvtEpiWu/haq9Pxi+ClC1ubm?=
 =?us-ascii?Q?mOuKJG2a7+Yux6q9ZGWdiPsv5XGcR0pD9KoNyBzmBddC8CZMrs0W2ctaEUqX?=
 =?us-ascii?Q?s74sB1XwlZ6xvgilw7ubDf+zaHEWbDZhPM+dWtEOywgPEEugdoaO94M5iJIl?=
 =?us-ascii?Q?rsiRkiMhMva10NPO3YvoewvoHSYEMx8=3D?=
X-Exchange-RoutingPolicyChecked: r2FTwKmsbN3Acg5e6nP6gurwG0jCRLW5JtdMBtt5MTcHWNmgRtL+awB5zYK8EljMmhHf4SVTt70Y5MFE+SNOKnwgwXI+0mJUViQGMMcT5p1/jLSTGdaZeO4V0/lmI8+u+XApJO8Nj8hN6sl3EhUoWQhCL7gHJZCeOD4X9EZuJSxjoNAJFulbXZsO1udLFShe3dal3boegiUuraGFoSc0HcrEpnX/0RFfalfImmMaYOqEb0dxDeiqIrZ1LYJE+f/S0f4rsBtmBI27rMtp+FKf1Dm+95+uOjZ5hoIOy8JFbbV6+0UoH2sYS7Mls+T6uAvtozeC4GUxLEAaPgRuASMv8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0100f9-f2cd-411b-c7b7-08df1d9819e0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:38:42.2720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtjidqPj4tCXyWMSM+Cl2gMT/MP0NGN042sJd6TTh47PWy/hUyk9ZDzmPGj0k/j1JhJ1IJxvbJ7QWGIbQ9l5/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9712
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

On Fri, Sep 25, 2026 at 02:24:20AM +0530, Karthik Poosa wrote:
> Add mmio_temp_valid() and mbx_temp_valid() to check whether a temperature
> sensor reading is valid. An MMIO value of 0xFFFFFFFF or a mailbox value of
> 0xFF indicates the sensor is unavailable.
> 
> Gate these checks behind has_mbx_temp_sentinel, enabled on CRI currently.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_hwmon.c        | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  4 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4661bfce2f4e..87554605fa41 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -202,6 +202,8 @@ struct xe_device {
>  		 * pcode mailbox commands.
>  		 */
>  		u8 has_mbx_power_limits:1;
> +		/** @info.has_mbx_temp_sentinel: Device has temperature-unavailable sentinels */
> +		u8 has_mbx_temp_sentinel:1;
>  		/** @info.has_mbx_thermal_info: Device supports thermal mailbox commands */
>  		u8 has_mbx_thermal_info:1;
>  		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c743867a2ebf..8a1dbe708828 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -104,6 +104,9 @@ enum sensor_attr_power {
>  /* Index of memory controller in READ_THERMAL_DATA output */
>  #define TEMP_INDEX_MCTRL	2
>  
> +/* Mailbox sentinel reported for an unavailable temperature sensor */
> +#define TEMP_MBX_INVALID	0xFF
> +
>  /* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
>  #define TEMP_MBX_SIGN		BIT(7)
>  #define TEMP_MBX_MAG		GENMASK(6, 0)
> @@ -822,6 +825,19 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	return ret;
>  }
>  
> +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
> +{
> +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != U32_MAX
> +						     : value != 0;
> +}
> +
> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> +{
> +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != TEMP_MBX_INVALID
> +						     : value != 0;
> +}

When reviewing the patch 7, I noticed a small change that took me back to the
temp valid...

What if temperature is 0 ?!
Why isn't it valid?

> +
>  /* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
>  static int mbx_temp_decode(u8 value)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d66d5a0339ae..e656fc012902 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -476,6 +476,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_gsc_nvm = 1,
>  	.has_i2c = true,
>  	.has_mbx_power_limits = true,
> +	.has_mbx_temp_sentinel = true,
>  	.has_mbx_thermal_info = true,
>  	.has_mert = true,
>  	.has_pre_prod_wa = 1,
> @@ -796,6 +797,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	/* runtime fusing may force flat_ccs to disabled later */
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> +	xe->info.has_mbx_temp_sentinel = desc->has_mbx_temp_sentinel;
>  	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>  	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index fed509ff601e..0041ec5676d3 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -50,6 +50,7 @@ struct xe_device_desc {
>  	u8 has_late_bind:1;
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
> +	u8 has_mbx_temp_sentinel:1;
>  	u8 has_mbx_thermal_info:1;
>  	u8 has_mert:1;
>  	u8 has_pre_prod_wa:1;
> -- 
> 2.25.1
> 
