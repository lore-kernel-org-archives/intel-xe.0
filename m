Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA90310F9964
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 17:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD8310E086;
	Wed,  8 Apr 2026 17:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUrfXYiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDB110E086
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775669154; x=1807205154;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vDV/KAIv29vpL58PrFiXgHexpRanOJXzonU4VyKKaVU=;
 b=AUrfXYiDZJ6NlFvMle+VY69j4lKcDmIKlIUPUSAZEYPIdqVPe3tRy5lM
 TEU1Ihn/aDeLUvI+BAWV+IGHyav/Rez/sGtL/npjHcb8ivzZBG9HBgTRR
 Os1ae4dPy9Xm7Y46E18T6YU7AOnYLH93lRWSiyxYlDxHLPEIEvsfBdc/B
 aRMYuPibKArPkiIU7noaK8anpY3+xv3kIrSyyNCC6laPLwEvXx2H7KSVP
 BuwlwWEjsTEctSrIqCNRiB29kok9vjL/s9wowahIfck5iIMWlnzFF+MZY
 jUuGz0GVivxLVoMOXFU5liwR7c9P/JWw0oA+KNULm14vKvIHodPLsR/QV A==;
X-CSE-ConnectionGUID: 7CF4vowKT1qXH+Jw0YZZ+A==
X-CSE-MsgGUID: mtflQ3wvS727ta3xMLRXJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76540710"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76540710"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:25:54 -0700
X-CSE-ConnectionGUID: jHiMCNTCT0K8791zfwXn/Q==
X-CSE-MsgGUID: JBkTJJAmQqemvAVInX6kdg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:25:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 10:25:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 10:25:52 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 10:25:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ5l7WPO5JCbXVQYb13LvR0OvrDasR2CvQu6BiEDUBXXxalzEGZQBHFTOi5VRGWSWbtgx38N8YFv6vEU+KprUa2lqtNCNHE7/6IxooR80tCwCt925r73VfckUDdM0K5oIAN+WCKpEHuRov0rOq78EaL5XTu5Cb5flwerIuRx48RdHA+8vgUX7g6y7xRG3KoyBRF4oqgddL+biPgD3F5dXAbXxq/gCp3awoXOLmxyHVVmN78TziIIURAKj4efzqCVF+ft5lalXBRhpqt0VojoOW7lkyNBq/gEFsc0KTPa3goiKwo/7yhMg/XyAZv27g1H+U/kJdt8TlSItr5RkQEROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RmVHUElD3Z9R2sWvYtrusw773wLR8Mie1HgSTi80PM=;
 b=ETHtwPlX8PhGcO814jiUfcwqShkxFbbOgvEy4ZuMc4Mxg7PaORmOfVdUK0O0gpgcLwnSVtKiGKLdHIxwNHNE6Ua/48TSDhCqBl6buqFDB9iB9x4+c30Snu1UXvejjbDauiGmGWAkqoacwQa7pbHG7D711/iDg9DvMAPmALvfyFAwlofZcPxNpEJtlmWD+WIrRrx5MrVIOO10jdpEaTGBV6624dSTrRejv2IU+HgEC0QUmC0YoIeI8mhDgRgQc+LcOZcP5OXQ0CsYLOoCHsPV001CV7/HHkP5rUR/0hcsKT3LOtHWV1ERnKo/WOCAmeIRwBs925n5or4vql+/KBic/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 17:25:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 17:25:50 +0000
