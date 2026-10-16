Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD921CCF2C4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6740210E183;
	Fri, 16 Oct 2026 20:09:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C665310E183
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792181349; x=1823717349;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b/NfuB310LtNCO6xBOkUApUrtvjK9Y0FwiTWCgqsZ7M=;
 b=ATwwGVJr2loOmeQY/BlPdmp98hlkcy2XvnETlI5MWfmYRY/83ZGwdRJP
 ThnJoZPTnU3JIgjubZfjZtCB/eObkp4lZyagaa66e/Ol5SVsgZHqYTpX/
 L6p34N0aO++T9K94aBYYfoOxI0cgozo3aREuN4yF49VoBk3xsYPuEf8Nn
 t9DXQpOq9sTb74pI1MGEtZEj+In+jNAXacSUPL3qA6PpZXfCkunF/JgRo
 clk5wP8dSsPPz/kyvKpm+Rh+FU7krFmvW84bOcZJ/Cf9b+rkR04fiLAIo
 KOhpaaexXgMCQkT82wCzAcei0niW7LXbwXtzxZ18+eLGEFo2kcrjuhiti A==;
X-CSE-ConnectionGUID: 36XHi/gfRcGWIKvvdu/5tg==
X-CSE-MsgGUID: nccQLtqMQyy5AWbgjEftAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1072860"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1072860"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:09:09 -0700
X-CSE-ConnectionGUID: hhidCCXxTKObXqzy9Djf8Q==
X-CSE-MsgGUID: +1eJvEz9QjOIpl/ac9vj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2134370"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:09:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:09:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 13:09:08 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:09:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwhDQoKeMLvb7J4CH6JphP43bNtm/O3sa5067XZ6mcLhKNzsRVh0HcIzWy40ezMpywl9ezgx0dQTeRdCB6mUItKc4ooTVqOcd5X3yBJ441dzd4O4pbBKk/YW7zt63k5k9FlndbEoXJVt+foh9SKXo5aUq2oCzJTp1b2csriaN0FBtxszubRsuuGkh+zWdSdbTlShvlw/C3i0UjEVJMP5yYVklMAgG8jx2CK33rIUdELn1Gi+Xj25uMpLuwVxpQS/1MXt97BM/vVvF7pyx0tgbUJ7HxB8+kZyqAzJ1drvwYDD7vvHIIgo8+8bY5PRhY5H887o6QJHZ0KpOuRRPZ8jiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwQp8KuiF8O9yFWm3+qwd2MPpjaembxWysjd6rR+CyQ=;
 b=ATJfnFsCJeDtScQCk0PLLYAVl5twXn/pAkVmGJRcceqPSISVW/rznbuJR9bgndyNcuou26C83XzlarmY8Y/K2AjbjjmQHVzGSZXQpo0Gn2Xpd3BIZUE9l4OJKS6WlakHqnaDBvmElpCfwvQJH/68dI+SzhRSzc0hAymObb38KPV4La5wZ4htqavjAECVTNlztn5N0KaUx0XiCI4S9G0QNvLdMwnSzDM3tBetxPwPm9o3lgY6tjtIlCEIIY1sValXiBwdTBrsRdxJcgMM3o2BuU9HoKmS03XUu99klNBlHS7u8patpDxMDERWlbfx88rsy5s42UIiupcLKJD/d3Tjyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 20:09:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0472.015; Fri, 16 Oct 2026
 20:09:05 +0000
Date: Fri, 16 Oct 2026 13:09:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v7 4/7] drm/xe/guc: Cleanup error codes and handling for
 CT errors
Message-ID: <atKEX/W/9a2euBRO@soc-5CG1426VCC.clients.intel.com>
References: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
 <20261012232907.83649-13-umesh.nerlige.ramappa@intel.com>
 <c7831b00-ef44-4975-b33a-d8b2636de0bd@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <c7831b00-ef44-4975-b33a-d8b2636de0bd@intel.com>
