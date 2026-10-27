Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13F606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h36o1Hvp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6399B10E1A0;
	Tue, 27 Oct 2026 13:02:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C2410E1A0
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793106143; x=1824642143;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w+xfcOXPajA9IPjoXspREU1+L2t+2gKpqaGUJ1A/Cts=;
 b=h36o1Hvp2BN2F6dZrTWWAHu0nhMlZaVfK19V6m/3HZfz1/sq2TvUbBLe
 gG0Pvm8QXGYoX/XWln8F7b2ZzqIrWBdQS1U/cFT0/KQkdQPOPVoJoBpYi
 zVW6rr1AnlS/PrpGxfIyPPwmsQzx1L0WHEOOKKMaLBK6CgcI/F4zF2Rfe
 aGTev/7TRNW9B0sM2Q1RincXF640hh/GJbX4YEf18ZLiFq++TzGAPvDjr
 8f+VOIgJYetVIMqoCzlSoM9/jK5n7buNIW6IB+TWiijWH048R5jiz830r
 5Bmyy9ojswKBqGKPqJuOD8oahtZuwqfuE+OBzp/RrtJ9BI/ZEvNTdJut7 g==;
X-CSE-ConnectionGUID: w4sHKLQVR82wh0IaHtlADw==
X-CSE-MsgGUID: 6T7TYaJDSpqaB5ys6Gy/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1679403"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1679403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 06:02:11 -0700
X-CSE-ConnectionGUID: DY8haEUlQwG8kBqdd6ztDA==
X-CSE-MsgGUID: F8deSHF3Q/OpTTAP3+ek4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4619083"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 06:02:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 06:02:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 06:02:10 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 06:02:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewFVeTP/XAg9tqiFfLeAP7GbPzbXCXY5OV4EvNMTvwQO6NbGDwJKeaAHWERKIOz0n1UDnolD+c0Qn7brzK9qkPaL5V/Tjv9JbP2PQvj47YdjttFH1DhHa3OyQscW0plS2jOtRp3ogJxCSMphJY1BW+oBor7iuCDn6rb3rG4Oiy6h9OZgJKHWvZCV6fVr5IN/GPRIkXNPz0MSyPgS7sve6EuDa2Aw3bjlBQWfKE2f2qQOc1VKBqRMVAkxjV9QwWiEByBOf6WQ6J8H0B7sp2NC3UJ5zfVB0eWDDOMbMiFwNlVIvAb51tq42gq1grXiGOHO9BYo1d/TP/FO7azha+rMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb3UO7il982XfV6C/nvz/O8lfJf6Q1fZEPQjON7bpiY=;
 b=myjxS91Lu1u5IYdQhcuvf0ExSQvXgvVJ+iJQbazTfBhnVNO5MPCex0I9G32HMhnDpcTkgnDO5IAhli1URDUZlwNsvoPOyhzAsMkdJmrGYncynkSmH03EjF64fbsCtgN6Go6fMBCUCLFQEAXw3la/OggX4iuK2h3AuC4CeLCowdSaDOOuNsyRCWrNqkeV3xWKyEOJT1Ii1VBLhnny2vdlG1db9sDIlXJDeH14RI7XaJ2ZDgDdPvZVVsHS8ce15bCeSg6xM3yZtvE+3AJDjx4FGC/o09Om4hrqt3octU7w6Ium41Ttz1ZQmcnGO10aBsOCCj8HHjpluqaO3V24DZbW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DSVPR11MB938433.namprd11.prod.outlook.com (2603:10b6:8:37a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 13:02:08 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 13:02:08 +0000
Message-ID: <f99f8a5b-9810-4c1d-93c2-6c50f2b3397c@intel.com>
Date: Tue, 27 Oct 2026 18:31:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm/xe/hw_error: Reuse CSC worker for generic
 error handling
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-12-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-12-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0202.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DSVPR11MB938433:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebdf306-1d43-4f39-2323-08df342a81f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|10067099003|56012099006|261026140227099003|6133799003|22082099003|18002099003|261026121527099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: EIfCbPijwJqu2tvIc7+r8UVPU0iPM2NVfMU8sdXTLKICmQXO1J8lLlcgcgBudX9vnyrkURqjvb+mvHF3I3lduAB+stSY77tN/Sm/ig+1e4FniftVfniXi6s718LrMHe5rGuPbVPQqYnVTzvGEcgE9dlSb0JxwWDdyrJmKyGAhszujtOZJxehuEmPNiCgKjwHfNY7x4fOsV4ovg/ypjdyQjfT6dv8UgbhRT/7o7qwdbDw4dFuzTVwEqNzOkjA5iBjUG8IICzpbUT6x0Jt7Z0iUCG90HcDTDTJ39yHQLK0MHXTdHPn25nANQp1NAZ4466lKpGy5v6QSgdUy6Rmm6Ao6AKPlCF1TqiqiNeexDMpLI4yvcBhuniTtoTfSl7lWS3TqUggx6Kg/M+P+kxEHS+5iZsBuZL1afenQBrT7buPGzpVvRAW2V96NysR7iSU5k4RZC0rCpE8tFoy6HX7DXe72W5cw240Sq/gb/anCNKiXwFRjR+0UIyTV7ceIsWWjrEgWNLkL2gZEJQbLCDTe+sluemrdGU2w+Qa3F6E/qDpCyp+WmqOlt/JlOxE7n1lgZEpLLd2dJ2/ojQVZK0fNSGdnQD3zIwhGfZiJtX2YetrUMxDaF2APS8ZU218kXN7t+yawzEceZu+vRS1IoYLPyX55mWdc1N+lBwDtbeHwva7p1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(22082099003)(18002099003)(261026121527099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnlMMEI0QXlnK3BnWm5WS2JMNzg1dlE5Mm1aeFFHdzJDV0ttUGxSd2JZOFdr?=
 =?utf-8?B?VjBzZ3U2amNaS0VyTUFCdU9aWUVGZTZBakpib0J3Z2lOT2RjbUNXd244TmVw?=
 =?utf-8?B?dXkvNzdrQ09ZWU15OWQ2N3BhK01uOVY2QW1RRDZNT25UcStUYXdKa2M0Wnln?=
 =?utf-8?B?N0hIUTZwQnQyc1JHbzZpMWlmdm5kT213SHVwQ1hQWmhqYnZUU3NDbERSUkp4?=
 =?utf-8?B?OFJ2ZmdiaWUvVjNzc2dEenRWMFRMV01sdnhCS3hna1FvQnk5U3l5VWlXVGZX?=
 =?utf-8?B?c20xOU1CSXEwSzh4dHgwd0NVYWVrNjM3ZE15WmxQSVJQQmsrRTdXbFRPcGpw?=
 =?utf-8?B?WTV2VTczS21FcFo3Z3BGYkhBY3dHczkrRGFHa3M0TytueVg4NUtFVzlWMlA2?=
 =?utf-8?B?SlhTaGR4Q1JJN2k1Nm9hbXBWYTJLU1I5UDc4eUl0V3FJVUVBUUk2a1NwQkJ3?=
 =?utf-8?B?T1hwSTJxOWRXVlFVak80dVJldGMrbVBsMXZUaC9Hd1dabGdHUFVXY0dma3pI?=
 =?utf-8?B?WGhXVmNwZUt6QWlYa1liQjdLbVMxdEd4RWhwMW90WTRCMTRsWHpsaTJhVGw3?=
 =?utf-8?B?QnpNTU1sZE1zZ0owMTNnUlZFaE5hb1pyOXo2anNmUzBkVEFZR2lKQnNzMzQ5?=
 =?utf-8?B?czFCSk15RWZmRWlYeitLbkFEd2V1WExCdVRVLy8vMm4za0JBT2JoUnBqbUZ6?=
 =?utf-8?B?SDEyK2JHMEFUYzcxdVA4OXdOY3QrN0ZTKys0SlhTbGtmMHlqSVBMN2hra1FS?=
 =?utf-8?B?b0kzY05ORTJXKy9tcWJBblp4OUFjWHhhMjNzb1Y2aVNDQXdGRjlSRzFYRlo1?=
 =?utf-8?B?RXNUa0FkTUc5SnA2ejlPdFovQnZRL1llUHBXSC9iNXJmRTZ2M2poUjdEbkRV?=
 =?utf-8?B?V3RXaHIxaGJGVjlvaS9yVWxFNmU0YlJoT3REZnNrTk9Qa1FZNlJyWTZNZW1w?=
 =?utf-8?B?aFlJUTRlSGpjZUhPWEFyQmNUcnJoaFJMc1ZadjY3N0JqS1pySUpVSWtPVE1J?=
 =?utf-8?B?aTJ3ckpGbWg1L1VNODBoNlg0RnN1MVdCeTRrRDU5eDd3dkpZU3RPUi83cFNS?=
 =?utf-8?B?RE9kVG1BdlhLRVB4SEZQQW5kYWdHeXNLekg2TEJQRmN2elNmdlJTV09aeWJL?=
 =?utf-8?B?aktPa2RWVDFaekxBcmxuQ0xPa0ZSckxUU1lNV2U5TGZsYUZUbS9KQmhqK1dK?=
 =?utf-8?B?dVZpU1dRanE1ZncwVG1DMHQ3Z2FyQk1xaVVFWW5tUWZEZWdWOUs0aDFSVFFk?=
 =?utf-8?B?c0JwaGNJTHBNcEUyOStjMjJiRmpGaHRKVnFmeSs5YU1sd3dBOVhjWmZqRy9j?=
 =?utf-8?B?alh6Uzc0bThsUUVmZUc0dXZTK096YndoVkxvbjRnS3VVdkZOTjRFQlpzejFG?=
 =?utf-8?B?R05wUjdFam5MV1U5QU9NYVBFMmR6OHhRbWpuTlBZWC9qbEhoK04rM0RuUWhQ?=
 =?utf-8?B?QUh3VndPdTRDTWJDQ1ZyMHR0M2VveGxNd2VNY0hBUTB2UHc4YXhZaTkrMG90?=
 =?utf-8?B?MS9PQk5iZVZrRDNJbk9ES09KQlB0WG5vRnBMZUVtdHo4eEp6b2oxSE1NRmdm?=
 =?utf-8?B?ZDV4aVhzM3dkZVVKNVg5SmtVOHIwWlZGa0JNM3pybUZnRys4Y0laZU1oSWx4?=
 =?utf-8?B?b1NWWWo4VlFhMkhPZHBlK3U2MnBlcGg1NDR5L2hmMDRBeUcxcnZXU2xobjR6?=
 =?utf-8?B?RjlKUUJ1dnRZZ2djNGlFbWc0VW1KVUg0VlVQMTFSN3ZHRFNHT0VRYStYYWlY?=
 =?utf-8?B?d3VaQW5WSkNUMmFIN05HZlNINldxTkNoZXdwY2VCQVNMUElwZHJRNGdCUnZT?=
 =?utf-8?B?ZnlNT1BSNi91aEtiblNKTE5rYWJtS0tvZC9TUzhhc0NCOHJtNnVhbU1nYWRX?=
 =?utf-8?B?SUM5UEZybmpEckxzUzVFeEhtNWVxWExUOGpDcWYvSi9Wa0x5bFhPMGxOSVFK?=
 =?utf-8?B?amNPckFJMUszeXhiN1JpSFhJWThEQjhEc2QvK2dmVEY0Unl1WjRiNjQwaU1R?=
 =?utf-8?B?NG1yckdFYk9IQWNpN2xYK3JnM1JrbStGSmlKckZ0R1A1MG5vV20wbTBodkRW?=
 =?utf-8?B?SFplZ0J5bHo0QTFvRkt4THoyZjFEWk5YUWoxZHJCSVVIQU9aVTgydmxCa1JK?=
 =?utf-8?B?Vkhpc0NLTGpnUkJWemFTUjg3aVpPMmJtdHFmQStIeGRDMVkra0o4Y0pybDZu?=
 =?utf-8?B?dURESWltcmdDdnNxNzl6SFlwY3RaaFJwMU1Sa3M5cjZheWFrOE11YTFQaC9N?=
 =?utf-8?B?YTczVnBRejdnN2xtbXdrVUFMc0JsdC9LUmlVc2pSZzZXZnVoVklsMFk2dGtk?=
 =?utf-8?B?UlVIQ3U4aUFxT0cyeDdyMkNyckxZTWNuN2QrVDhQMjVzeGhwTFF5dU0yb1I3?=
 =?utf-8?Q?vKIYQjrGCCAajzYs=3D?=
X-Exchange-RoutingPolicyChecked: hhKhhQUxFsvhRlAl2yXUIyRXhrx2mICksVKh3ALEH8AYvSHKkCOkujxLjAyH3/LS/aFHV2aXHlwIjWksdy9fLBZYjmiTQ4kEw0BkHvRSGPajam7larkssVyBVjE9gR0aOkSHIn5ELl11HpISC251yqkVvuznOBRT3jrq/FKX+0miokQqjObXs6LeHlm5h61NWytPS8evZuhJSONcUQ5MFBezkyY9+TNMAuv0tcJP0VUfG3w7GHx/rcZ0TcRiWhvIiE3EOzPVxcuFqHAoWh/kVMEY2yTiczwXhG5aB25cpcKGvDfgu8TtcLgPm8pyqYdCgQEFaG3F+E57iS0JVfJ2fQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebdf306-1d43-4f39-2323-08df342a81f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 13:02:08.7077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62f1L2xgJJihFcLR0PwjxGT2QGhEilQvCAzeeCwNsruKneYes+lphG0y9/JQ/BTHDMT8xP46psEfLZzB6tSHOEQPS83FkhUovSYBiNKVG5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB938433
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 11:35 am, Riana Tauro wrote:
> Convert the CSC hardware error worker to a delayed work item so it
> can be reused for generic hardware error handling in later patches.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c   | 10 +++++-----
>   drivers/gpu/drm/xe/xe_tile_types.h |  6 +++---
>   2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index ac720710c8e8..41ddd997478b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -166,9 +166,9 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static void csc_hw_error_work(struct work_struct *work)
> +static void hw_error_work(struct work_struct *work)
>   {
> -	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> +	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work.work);
>   	struct xe_device *xe = tile_to_xe(tile);
>   
>   	guard(xe_pm_runtime)(xe);
> @@ -204,7 +204,7 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>   					     hec_uncorrected_fw_errors[err_bit], severity_str,
>   					     err_bit);
>   
> -			schedule_work(&tile->csc_hw_error_work);
> +			schedule_delayed_work(&tile->hw_error_work, 0);

hmm, what is rational to use delay work? and making CSC work as generic 
hardware error handling?

do u see any impact when we trigger fault injection etc.

>   		}
>   	}
>   
> @@ -513,7 +513,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   	enum hardware_error hw_err;
>   
>   	if (xe_fault_csc_hw_error())
> -		schedule_work(&tile->csc_hw_error_work);
> +		schedule_delayed_work(&tile->hw_error_work, 0);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
>   		if (master_ctl & ERROR_IRQ(hw_err))
> @@ -551,7 +551,7 @@ void xe_hw_error_init(struct xe_device *xe)
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
> -	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
> +	INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
>   
>   	process_hw_errors(xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> index e1368c04846a..0f41738635c5 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -7,7 +7,7 @@
>   #define _XE_TILE_TYPES_H_
>   
>   #include <linux/mutex_types.h>
> -#include <linux/workqueue_types.h>
> +#include <linux/workqueue.h>
>   
>   #include "xe_lmtt_types.h"
>   #include "xe_memirq_types.h"
> @@ -118,8 +118,8 @@ struct xe_tile {
>   	/** @memirq: Memory Based Interrupts. */
>   	struct xe_memirq memirq;
>   
> -	/** @csc_hw_error_work: worker to report CSC HW errors */
> -	struct work_struct csc_hw_error_work;
> +	/** @hw_error_work: delayed work to handle HW errors */
> +	struct delayed_work hw_error_work;
>   
>   	/** @pcode: tile's PCODE */
>   	struct {