Message-ID: <42fbfbf4-2de0-439f-94c9-462640f4fd71@intel.com>
Date: Wed, 8 Apr 2026 19:25:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] drm/xe/tests: Fix pf_set_admin_mode() after
 sriov.pf.admin_only removal
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260408160514.2388689-5-satyanarayana.k.v.p@intel.com>
 <20260408160514.2388689-7-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260408160514.2388689-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0301.eurprd07.prod.outlook.com
 (2603:10a6:800:130::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc1e08f-b1c3-4ad6-6afc-08de9593e104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ZsfSHae9BZY/qakv578VyDIHD1/9KtbPZgGWSh3vnE8D2IOpDDZovUv7x2KFlUhtqQNsURdO7NgjEGSGkwE5NOP5iKO3mL+qRP++DXQ4LeLf5LYJecYy/Ylv4aZLwUcg/ercdc0MMMcdozZAYdCy9vzomT3leVSU/Tjyx6dlV6gKe84BWoNr10/ByWKIhLHi37PXNVoCnKjcgDZsaejTqT+mXEmkuT/dUdI3pU4vlkJ2/fJTaq0E8iUScXsUTS/1W/LlwCft2qeN93Ytt6Tzq+czBnJIaCOXucheQfCIiOarWnpp69/O0QWzaX5SyBqIRSCo84JbdnuVjb/zI3KQtp2KdN7zGcFAj6IXnFr+QWmauUxTmVrdaiGc9lNOC3pTvaqKWJJQzzKMmr48pYUVvhAOcSkJIzvoLf76WwoA3tFLuA3ji0avHceAEDXzbY7WSW3oiDVuJ6yXNFfz9FRhvvG7nwRsVdzcrDT35vz2JqpUo7V8ACZ55/jLe51/zLxhu7/YTaNw4CVybhEwjBdSvwAs0eOUhVNpt0DLWl8eXbF+HNp1PD0AY5gM28FOzunklh975QHkCIAoeM5vNt1tbUJjFu/O3nfBeD3NpTSop/AZmfvDU3PlljCozdbe/xMoMoxRntsIC2s32de1o7pijS2tg+Y1KxtUyfK/2f+brb1Tt0GYftanZYS+WzqOLZlvOec5chvRO+uPEailGA00T+dGAaA6NvdCILPfttpDck0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjAwV2JrM1c4aGZVTnhuWUVvbURBcWtWMVZUMjZDTno3bmtNRlgwV0VLNlR2?=
 =?utf-8?B?S3JOUDlJSXFUUFlrdXhmbGFBU0wxV1R2US9LVlcvNHFjeVhEMHBwS0R4VHI2?=
 =?utf-8?B?UVdSZjN0Y3hwSmJ1WWNzNzRxd0gxNCtzcHhKYlpGT1pSZ1hTdi9zYXdvZ2U4?=
 =?utf-8?B?dklHdUo1VzllNHlSbGxMa1ZvNnNiM2w4UHQxbjlyTCthWjR4UjhhTFkwWW1q?=
 =?utf-8?B?ckVuOCtTUncyTjMwWTMvYUhKRk1wZDFNZERoNU9FZnB6eE85TlZKTi9xUnpM?=
 =?utf-8?B?L2xPZW45U0s5dHpsOW4yMW9Jc3BkdHpJYnQvbm5vZ2E3WHVyMUdkMU9qbVY4?=
 =?utf-8?B?MjEvOTdYa29WbVIzNTYxSU15aVBzNG1pZE9kdWF6S3lOMmlUcTZSK0RDOUMr?=
 =?utf-8?B?QzdDMk44eEtXYUVVTm1UZDFYOE5ua0hNcXB4U1J3U3VvaTRtWHU5RXRNWFRS?=
 =?utf-8?B?Tkgyd3BsRTZKTlVyK2kyL1NCWkNYQUl3Skh5Ky9FU2NRV0xtS0t6RUtqUkpS?=
 =?utf-8?B?eUswSkk2bXYwTktpZlFaUGRRaE5PdEJLQTFhL3I5MUllQ2NUR0V1ckF6RFNv?=
 =?utf-8?B?N1owRERDWjFSUTArWUI1NXhLRmpqeExCRzg0Z1VVOGFBSXYwSk5QeFZiYU9C?=
 =?utf-8?B?bzhKV2tIdGdtYWlUM0R5UkpXb00vNlVFWjZBR3N3QnFBSEZnMlZ1T3Z5c0Fq?=
 =?utf-8?B?UzUwdkVLcmRpZjV1alBqbGJSZnlTU3lzVXcvSktYa2MzRS9mMDBUeEl4YWJN?=
 =?utf-8?B?eHVORG02Qk5zNElxRTZ1Rmk2am93dTJsZHNqVmd3NVBsaUZSZVNJcjM4S1hu?=
 =?utf-8?B?UkN0Y1hXY3k1QmgySTFXQ0lwNmovODJBNUc2cjRrTGk5WWtCM202aWpUMkll?=
 =?utf-8?B?SmgyR2JNaU1PYzJ3dEVCZUxoeDdqeEpPQ3ZYUllXTzVROUY2eHc4VXpSRkRB?=
 =?utf-8?B?djYvU0ZSRjErQUhqU215T1h5WEdubFlOTFo1aDkwU1IxUDlxUC9pbWlhZWxF?=
 =?utf-8?B?MG05M0JCbEF1N1pkS1hCQkcxeElpNU1XMGVWUElLazdreW1xR3VaMXFHU3p3?=
 =?utf-8?B?d3duR2tVZjRNamY4bkYvbFpqbHVkeDA1UkxWbVF4YjJ6b0JNSmhidStOZHVs?=
 =?utf-8?B?c3JpY0J4cysydXlqWWk4blFSY2xCWUZXYy9JL1pSS0JTK0FXNS9Zb2t1ZmtE?=
 =?utf-8?B?ZDl0UW0vcHdUcmRpUEVOQzYvK09ZNXJnZG15MG85N1U5M095Mnl5NlhyVTNn?=
 =?utf-8?B?eTdLWnFYZ2wxUjlKQ2RzTStYVlNtbUM2ZVFCNjBwcmxreCswMWFOa1lyNnhu?=
 =?utf-8?B?dms5UHFPcHdzbUJpQUNzMHJ2SldtWkZ3WFFXR3owUXMzdmNMMThoRG1tVGJL?=
 =?utf-8?B?b3hqcUtyMW9VVWk3c0JpMjZXdDVkc1Z6UTdGbnBlSExWT29sQ3lZUWpxdHlS?=
 =?utf-8?B?bGkwWlRzdUo2V256RmdxZUhkVklsSStmQ1ZNZEUwSWZVSFV2VFdsN2h4SlhJ?=
 =?utf-8?B?OTN3UFFRR0FnTzdSN201LzVFVlhVVGlCUHMrRVBrL0IrdGRUNzdvajFITVQ0?=
 =?utf-8?B?aU9JVnhmODN6N3h3TVRjOC90eHdzSTFkQXozaEJMN2xuT3ZVSUk0UTNNS2xJ?=
 =?utf-8?B?K2sxcDkzV094UEZyckl5Z2lMdy9EbEtGWmRGRzdUV2pZaHQ4bzRyRjF4V2la?=
 =?utf-8?B?eTZId3RZN0RMZ0pKRnAzZUtnNEhjOXIrVXVNNENjd1NCYnRWR0xPakVYbUZk?=
 =?utf-8?B?cU00cVhDc0RQYmtxTTgzTGN5NTdyU0JNWWVJdnM0bzhDdDZWLzFBSUpQYThS?=
 =?utf-8?B?azlhMys3SlpkS2dZTi9RcUh3UjliOTZQcjNib2hiTlNodWYwSTBhUWM3bUJp?=
 =?utf-8?B?dVZkKzFQcFRUY0U0L3R3Qm80MXAwamdCMmVCU0ptRFV4cG5sSHpQOC9XUkNH?=
 =?utf-8?B?YUNvQ1JvSXBxeDhCTE9mM0tpNjVtMUo1anliQkVGWDFXY0JTS2Nnemo5RURU?=
 =?utf-8?B?ODJHQ1FiSWdkUzJxaHV2WDdITVBEbzI3QzdqV0tSNVRNQnRvK0NmRkFkc1hU?=
 =?utf-8?B?Qjl0NXJlU2NoMEpCLzRtN04zUENBeG5rR1MxeHI2ZEZjRDVRQ3liVjhDT1ow?=
 =?utf-8?B?Uit5cEhvalA0UGxoc1QrVUw4QW8yc05rZUYwNks0cFJ6Y2xONWdja2lxRm1z?=
 =?utf-8?B?WGFWeStBZ2NkSm9DcWdUUVMyY3ljRG93N2JxSkxENTlGVlcxT1MzY1NObW5B?=
 =?utf-8?B?QjNQUjV1OS9kbEo5VjBPd0lGZnNXaTNMNmk0S0p0SXNSMGE3WmtVTlhJRFlv?=
 =?utf-8?B?RWFMZHZLVWYwYXdBSjFlVkJIQ2JmTmt0cE9EajVURFBQNEJxdG1DZE1uUlNm?=
 =?utf-8?Q?7kYvilqqOQMtt7Vs=3D?=
X-Exchange-RoutingPolicyChecked: Iz48GLZ+05Xlfw9Z5pKnIt5L0tYlI4ZBD4+1lB1+LgABFlDfvyqlSmVAAOz7noYUgYNtJQ9ZiIEWNpwVcbPEPf3DPGFGHHqLvc9Cg5sjB9x5FR7Z5pQN/GsQxy1FarmQE8m7vTBTP/oQZqArNevA7exDIJPcmam8tR9WGI0byc2CSZFQ61I09bKXLNtODUWcM7SGfunRrfDfVi5+Fyl3GSJIYXoYrm7R0LmX2NqV3AzUyn92iRwidPEQV9ceaJTiOuxDM9+9nUSyNYefIqu88FigcR8PuIkdOjq4Cc4FvYwBH6zrgyNf5CIyXVIfXr1cuJFMbyZOJ+3DV7S+k+WToQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc1e08f-b1c3-4ad6-6afc-08de9593e104
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:25:50.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh/8awr1WK92/ts8dJLd6zkjedFL8Q4wMjnCelbw1jiqVJjp4Od+OGJ+bn/cF46apZxn0L2JcZfsySuU3Bx4jvS/cKiZxoV98lqjjcKt8Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

title: after patch reorder there is nothing to 'fix', so maybe:

	drm/xe/tests: Update admin-only mode selection

On 4/8/2026 6:05 PM, Satyanarayana K V P wrote:
> Admin-only mode is now derived from xe_device_is_admin_only(), which
> checks whether the device was registered under the admin-only DRM driver
> instance or not.
> 
> Update the kunit test to have a stub function to mimic the functionality
> of xe_device_is_admin_only().
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V9 -> V10:
> - Moved kunit_activate_static_stub() to pf_set_admin_mode() (Michal).
> 
> V8 -> V9:
> - New commit.
> ---
>  .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 22 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_device.c                |  3 +++
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index efa8963ec248..a235ec04d6b6 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -7,16 +7,34 @@
>  #include <kunit/test.h>
>  #include <kunit/test-bug.h>
>  
> +#include "xe_device.h"
>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
>  
>  #define TEST_MAX_VFS	63
>  #define TEST_VRAM	0x7a800000ull	/* random size that works on 32-bit */
>  
> +static bool xe_device_is_admin_only_stub_enable(const struct xe_device *xe)
> +{
> +	return true;
> +}
> +
> +static bool xe_device_is_admin_only_stub_disable(const struct xe_device *xe)
> +{
> +	return false;
> +}
> +
>  static void pf_set_admin_mode(struct xe_device *xe, bool enable)
>  {
> -	/* should match logic of xe_sriov_pf_admin_only() */
> -	xe->sriov.pf.admin_only = enable;
> +	if (enable)
> +		kunit_activate_static_stub(kunit_get_current_test(),
> +					   xe_device_is_admin_only,
> +					   xe_device_is_admin_only_stub_enable);
> +	else
> +		kunit_activate_static_stub(kunit_get_current_test(),
> +					   xe_device_is_admin_only,
> +					   xe_device_is_admin_only_stub_disable);

nit: to avoid some code duplication you can write this as:

	typeof(xe_device_is_admin_only) stub = enable ?
			xe_device_is_admin_only_stub_enable :
			xe_device_is_admin_only_stub_disable;

	kunit_activate_static_stub(kunit_get_current_test(),
				   xe_device_is_admin_only,
				   stub);

> +
>  	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b0bbb079ca8e..f391a1987682 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap_util.h>
>  #include <drm/drm_print.h>
> +#include <kunit/static_stub.h>
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "display/xe_display.h"
> @@ -446,6 +447,8 @@ static struct drm_driver admin_only_driver = {
>   */
>  bool xe_device_is_admin_only(const struct xe_device *xe)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(xe_device_is_admin_only, xe);
> +
>  #ifdef CONFIG_PCI_IOV
>  	return xe->drm.driver == &admin_only_driver;
>  #endif