X-ClientProxiedBy: MW4P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b6554b-3174-4006-5969-08df2bc15453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|10067099003|22082099003|3023799007|11063799006|5023799004|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: +H3/FfnttGmlu8VxGxIAthRvxaoDp7/E0sJ0dyMshJJJtbCl/yk2KgQT7Xe5STT7a5sm0q84f5tHqxTbwh7093UPo9F0rgyv4O2k39wXnlWnO7hpfYFPhHWiXW2wOpJRJPr3JfGBb68Bk2mNRTdlD0G1MW0kQJw1tFtj4ygPFQqDLlDIlm34PlGXb2gKmWk0iODkFcL+mPCuqyHZLYqt/yelnHgRs7RPP6yP7aW6AmPsqbBXymBp6Q3HWbvLjjfXZ9aEUiZTjHpcStfWwn/IONV7hU1yOHABTij2eARzaJx47HTXoKbVKlpZq1XGmYzNSvRTdSYd/1hG0p+QmQVQaafd/5t3CKRcO9+YEDcEKEkuVTNZ1ZY2BE0iBWSO4Tdb8jlkaQr48V8DA4T1hRI0Z0SiPJSvUeStTgXsu7xvpOnVBYf98TQ6fZxWAayuwOzed7rY8xo775jV7YODW6yWwSfKJCh5lzrGAGdNCcdJJBnTD9QPIleJAIs6D77RUUQOA5MKNXLLAI48bDWJH3VSaq6WAkQTNoPG+AQEkDcU92nJMTjb6NRde5DOue5hdKyeHW7lEXX3+qS5swwcT6K+yEZEoRA2j21KrekbMrDOB4Rn6dPWF+mytlk95CwFvd6Wv4WZ9juU7+DCGI5IhY92/zh63ET5LOKvYbWguKuTwQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(11063799006)(5023799004)(261009223027099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MndKcFFLS3NUK29NY3R0MGpXMVhqMTIxRGcyUXYxcGl2VnNUMUlkTHI2Y1k5?=
 =?utf-8?B?cW9OYm5sZU1rV0p6KzJ1OTZ1ZHNNUVRWMUlBeW1EeVpLRGlGMDFHdmpZWTFV?=
 =?utf-8?B?bndxUlZUYzNEekN0S1o4ZkR6UjVuenBDK3czQmFLK2pSeFdZc3ZCL3pDSHc3?=
 =?utf-8?B?QXdRVnBnRkVFMldvV1FPTEZ4VWtEUklDeGdWUjh4MGJFYThhREt5QWc0NHJ6?=
 =?utf-8?B?L3ZabFJLTGNHcW9adWl4cElkY3drR2k4RnJDS2REbUR3K2s3MkwreXhOT0NM?=
 =?utf-8?B?OHMyYjhWcm92Y2NFSEwxakZ0Y2VqVW94WHlJOWgvNnROMW1xVmdtNVhwTUdO?=
 =?utf-8?B?R2M1WCtUaDhYOXJLSlMrV1dlVklEWEtSdDV4eEZwcFozMDFoWk00TUNYWjdy?=
 =?utf-8?B?dUxNbGZpSk9KRWh1Umk5VDVnWjZvbEZGWE5hMSt0MWhjeWFzeThDWFdsV0RI?=
 =?utf-8?B?S0ZhSlBwdURDNUo1Z0xQdURLK3dmelducWRhTzlqVWxvTnZUSGc3R3BLZzZq?=
 =?utf-8?B?UTZLTk1DR2c5SFJWcFJxSUNXRUJJVUYrRldnYnc5ZnJWU3ZlOG53NU1yTHM3?=
 =?utf-8?B?RkszdWNaRzd5TmZFcThPa1dFNGVSYzk0ajVaVks5dUhnRkJEbzAzWHdiMUln?=
 =?utf-8?B?YmVJcUVGWnk0OElCRXB1ek00VE9meWpYTXc0RDFTSnBuVjVLa2tOMWxzaDVZ?=
 =?utf-8?B?MUIvTUlabTNoQ1B5NW82aGpJYlNsUGkzbUFOY0ZFRGxpNTduUmg0YzVEb1Zx?=
 =?utf-8?B?MnBiSWt4amdDV0JqK2t1eVJoTmhseWR0UHVYajFjUVFYOFdXVXZQWlF3Q3gx?=
 =?utf-8?B?UlBGaVA2d29tbDBuamlpY1JQdzArQVMrZDV5dHVzckhNMGowU2Vod2ptbmo0?=
 =?utf-8?B?QXhHTjNpc0dBMjRlaEdYQ3pMQTNnV2xFbGEvRzBvYjcxR0x1Y0cvRFFVT1Zy?=
 =?utf-8?B?NXFTckN2cG5BMFJDS2RrR2wxTTNvNkdQdmFxcndyMWhaeUx1cS9IbWxBUjh0?=
 =?utf-8?B?RnNVYTBoUzl0SWVtaFBIak5acHhlamFyUW5MM1lVRTVDZjZ2WmZwVUZWeGZt?=
 =?utf-8?B?ZXpZZjBFM0F5aTNYRWZQNmhLR1JRNDNTK0wxdk1pZm56d1cwZTZ0bEVmUmJY?=
 =?utf-8?B?dEs2bkhuQUM1NmpiN0IzTWxmbVJGRVRuajFZeUkrN21wblJsUGMzNmI0NEl0?=
 =?utf-8?B?ZFhBbGVwd3RjM3NHUENmRUxRSjdyRmVQVStvZUJFaFNmek56Mms0dnBYRzV6?=
 =?utf-8?B?UllxbHErdk5rSVJZU2c5OVN2KzZBMW1WWlJ3M2c4VlhFbk9aeFlSRTV4aUtt?=
 =?utf-8?B?dzVkS01CdzlPdWxWV1JBb2tiQ3BNbjlpeEJSTXNJd0E5TE44QVRiU3l4bGVO?=
 =?utf-8?B?RVFVUWViNWJXY1ZPV1JsTnl3S2dYMG00QzFIMHloNmhkVnpxM1RMblNRR0Ey?=
 =?utf-8?B?Yk5kTlhCVXk4d1U4VmZwbmZuUzhNZ2o3blM0My84ZE4xWDBZeTlUenBjaHl0?=
 =?utf-8?B?MVJnT1JrVnE3d1FUdHBENE1PallZK2Q4dlNJODJ6Z2k3SjQ4VmNOU0VOQ3dp?=
 =?utf-8?B?a3BXNFhBYzlXdkhUZi9rdzk1c2trWGF0dDZXeDQwWDd2Nk84dkxjMjF4Smps?=
 =?utf-8?B?MkVLSE9xUFM4cm1SdUUyZWQ4UVhrRDdRYTRrYXlRMmJyNVBzQVl5Mk5Gd3Fl?=
 =?utf-8?B?KzFqamtNMFdYa2dMOFVmMW5XNzBJV0N3Zk1YU0dGZm5SeEpvMmdTaHptQXdD?=
 =?utf-8?B?ZGNnL3hta2JxU3pWT3M5a1lwenNIY3krZkpEcUh3Q1ZTNlg1T1p6QTBjVW1q?=
 =?utf-8?B?RktYSmM3RHQyOWhaSHBaTmNrTHZxN0Y3TEkzemNtUFg5UkxybExOcUxNMWFJ?=
 =?utf-8?B?WWxUSlZaOXF6VGFxWU45d1ZIc2tVNGtYV0dpSFNBK3NwSUhSMzh1MkFnK09F?=
 =?utf-8?B?eGlsU3lnRWEvN0VGRVZvQTRxNENiMkErNzVCSDVMZzlKbDVobEhJYno5TlZi?=
 =?utf-8?B?YlFLMEcxVCtHVTRsZVVjMEIxL3hadVNwNVBoUytyNytRcDZZTjdFRTFBbzIy?=
 =?utf-8?B?TFJUVVRKMWhNSElkalNiald4WFZtQlpvUDJnSUxDSUVJc2Zrd1RFNy82dTBl?=
 =?utf-8?B?K1hrZC9leHZqYU1ocFFlSHpVR1lMdjNYNTgweExYUzFIY3pIV0FPSU9zalBm?=
 =?utf-8?B?cUo4cUpGcndwazdsMms4SnV3bXl4OXdEN2dYeFV3M3Rvei9nTFVXbG9wbTZz?=
 =?utf-8?B?aEwwZmtZT0w4VE1ZaDEyTUlSVTgwbS9IT3kwa1JLR2kzMjVlYU41U1htRXNn?=
 =?utf-8?B?SHR3WEhibUx2dS94eDBCQUdtRnFYUFhpLzQyVUNVakRVV3hwejMyaW5hMzhM?=
 =?utf-8?Q?ocqLScA7XyJp0A9k=3D?=
X-Exchange-RoutingPolicyChecked: 37z9Qh7P0++c8cNUTOSGdfHExU8c1qAyDcn7LCCcPxIsf39ETugMcPgVdNYPfg1p89FIlD3QGY5xsGylfT/cun68HPTHBYJnkfkgl+RpmXlqFgApWR1WzWws43dQHf39YemFriNlFsYyxw+EBth9cFvHlylqpd3A3U0mcYSJIaxvNBNc+/hEPm7Jjh7FpcM6igXPITBzspRrJxNNVpvsawEdsKckhqUGVVLmL005+hnxnL2IYyZ3lG5H3YG+JokrAF2THn7v6QLw1VwlUdK87harMYJjwee9ENTmz3a6GSnZMtAYAd48u3NjffmCl23+LEw+pd7Ylo5dXlWdkkBctA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b6554b-3174-4006-5969-08df2bc15453
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:09:05.5891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14M/1OGqU8j0n1V6haV0AYhEQ1MD6yI5pezBVJrbnB9lv8R8nQGVjpCaq7WbXVWXN/aWH3bO4bbrLRLlqJYu2yc8cnYlt6k8yVGkAzjAM3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
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

On Wed, Oct 14, 2026 at 03:36:29PM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 10/12/2026 4:29 PM, Umesh Nerlige Ramappa wrote:
>>Instead of always returning -EPROTO for most errors, use different error
>>codes based on the error type. -EPROTO is retained for the cases that
>>are genuine protocol violations by the GuC.  The remaining cases now
>>report what actually went wrong.
>>
>>A CTB that has been flagged broken reports -ECONNABORTED rather than
>>-EPERM. These errors are not contained within the driver: they reach
>>userspace verbatim through the gt freq sysfs knobs (min_freq_store() ->
>>xe_guc_pc_set_min_freq() -> xe_guc_ct_send()) and through the VFIO
>>SR-IOV migration callbacks (xe_sriov_vfio_suspend_device() ->
>>xe_sriov_pf_control_pause_vf() -> xe_guc_ct_send_block()). -EPERM reads
>>as a privilege failure, so a user who hits a broken CT is told
>>"Operation not permitted" and retries as root to no effect. Worse,
>>xe_sriov_vfio.c already returns -EPERM for its own "not a PF" check,
>>so the two are indistinguishable to migration tooling.
>>-ECONNABORTED ("Software caused connection abort") says what actually
>>happened: the driver aborted the channel after detecting corruption.
>>
>>Note that -ECONNABORTED must stay distinct from -EPIPE. -EPIPE means
>>corruption was detected now and transitions the CTB to broken, which
>>g2h_err_is_fatal() classifies as fatal; -ECONNABORTED means the CTB was
>>already broken and is benign. Merging them would make receive_g2h()
>>re-declare the CT dead and re-kick a reset on every dequeue iteration.
>>
>>receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
>>two error codes that dequeue_one_g2h() could return on a fatal error.
>>Invert the check to simplify reset handling.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Assisted-by: Claude:claude-opus-5
>>---
>>v2: (Daniele)
>>- Drop the xe_log_error paragraph
>>- return EPIPE directly
>>- use h2g and g2h variables
>>- Add EPIPE comment back to xe_guc_ct_send
>>- s/ct_id/ct_error_id/ and s/ct_dead_capture/process_ct_dead/
>
>nit: the previous rev of this patch had a changelog up to v6 which is 
>now gone.

yikes, adding revision history below --- and then doing a git am messes 
with it. I will add it back for the next rev

>
>>---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 209 +++++++++++++++++++++++++--------
>>  1 file changed, 163 insertions(+), 46 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>index a00b5e761e96..3e23a4396b39 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>@@ -37,6 +37,93 @@
>>  #include "xe_sriov_vf.h"
>>  #include "xe_trace_guc.h"
>>+/**
>>+ * DOC: GuC CT Error Codes
>>+ *
>>+ * Send path - xe_guc_ct_send(), xe_guc_ct_send_locked(), h2g_write()
>>+ * ------------------------------------------------------------------
>>+ *
>>+ * Channel-state rejections - the message was never queued, nothing is corrupt:
>>+ *
>>+ * ``-ENOTRECOVERABLE``: the device is wedged. No CT traffic can make progress
>>+ *   until the device is recovered.
>>+ * ``-ECONNABORTED``: the H2G CTB was flagged broken by an earlier corruption
>>+ *   check, so the driver aborted the channel. It stays unusable until the CT is
>>+ *   restarted, which clears the flag.
>>+ * ``-ENODEV``: the CT channel is disabled. Don't retry until it is enabled.
>>+ * ``-ECANCELED``: the CT channel is stopped or a GT recovery is pending, so the
>>+ *   message was dropped. Often benign; retry after the reset/recovery completes.
>>+ *
>>+ * Internal flow control - never seen by callers, handled by the send helpers:
>>+ *
>>+ * ``-EBUSY``: not enough H2G room or G2H credits. Triggers a flush, a wait and
>>+ *   a retry.
>>+ * ``-EAGAIN``: the message would wrap the H2G ring, so the tail was NOP-filled
>>+ *   and reset to 0. The write is reissued immediately.
>>+ *
>>+ * Hard failures:
>>+ *
>>+ * ``-EPIPE``: H2G descriptor corruption found before writing - non-zero status,
>>+ *   or head/tail out of range. Marks the CTB broken.
>>+ * ``-EDEADLK``: H2G credits never recovered after waiting ~1s. An async GT reset
>>+ *   is requested before this is returned.
>>+ * ``-EPROTO``: the MMIO CT enable/disable handshake got an unexpected reply.
>>+ * ``-ENOMEM``: internal allocation failure (fence lookup under GFP_ATOMIC, or the
>>+ *   G2H workqueue at init). The blocking path retries the allocation with
>>+ *   GFP_KERNEL.
>>+ *
>>+ * Blocking send only (xe_guc_ct_send_recv()) - the H2G went out, the reply is the
>>+ * problem:
>>+ *
>>+ * ``-ETIME``: no G2H response within 1s, even after flushing the G2H worker.
>>+ * ``-EIO``: the GuC replied RESPONSE_FAILURE; error and hint codes are logged.
>>+ * ``-ELOOP``: the GuC kept replying NO_RESPONSE_RETRY until the request hit
>>+ *   GUC_SEND_RETRY_LIMIT. (NO_RESPONSE_BUSY is not an error - the waiter re-arms.)
>>+ * ``-ECANCELED``: the pending fence was canceled while waiting, because the CT
>>+ *   was stopped underneath the waiter. Retry after the reset completes.
>>+ * ``-ENOTRECOVERABLE``: same as above, but the device got wedged in the
>>+ *   meantime, so there is nothing to retry.
>>+ *
>>+ * Receive path - g2h_read(), parse_g2h_msg(), dequeue_one_g2h()
>>+ * -------------------------------------------------------------
>>+ *
>>+ * Channel-state rejections - the same four codes as the send path, checked against
>>+ * the G2H CTB. g2h_err_is_fatal() treats exactly these as benign; anything else
>>+ * declares the CT dead and kicks a reset:
>>+ *
>>+ * ``-ENOTRECOVERABLE``: device wedged.
>>+ * ``-ENODEV``: CT disabled.
>>+ * ``-ECANCELED``: CT stopped.
>>+ * ``-ECONNABORTED``: G2H CTB already flagged broken.
>>+ *
>>+ * Hard failures:
>>+ *
>>+ * ``-EPIPE``: G2H descriptor corruption - non-zero status, head/tail out of
>>+ *   range, or a declared message length larger than the data actually available.
>>+ * ``-EPROTO``: HXG protocol violation. Either the G2H origin field is not the
>>+ *   GuC, or a FAST_REQUEST H2G came back rejected. FAST_REQUEST fences aren't
>>+ *   tracked, so there is no caller to report to and the failure is escalated to a
>>+ *   reset instead.
>>+ * ``-EOPNOTSUPP``: G2H carried an HXG type this driver does not handle.
>>+ *
>>+ * Reported but not returned
>>+ * -------------------------
>>+ *
>>+ * These never reach a caller: they are detected in a void path or in a G2H
>>+ * handler whose return value is swallowed. They are reported and the CT is
>>+ * declared dead, which is the only escalation available:
>>+ *
>>+ * ``-EHOSTDOWN``: the GuC sent a crash dump or an exception notification, i.e.
>>+ *   the firmware itself died. A reset is kicked to reload it.
>>+ * ``-ETOOMANYREFS``: G2H credit accounting went wrong - a release would push
>>+ *   the free space past the usable size of the CTB, or there was no outstanding
>>+ *   G2H to release. Indicates a driver-side bookkeeping bug, not a GuC one.
>>+ * Any error from a G2H action handler: the handler for a given G2H failed while
>>+ *   processing it. The code is whatever the handler returned and is reported
>>+ *   along with the action and the raw message, from both the worker
>>+ *   (process_g2h_msg()) and the IRQ fast path (g2h_fast_path()).
>>+ */
>>+
>>  static void receive_g2h(struct xe_guc_ct *ct);
>>  static void g2h_worker_func(struct work_struct *w);
>>  static void safe_mode_worker_func(struct work_struct *w);
>>@@ -931,6 +1018,22 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
>>  		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
>>  }
>>+static int ct_corrupted(struct xe_guc_ct *ct, struct guc_ctb *ctb,
>>+			u32 reason_code, const char *msg, ...)
>>+{
>>+	struct va_format vaf;
>>+	va_list va_args;
>>+
>>+	va_start(va_args, msg);
>>+	vaf.fmt = msg;
>>+	vaf.va  = &va_args;
>>+	xe_gt_err(ct_to_gt(ct), "GUC: CT: %pV", &vaf);
>>+	va_end(va_args);
>>+
>>+	process_ct_dead(ct, ctb, reason_code);
>>+	return -EPIPE;
>>+}
>>+
>>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>>  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>@@ -955,23 +1058,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  		u32 desc_status;
>>  		desc_status = desc_read(xe, h2g, status);
>>-		if (desc_status) {
>>-			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>>-			goto corrupted;
>>-		}
>>+		if (desc_status)
>>+			return ct_corrupted(ct,  h2g, ct_error_id(H2G_WRITE),
>
>not sure if it's just my editor by I see 2 spaces before "h2g". Other 
>calls to ct_corrupted (including the g2h ones) seem to have the same 
>issue.

will fix

>
>Everything else looks ok so with the spacing fixed:
>
>Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
>Daniele

Thanks,
Umesh
>
>>+					    "write: non-zero status: %u\n", desc_status);
>>  		if (tail > h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>-			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>>-				  tail, h2g->info.size);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  h2g, ct_error_id(H2G_WRITE),
>>+					    "write: tail out of range: %u vs %u\n",
>>+					    tail, h2g->info.size);
>>  		}
>>  		if (desc_head >= h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>-			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>>-				  desc_head, h2g->info.size);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  h2g, ct_error_id(H2G_WRITE),
>>+					    "write: invalid head offset %u >= %u)\n",
>>+					    desc_head, h2g->info.size);
>>  		}
>>  	}
>>@@ -1036,10 +1138,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  				     desc_read(xe, h2g, head), h2g->info.tail);
>>  	return 0;
>>-
>>-corrupted:
>>-	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
>>-	return -EPIPE;
>>  }
>>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>@@ -1063,7 +1161,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>  	}
>>  	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>-		ret = -EPIPE;
>>+		ret = -ECONNABORTED;
>>  		goto out;
>>  	}
>>@@ -1215,7 +1313,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  	return ret;
>>  broken:
>>-	xe_gt_err(gt, "No forward process on H2G, reset required\n");
>>+	xe_gt_err(gt, "No forward progress on H2G\n");
>>  	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>>  	return -EDEADLK;
>>@@ -1250,6 +1348,9 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   *   request cannot make progress until the device is recovered.
>>   * * -EPIPE: the H2G CTB is marked broken. The channel stays unusable until the
>>   *   CT is restarted, which clears the broken flag.
>>+ * * -ECONNABORTED: the H2G CTB is marked broken, so the driver aborted the
>>+ *   channel. It stays unusable until the CT is restarted, which clears the
>>+ *   broken flag.
>>   * * -ENODEV: the CT channel is disabled, messages not expected in this state.
>>   *   Don't retry until it is enabled again.
>>   * * -ECANCELED: the CT channel is stopped or a GT recovery is pending; the
>>@@ -1373,7 +1474,8 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>   */
>>  static bool retry_failure(struct xe_guc_ct *ct, int ret)
>>  {
>>-	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ENODEV))
>>+	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ECONNABORTED ||
>>+	      ret == -ENODEV))
>>  		return false;
>>  #define ct_alive(ct)	\
>>@@ -1678,8 +1780,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>>-		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
>>-			  origin);
>>+		xe_gt_err(gt, "Invalid G2H origin=%u\n", origin);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>>  		return -EPROTO;
>>@@ -1697,8 +1798,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  		ret = parse_g2h_response(ct, msg, len);
>>  		break;
>>  	default:
>>-		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
>>-			  type);
>>+		xe_gt_err(gt, "Unexpected G2H message type=%u\n", type);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>>  		ret = -EOPNOTSUPP;
>>@@ -1819,6 +1919,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>  	lockdep_assert_held(&ct->fast_lock);
>>+	/* Keep in sync with g2h_err_is_fatal() */
>>  	if (xe_device_wedged(xe))
>>  		return -ENOTRECOVERABLE;
>>@@ -1829,7 +1930,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		return -ECANCELED;
>>  	if (g2h->info.broken)
>>-		return -EPIPE;
>>+		return -ECONNABORTED;
>>  	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>@@ -1845,10 +1946,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  			desc_status &= ~GUC_CTB_STATUS_DISABLED;
>>  		}
>>-		if (desc_status) {
>>-			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>>-			goto corrupted;
>>-		}
>>+		if (desc_status)
>>+			return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
>>+					    "read: non-zero status: %u\n", desc_status);
>>  	}
>>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>>@@ -1869,24 +1969,24 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		 *
>>  		if (g2h->info.head != desc_head) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_MISMATCH);
>>-			xe_gt_err(gt, "CT read: head was modified %u != %u\n",
>>-				  desc_head, g2h->info.head);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
>>+					    "read: head was modified %u != %u\n",
>>+					    desc_head, g2h->info.head);
>>  		}
>>  		 */
>>  		if (g2h->info.head > g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>-			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>>-				  g2h->info.head, g2h->info.size);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
>>+					    "read: head out of range: %u vs %u\n",
>>+					    g2h->info.head, g2h->info.size);
>>  		}
>>  		if (desc_tail >= g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>-			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>>-				  desc_tail, g2h->info.size);
>>-			goto corrupted;
>>+			return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
>>+					    "read: invalid tail offset %u >= %u)\n",
>>+					    desc_tail, g2h->info.size);
>>  		}
>>  	}
>>@@ -1903,11 +2003,10 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
>>  			   sizeof(u32));
>>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>-	if (len > avail) {
>>-		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>-			  avail, len);
>>-		goto corrupted;
>>-	}
>>+	if (len > avail)
>>+		return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
>>+				    "G2H channel broken on read, avail=%d, len=%d\n",
>>+				    avail, len);
>>  	head = (g2h->info.head + 1) % g2h->info.size;
>>  	avail = len - 1;
>>@@ -1953,10 +2052,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  			     action, len, g2h->info.head, tail);
>>  	return len;
>>-
>>-corrupted:
>>-	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
>>-	return -EPROTO;
>>  }
>>  static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>@@ -2048,6 +2143,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>>  	return 1;
>>  }
>>+/*
>>+ * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
>>+ * is simply not available right now, which is expected and handled gracefully,
>>+ * or the channel state or the message itself is inconsistent, in which case the
>>+ * only way forward is to declare the CT dead and reset the GuC. Since the
>>+ * former is a short and well known list, check against that and treat anything
>>+ * else as fatal, so that new error codes don't silently escape the escalation.
>>+ */
>>+static bool g2h_err_is_fatal(int err)
>>+{
>>+	switch (err) {
>>+	case -ENOTRECOVERABLE:	/* device wedged */
>>+	case -ENODEV:		/* CT disabled */
>>+	case -ECANCELED:	/* CT stopped */
>>+	case -ECONNABORTED:	/* CT already declared broken */
>>+		return false;
>>+	default:
>>+		return true;
>>+	}
>>+}
>>+
>>  static void receive_g2h(struct xe_guc_ct *ct)
>>  {
>>  	bool ongoing;
>>@@ -2085,8 +2201,9 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>  		ret = dequeue_one_g2h(ct);
>>  		mutex_unlock(&ct->lock);
>>-		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>>-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>>+		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>>+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed, forcing GT reset(%pe)\n",
>>+				  ERR_PTR(ret));
>>  			CT_DEAD(ct, NULL, G2H_RECV);
>>  			kick_reset(ct);
>>  		}
>
