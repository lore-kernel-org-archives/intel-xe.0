Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93313C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5B910E1FD;
	Fri,  4 Sep 2026 18:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYzUYxVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD3810E1FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788545939; x=1820081939;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sGmFPcKwlIizxap14gaLXAtqo4LMCG4ZS6H1RoyyxJI=;
 b=NYzUYxVqCBNIuWWlZTMCNYh2GTGHC5Wi72V7usCN5NXI/h7pxYjZfORf
 VQPP0BjPhhcvVE1VgLgz3oz78eV96jZ3lbcHtKpZOieKO42PHgWCPchs6
 EzTSdVymZfN5ED0ibjPlq3CewrlBtfK8PI+IkUVAJmA3q4mNZWlrkIBS2
 fFbfMLbWWQM8hDgji35lzR8lk1mh/pnwqgn+tptmgt1nRJuXXIdT0AZq5
 tD00kOerWOnT1nBiOmJy3n8bPM8R3GIDza3KiR7AZr2cE5xkydm3Mh2Lk
 EgvtYk2qYfwsBZ7jaNqKB/kQuAZ6ZUAptS01LBgwTDza9STi1Eseh/HiC w==;
X-CSE-ConnectionGUID: X6Fah8eZQyqjWgJyaXnLHA==
X-CSE-MsgGUID: fgX1A+wdRCSJAh1oW1NqeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99386083"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="99386083"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:18:59 -0700
X-CSE-ConnectionGUID: JnKUitMaT2yRPzD+8SHkNw==
X-CSE-MsgGUID: GNIaDaRvQB6zolgBk27nTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="268805402"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:19:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:18:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 11:18:59 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnD0DViIQqoNX6Gzu+1uezLT2EqgUYXNM7Onyt0iKxFFt0f6/29uZUp20kSi7ac4whiqKz2ea0Nug5l8ky/w9PpV1gAit2CM61v5yKBdd2dPBeOAnzoGtlBgP07O176Hk5VyFeuAqIUHlx+n7PBXfDcmcr565mRSwGb9YN0ZV4WpQ37NC13cX/76J9SLtCb+kzM5fgjIQQWCefT3hlmLbLpNAMLHenqPcGCyBEJCuIocjBZ5eKIGTfaRDrrRyMKnoHtyDvSsYk78TUI5/pbpclVzfpOhZLOxOn22ouw2JCI0yVX9AIqwoDquGOZnSuKE7FnULXkTg+NFfpNATvlaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKJkS2clWErNzpbztXBIFrZ98RGAopHlP7oqt7BKl9c=;
 b=R7TECIi15iWsAMIoz5B7TyvHyAdnniMFl2hgRxEaSRbCfEzXflVujl+OGnENDIZyqUUYL7SRE7w9yQgwfVHygfuudK06EbiW0IN234Men2W0fdj4nQIwz55S8MSLDJu2qMIdUeM2Q+VgAeBZfD7bVMBBEut8ngZxj9uRDeWUyFv8Nk8kZj6idLINRCH6TFjbu9fNpFc71iu4Dg7C1EqJ4d5PGxtjYudYeUYyzD12tDYqLqCZWBRgOCZBXKh+zXCBDVWAe4p0x0wyNfpqi8N+vyBlrjnuaIuMnCqJVNSDgiInl5Yey6Ju2LQ4vtRs66flnJ5jLRVEwFi+hJl1gnMXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LVTPR11MB9911.namprd11.prod.outlook.com (2603:10b6:408:3c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:18:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 18:18:56 +0000
Date: Fri, 4 Sep 2026 11:18:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 2/2] drm/xe/sysctrl: Add helper to check oCode
 firmware readiness
Message-ID: <apsLjZcZ5zl89jTo@soc-5CG1426VCC.clients.intel.com>
References: <20260904134935.674507-4-anoop.c.vijay@intel.com>
 <20260904134935.674507-6-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904134935.674507-6-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0326.namprd03.prod.outlook.com
 (2603:10b6:303:dd::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LVTPR11MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f4ed893-a4ee-4929-8042-08df0ab0fbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|6133799003|5023799004|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: eSY5YwRwCTxGC8Id9JenOUaY67HII1f9fAx5VoLahEwFiAvsX16QOqDZCrkF5Lk9l1vFhX59diRaOjrpie5Uo4KjQAMRU1gFqumF3pTfCEQeKMUDwgpwS/+HrktRIe8YqA1iPGtN7NjAoeTY+SK/IYZt/t1mXPRqKIHJAk0QeWloHhCLV+Vg2v9V1b5mX5eMPb+kBZL3+9QS7+YUoUa4VuTe9M/F5BK25tBLu3Lb969jicgknC+h7rR1H614ZjGvira19H2qbIfY+4g1vFzV6JAXHh6CxX+vjWGIE2PlffC7TL6q0uyJ9aCUHK2XetBsrAxNuAXPSc9ywmiSWZVAJqJcg4yfs6zpEhjzRNtwfTb9CvsZMOClq6nDc97yOaSUbTjPJjsUOzUbh848mAS+wW4yXMPTJWhTgISzG5oLYLPQaShoTPppieLQPPJzqq99TbWZV5m8O+JqL40Wpwim68Wai7EoeqsGTC90XXUKfd3W/Zm7ZcggF6FYVw+LJ71aNLo1k3dsSHPMZyrUywbv1fWu0HNuvCZJn5bMgW0xChqXhQub3948hpjLkmKXoK+0w7nKy2oAvCD4Waz3bZ/kDPahHlCD3Y3aGbFp0B056sPnuHhbCXriHjSuBodXb6h4nElU3lwN4ynY3kFAK927E/9iOTsUJnqiFFj2Z0iRvr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(6133799003)(5023799004)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkFIdk5kQU5EL3N1VWY0NXF4L1JYNGZkRGVqL2o5dGtXSHVvKzlhRWN5ZWdU?=
 =?utf-8?B?SHR0VE04OFArNS9PSWwxVVVQeDdObjNzQkhXb1ovUGRPYTcza1hmMzQ4NW94?=
 =?utf-8?B?VmVVdnMwa0VHK2preVo3cHNDL2lHVFl5NWw0YnNzRWk3SisyWFZSZWk3Q2V0?=
 =?utf-8?B?a2xOOUE0Q1M3MnZlQ01UbEFxbnJMOEY1TmIwRHNKZ2FEVzRQbXA2UWQ2SktS?=
 =?utf-8?B?dTBFanRoV2FxY3dhN1VXQ283Zjg1K0p3QkRTQmN3bWpPWG5sUDF0SFluaGRP?=
 =?utf-8?B?VFduSUl3dTZVNHZzVkszaC9PanFLR0RtWkhrM2ZtaWZoajZrTlNXbWFjb1pF?=
 =?utf-8?B?Wjk4SU1TWFFRcXMxOGltZU9sdDZWcUp4UXpzbmhvYUw5c0JuOUR4cjZ4cHdZ?=
 =?utf-8?B?NEpSenV2bEhHMU5IMHBSYTB5UVNFMHZaOWdoZ01MdTY4SE5Lc0VLOTZkeWFI?=
 =?utf-8?B?cDVRcmRBZ2gxcitISHdhZ0FjdUpYSm1VaGgrdDBiaytBQ2pEZXFHVVRiUzZV?=
 =?utf-8?B?bXBkL0hYZGx1ZXRSOUdxdUxvVkNxaEJnK1V1VkVLU0RadTJrc3lROCtMZlpV?=
 =?utf-8?B?UzV6T1BkTTg3Ty9mZ2MwM2M2NGxDaXZvaS9pcTh1MmRzU1hOaDVLVUNrMnZC?=
 =?utf-8?B?OHNCTHpCTmNKY1FtNkhCdG01RUkraFZsYlE1Q2xSNFJEdGJxTXRWb244bFov?=
 =?utf-8?B?NS9wTlV4RThmZ2xzQXVMeC9ybE9wTjZjdDUrKzdseXplaWQ3bWUxY2lwZUlp?=
 =?utf-8?B?UmV3aGd0cFVuMUhIRWUyQzJZQnlFd1A3VDVOSWZJY2RZeUtNN3hTR2lDSXVS?=
 =?utf-8?B?bDhyT3JHWFo2bFQ0dU1sMlRpMVhIUGVneGNoN0hnbVdvRU1sd21ZS0NZZjFr?=
 =?utf-8?B?WkRPbnVQK0FUbnVncXUxUHpGTzFqUWdRQzA2NDBqSm5xakxhbVBORGRSQmVh?=
 =?utf-8?B?ZHYyRis5a3Q4OHVSY3MzcFdQT3JWekpFL3AveVh5MGFOYUczSVFPWFpOSVlR?=
 =?utf-8?B?eVVTOXZRQW94d3V5NUNMNTVxWUQvRDBTWW5ibURDd3ZxMmFyaXpodU4rdHlF?=
 =?utf-8?B?MWJIZXJPR0RJbEs3c1g4U3VSd3NzMnJqb1RGM0VnVWZ3YlNuMm4wQ2RTRnU4?=
 =?utf-8?B?N0NJdFRpOFhTMkh3bDh4V1g1YjFRVjViMjV0dTJZbEVzcnpUWGZPWS9iYWFm?=
 =?utf-8?B?dVdSVVIva3BLd0xZU1RrcHYzRkViVHlSSTBEWGMvMDk1enNTU0hqd2tQb1dp?=
 =?utf-8?B?RnhQc0hoVWZUbE5uY0lTUmhXbFk4ZUQ5a1E2dHU3MDE0T1NQYXNqRWpSdGRM?=
 =?utf-8?B?UjRmRU5pQVBTTEdLVktvSk5wZURDd1VWZDNzd1h6L3hJL3k3elhWaUlTejZs?=
 =?utf-8?B?ZC9ycG56TXVCdysyZWYwTmkrcWRpMmxnKzRSVGU0VHBWNGdXU2hWZENPRkRr?=
 =?utf-8?B?TmNlZ3kxKzZDZ2FXYVVRM2NVZCtJV0svenhOMjdkdlRKVCtTcDhSSnJEejkw?=
 =?utf-8?B?d1luUmhQN1JMZWU3L2pWbzZLYjV4QkNBNmZmRW1VNUtHT00yRDY2NUFhWHIr?=
 =?utf-8?B?STdhMkhrK1I3WS9mdFcrZ0lSMzZrTXFZSFowNEFBekhVeFZmYVhWWWRPdVMz?=
 =?utf-8?B?NnRGRmdWdjhZREx1WlFXOTluRkhRbXNWalFzbG5aYmNsRFRMOU5XdExhQmVn?=
 =?utf-8?B?T2hXWjM5Q3BjYUsrZ3ByckM0SFpIL2JJWGllVHpoTzdBbjQ0ZkhpdURrVkk0?=
 =?utf-8?B?KzVGNTVCT01Oc1dLZklZR1ZyM0g4RHJ4NXJJSVd4Q2JneFBqaUNqS3BrUHBL?=
 =?utf-8?B?RzBaaGJmN3FDdHFidnE5dmFabEo5T0ZvVDlnaHZRbUpTUFh4dHpVSzh5Q3Nj?=
 =?utf-8?B?Y1AvTmJ6U29YSWttTmp4SFB1SVNZeXNLb1ZjejZSVU9QZ1huREl3alUwVlhW?=
 =?utf-8?B?Q1pYcXh1YjhpMElhWnhQZ0FlZ040Rms4R0lXNVJOTTdKeGVyczd5eDRBQ1Vz?=
 =?utf-8?B?K2pvb0FrSUlpcmZNY3NvaUppc3RLSE1zWGNteWFTSEFySFYyZE1UTEROMWVM?=
 =?utf-8?B?QStObUFIWFA4S0Y0ZWM1ZUZ6WXhGYjR6MHNLWXViTlZJTy85eDZNc1JVMXpP?=
 =?utf-8?B?MTZzN1FOMVkwcDQrd3FZWmZiMDg2aFhqVHpzbk9tVDk1QjNCS1Q1VDcwQUxh?=
 =?utf-8?B?SDBYQW9LN055eWM4MFUxeGo1YnR2NDJWaFdtV0h3MnRJL002Y2poMWFqR2Nu?=
 =?utf-8?B?NWFBQmJYeVRlMkMva3RCNUIyNlFmbGxoNnZlQWR0Q2J4allhQm5MMXBkbkRC?=
 =?utf-8?B?eXFjWmRCTHJyMFg0RHNIQzk5dG9pdkU1Tk9KVm9GelB2RXdQQ25nbTdlVlpR?=
 =?utf-8?Q?y/0k21ohaWR2PkDA=3D?=
X-Exchange-RoutingPolicyChecked: Dcw8gGpoFJvJ2DPiPrzIOSv7vmAvQlrLnv8tO0zmmr7Q01TC6Jdfa9iD+7FG6+0WcFH5PkgYkLTIAv4KVSpd9lKKkyxhOxA0r8DRKnxxT+yyRbU1HtK2OQK1OeKnObMZ78chpi50/Xax2hu87K8Uv50t2/aY+G7lwzEXWJ2QiXDua+C4Melhlcw3CaZobB2aS3TSzgnY4yq8zVW6808UraeDjcrSsUoXP7vjEGhNukokdJbgsZCwHcz56/IOU7bVShP4rO6fVvYcIapUAHL49vR7cqWiod8cy1mQyYvJaqX8Rv5rN8fMANPkR9OJV0s5WQ78stNBYynNS7x3NhJgeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4ed893-a4ee-4929-8042-08df0ab0fbdd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:18:56.7649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oek14QxYW7TO5TD+9CYZbEQ9wC5CoidqnbIr96bysYCJfxKjaOXmXFP8pOiaC95w69lRUmEoRsW9OSF7ejVBOJVk9ZdCWKLCP7QmPXUfYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9911
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

On Fri, Sep 04, 2026 at 06:49:37AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add xe_sysctrl_is_oobmsm_fw_ready(), a convenience wrapper around
>xe_sysctrl_check_app_status() to check oCode application readiness.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
>v6:
>- New patch — split oCode application readiness helper out of the
>  original patch into its own commit
>
>v7: (Umesh)
>- Clarify xe_sysctrl_is_oobmsm_fw_ready() comment for sysctrl-less platforms
>- Add XE_SYSCTRL_APP_OCODE to enum xe_sysctrl_app_id in xe_sysctrl.c
>
>v8: (Umesh, Rodrigo, Mike)
>- Simplify oCode readiness helpers to a single
>  XE_SYSCTRL_FIRMWARE_APP_INITIALIZED check
>---
> drivers/gpu/drm/xe/xe_sysctrl.c | 19 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h |  1 +
> 2 files changed, 20 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 3b7fa2c9c333..4067e1dfdcd5 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -42,6 +42,7 @@
>  * application ID.
>  */
> enum xe_sysctrl_app_id {
>+	XE_SYSCTRL_APP_OCODE	= 0x0C,
> 	XE_SYSCTRL_APP_DIAG	= 0x0D,
> };
>
>@@ -181,6 +182,24 @@ xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
> 	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
> }
>
>+/**
>+ * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if oCode firmware has reached the initialized state, indicating
>+ * it is ready to handle requests.
>+ *
>+ * Callers must only invoke this on platforms where System Controller is
>+ * present (xe->info.has_sysctrl).
>+ *
>+ * Return: true if oCode firmware is initialized, false otherwise
>+ */
>+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
>+{
>+	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE) ==
>+	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>+}
>+
> /**
>  * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>  * @xe: xe device instance
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index 8dc576796890..b69a3f474236 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -20,6 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> int xe_sysctrl_init(struct xe_device *xe);
> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_sysctrl_pm_resume(struct xe_device *xe);
>+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
> bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
> #endif
>-- 
>2.43.0
>
