Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA4F9D0CF
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 13:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618CB10E592;
	Tue, 14 Apr 2026 13:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKAWlbOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2BA10E5F7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776173400; x=1807709400;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pPlSZcPzvVXr506yTz+z+tQesG9DvRfBcxzDIX9oMtg=;
 b=bKAWlbOZsYCKuZzqwbkojzLQ1lZWWRGiMxhVffbc4Rgd9Jj6xzmlDSEw
 BEt6w9J0AreiFxirl0V8ByroJtW7A5VqFw3xfbj9yEfZIC9k21V63TVk7
 linA8KbsSpjhRRVLytQNUpAvBNXJq9fkK+bHGhnOBwoo23tO9zoVTA1Hr
 QBPTEE5BMu7CF4bELjBTfwCuwlpCsufuQWUa2GLQ0zd0Bx1fQ664SrTZb
 nrRbbPPxIhGxg+aC8rnHqHR6njriPRylh1orjS4vpqX0BgBk+y8V8FGLM
 96H40EQwIZY8Vx1Yw+2QjDED0quNXMfH8qdsADjgZnTiwimkxmtDdAZCP Q==;
X-CSE-ConnectionGUID: Ru7C12POQmerosY9Iaubow==
X-CSE-MsgGUID: Fe2IArF8SvmqLapBS4GeYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87832963"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87832963"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:30:00 -0700
X-CSE-ConnectionGUID: 5u+BqHI1QH6ZuFexZTsJ2Q==
X-CSE-MsgGUID: Q22eh1VZRf2msg6OpuWKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225792024"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:30:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 06:29:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 06:29:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 06:29:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aq0taVzCyhV1b0JbcV3y4LUh44ASmLNTkVQZbsRYDM2qMTes8SwvYC1pYmqPkUnPXUijVvlyQhM8/10AMkeuJU4TJUDYbXdbG2F8nlD8eULyYqnYuyU1yrxoYUYCchsixYY+prg5+SOUb08k4MsIbK0eO0cG23oh3TahV6yqvGEgx+ny0C/kxYaWCSpY7Vy1kUAFFktzLDGWi0+8duFCFyfylK3VO/Jffogo5li8LmlBhj36bkBR29jkVkapSOgk2c+HGe+BzwXpQSUGTZFPq+YJ5DLWrKR1k5xJk2o63A1PC5R+SsS3a+5z6fY09pje7AFjaDJp9To4Wm8CS/qU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1q9VAiSIZpcJl0IY8YTga84aAI868C+kzSulxmZDtI=;
 b=XU5Q1t/qgN0zM9IOY8ioeUVeNHrGXaowJMxzOTwz4uJHw74aNbDFuRR3L2/9lbyDSPLGt3R0VcBy94JbffDG+kiUbv0kkTbQ1C6zKiqZfiCgRllaBBOeX62FLSHpUw7M4kXZpmJT7i19Y3O1W2RLJOiehbLgZLHGCfQY3HdlPr7UnMy/yrJSmRIxVozEaGCdiLZGqhjRThiVv9Nx0yGKxF3s/IT1DvYTFWOgtRt+6gSGu+A533YjApGVKWhLTmy+pdpevxS0dK1KMAq1JQZ6BAfNE5XRzoMdCvd4MwdNn03QsJXpvWoe2cqQN5eFgqRTC3InKBSkxXeLC3zXC7/wuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH8PR11MB6564.namprd11.prod.outlook.com (2603:10b6:510:1c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 13:29:53 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 13:29:53 +0000
Message-ID: <c36cdb7a-b8ad-496c-bf1c-61ec15c5ac29@intel.com>
Date: Tue, 14 Apr 2026 18:59:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: "Tauro, Riana" <riana.tauro@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <soham.purkait@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-14-riana.tauro@intel.com>
 <adSNMapnJqvfswlJ@gsse-cloud1.jf.intel.com>
 <4b50d8d0-a7fe-47b2-a8c6-5e9b920aac09@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <4b50d8d0-a7fe-47b2-a8c6-5e9b920aac09@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::23) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH8PR11MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc9d46e-3f86-4472-d23e-08de9a29e8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: DFys2xkajit22v21JocTRI2wW1+LlS1kjJrIH3J/V0I4BJy3o/jN1wE+CQ0CQ+k82bjQex0pCnmeFND12/Kygr5Qa/VpYSVLKjIYmeIOUpa/OJYUo1a6UWj/khrrKbEC/o/32kIX+vwGOc/qa+u+aUneUpt87edSxTblUrMfPMcYiGScYtF99znzdaJ7RCIjlmnSB3qHjnqX4f3aA9a9H3E7HWjAZFxBm1dUrhuCt3reInraFMYtFgQQTIZ0URfVBNF7VvzMRxpsydwjwyEX36bpgvGZDVNBbXKfvfE3pkexrW0XDaaR6gFj1WIiy66XLjsChdv6p2NHl+9uX7GCIV8p4YPGA2710IU6MLbAIbpsdN0qQ2YZZY4kNlxFsUwwJ++oeYlPgx2tfOGHpMBMJ4e5LQvxi7+bcLnG1mbifsL4wCHNBoRx57B3G3T6DUbIGqoEPai5he5kXgBOSFrD8CaQYm2kVqPPDGtivYkixAnFZCl8kdQSW+kDmeN1gedJcpXghAUsGRrWDYtTtrju5cubfc++PkQgEHZEAp63yYpBnlXHlW9/HNnMNltYuiLamMXz9L86Wy0ZZVUFGId7PUovL+SezO6d+rNxlM5HF/1FSIh0jnaGzYq1sP7ABxmV5eKB4jWzvsNV7uodraE2nQbCvFHC6DftzX0zQQiHlvJlgwPHVKd1lTWf/CDZBGVh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ano2ZVRBUzJuWWwvZ096cGZvY2JVb3lITE9PZ0g4aktSRHN2c0M1NFptQ1I5?=
 =?utf-8?B?b0xnQ0llN051YVczY1VVcEVtcDNhbmNOV0FFc09sbTF4WGNnZFhGa1loVDBP?=
 =?utf-8?B?TWFWaG00T1VaTVJxUVpmN01LVVJpRUM0bGg4Vy9EQU1FTUdCZ0xTcmUvNy9q?=
 =?utf-8?B?eGVDRmkzZUtRTEgvWmNBVC9vTTFGWTE1ZUZxWm1mb3k3TC9sbzR1b1RKZXRz?=
 =?utf-8?B?b2c4T0xCSis2U25WL1laWG04emZZWWpxMnhENGhUK2VhUXhFbUx3VTFNa3J1?=
 =?utf-8?B?SkdkYlFndUx6SUlKNFRBSEMySlI1WDJhNHFYMWJCSVRaVDVTOHVCUDkvU3Qv?=
 =?utf-8?B?UklEK0kvV055UWUvUkcrSGtyN2p4TW52NjQvN053ZVUzTTFaWlh5UGh4U0hU?=
 =?utf-8?B?QWJzWU9TVnoyL1VmTmRQNnVxOE9Ldmw1R3JpemRVZEVkMWF1MlhVdGx2ekov?=
 =?utf-8?B?c29XQThSTmdMUDFKbzdOQkdqRjlmeitNaDBCdmVxbUpYVU1kbmJrVnZYWk14?=
 =?utf-8?B?dy9sdnJiZFJDbVlkbXN6aFlPTXBFUkd3a0NPb2I0cmpFVzBpakNRT2p1NFBJ?=
 =?utf-8?B?OWVMcnJQRlJlUDZ6NS94SEVSY2lZYTNIcXl4SStuNm5PU05sdGMxalAwREVV?=
 =?utf-8?B?b05VTzkrZUpsM0VIakl0U3cvdkZRbGw2UEhlY1MvYVBhV2ZoVkpjL1Riemxv?=
 =?utf-8?B?Vm9JYzFsc1ZlV3hmbUxxWjJSNzNvcW85dGxybmJMMzRUYlRMcjA5cWxDcjlC?=
 =?utf-8?B?OXJhRC9uTzdaaXZZV0dDdW8reUgzc1JPb1B2d0VrN0tCUmlLaDFoQUY2c3Ay?=
 =?utf-8?B?WG5iejdId1NidWhMU0Y3ckRSSnpjME9nT3ppaFdnS0ZGQW5wb214VDBwTnM5?=
 =?utf-8?B?bWxBZHk1UGg2TGRXMzNiSFhqeHJnRndRUFduVUJ3SHFQaDBYQXVIcCtyQlZS?=
 =?utf-8?B?MC96c0pEMWhtUHVRT3FKUjF6eWpSTDFNZ2NwNWJ4bUN1SVlSS3JVb0VIUGo2?=
 =?utf-8?B?NEtWK0dqc3RDcXBJTk50cjVtZWsvNXNSYnpoKzZLK01xSGx0VDdFcExBQ2tP?=
 =?utf-8?B?VnI0WVloeTBseXVJZzFiNFkvMzNBbDhjWmxpNFB5d254V2hES1ZuejhPSFB6?=
 =?utf-8?B?aHUrQzc4OXVoV1Z6U1dTRDc4T2JDVktYZ1lIenZWNUxmTENOWTlzazlhaHcr?=
 =?utf-8?B?ZVRXL0E2bXFUZGpWK1h4RENVMTU1UzYvNHREa3JhcTFDcU1Oa3AvdUVBVWEv?=
 =?utf-8?B?b1Q1L3pWWW5BblhBNVpFVzZ0RW1ocW5nRHdOZy9tNTZKM044aTVOWHNrUjNW?=
 =?utf-8?B?ZkZGWUxSQVUvRkV1dHVOUmZiZTExVnlIRmk2NE41MnhPUjNiQXNOWGl4NWJH?=
 =?utf-8?B?RWR3c0ZpRk5TUVc4dUFHcHM1TUtZQjEzRU1QajB5S25ER1RVOURINkwzRjJu?=
 =?utf-8?B?a2hXazlHc1FEYUlxUkFQSWVORWVaZUlQTndqMElTTlNjZjI0NE9vSXlYcGZ6?=
 =?utf-8?B?bENGVC9iR0FWWXJWVVEydys2a3lXc1pkMXhuVHdhWk0rcGtBYlVCb28xcGdj?=
 =?utf-8?B?R3Q3a29JY20vV2UrY2dFZ0hUU1I3amNDMGFSZ1R4VCtPeW5nRlhLV3ZmZUdt?=
 =?utf-8?B?SFVmYmgxVmJVT2IxTEtndERoOGxzcWZqZGx0OHAycVdpa3lLSk1lVjVrREs1?=
 =?utf-8?B?d3g5eXZFb0NFV3hOY3Bkb3RiMTA5NnBFVVhqeU1oRHFoU0QyYW9RUFE1UCsz?=
 =?utf-8?B?Tzd5R3hXV3NoLy9WQWVaYzR2ckVIbm5MWm5zRVgwMWc3c0wwbDhrcTVSWWZp?=
 =?utf-8?B?bmVzLzZ3OC9DUi9xVDYxYWVpMFozMklGMFIzMDZzREl5bUQybFhrUTdqU1NR?=
 =?utf-8?B?QVFsZjJkVVpEQm43enhjcVNoUXRncDV4UUd0NUtkdVJWYWU5QXZjVS9acUJI?=
 =?utf-8?B?NnI3WUhsZC92WU5pUi9ETEwvQmhTY3ZnOXpWc0doZStUeWlDcVZGZjRCUFc2?=
 =?utf-8?B?bkd5eGl2YWFGMCsyTC96RHFIU09Id2tnSXZDNDgrOFU1QVZRYXhpRXFPOWQv?=
 =?utf-8?B?N2dtS003b1V5WEwzU1oyVmsvRGt3c01DT3FlWDI3UTFmQTJKUHUrQVF3R3dW?=
 =?utf-8?B?TThLdDcvYi9IeFdwVmMvcVJkWEUzclo5cFN2Y0RBUDVsb2N6Unh5anU1VUJW?=
 =?utf-8?B?dkQ2TkdoQWRhamJCRmlXa1YrcExqRkllazI2bXhwT01McWNxNTVzN3gvSTRD?=
 =?utf-8?B?bWo3TFQwaGdnYk9CaXZUK2xDblFYbkVCaUc4UFd0YmN1VTBSQzF5Z241OG5V?=
 =?utf-8?B?VUhiaFN0TzduMVBCS29QeExscndoU2kraGIvM1ZtTVJreTJlbVNETHJOeGli?=
 =?utf-8?Q?dAyaeNhSILHuEGu8=3D?=
X-Exchange-RoutingPolicyChecked: omIWOrHJ8XmaNmAs/848EofYAMeV9AkE6hE6JekYT8IAqAPCpJvnfNH07Lo+JO84lUzE0upcu0LMHogKX3FFmxX0pHufzHuB19tNJJ89GyrADvaij80ZZzXsJU54k60z4y0/WfphCY7LSA4Oqy2lsGLWyZtWweuZdDhTkAJ5Li+pBnHRWY+8riLT/VtwbjidQG/9fbYegVP+NNIl4W/q9vbY1wIzS9lslA/3qOEQQBUCAGwSbFCi7pXBgydwWR7WIGNrlNPYTAsawHRWiC1ygBEu/mkKFR9SDLvLYjlnTADOFDSxYNwqQ0wugT0LKXCSKqXMTSpnf2DC3VjeleIKRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc9d46e-3f86-4472-d23e-08de9a29e8e3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:29:52.8653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpY6FYFTaiaLoHAFxGBpvuiKxWk7J90dhxst1cgc+eF5NHNEBF4K3zUbvG2itEy8aK1iBs3YQIyGj6WIjMfCb8T2mqqz9H8cNBCdfVCMOhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6564
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


On 13-04-2026 02:30 pm, Tauro, Riana wrote:
>
> On 4/7/2026 10:20 AM, Matthew Brost wrote:
>> On Thu, Apr 02, 2026 at 12:31:33PM +0530, Riana Tauro wrote:
>>> Add error_detected, mmio_enabled, slot_reset and resume
>>> recovery callbacks to handle PCIe Advanced Error Reporting
>>> (AER) errors.
>>>
>>> For fatal errors, the device is wedged and becomes
>>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>>> error_detected to request a Secondary Bus Reset (SBR).
>>>
>>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>>> error_detected to trigger the mmio_enabled callback. In this callback,
>>> the device is queried to determine the error cause and attempt
>>> recovery based on the error type.
>>>
>>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>>> cleanly removes and reprobe the device to restore functionality.
>>>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> v2: re-order linux headers
>>>      reword error messages
>>>      do not clear in_recovery after remove
>>>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>>>      only wedge device do not send uevent (Raag)
>>>      set recovery flag in error_detected and clear on resume
>>>      add default switch case (Mallesh)
>>>
>>> v3: do not set in_recovery for disconnect (Mallesh)
>>>      return if already wedged or in survivability mode
>>> ---
>>>   drivers/gpu/drm/xe/Makefile          |   1 +
>>>   drivers/gpu/drm/xe/xe_device.h       |  15 ++++
>>>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>   drivers/gpu/drm/xe/xe_pci.c          |   3 +
>>>   drivers/gpu/drm/xe/xe_pci_error.c    | 104 
>>> +++++++++++++++++++++++++++
>>>   5 files changed, 126 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 9dacb0579a7d..7f03f06df186 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>>>       xe_page_reclaim.o \
>>>       xe_pat.o \
>>>       xe_pci.o \
>>> +    xe_pci_error.o \
>>>       xe_pci_rebar.o \
>>>       xe_pcode.o \
>>>       xe_pm.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>>> b/drivers/gpu/drm/xe/xe_device.h
>>> index e4b9de8d8e95..60db2492cb92 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -43,6 +43,21 @@ static inline struct xe_device 
>>> *ttm_to_xe_device(struct ttm_device *ttm)
>>>       return container_of(ttm, struct xe_device, ttm);
>>>   }
>>>   +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>>> +{
>>> +    return atomic_read(&xe->in_recovery);
>>> +}
>>> +
>>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>>> +{
>>> +    atomic_set(&xe->in_recovery, 1);
>>> +}
>>> +
>>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>>> +{
>>> +     atomic_set(&xe->in_recovery, 0);
nit: Remove white space
>>> +}
>>> +
>>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>>                      const struct pci_device_id *ent);
>>>   int xe_device_probe_early(struct xe_device *xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 150c76b2acaf..c9fe86b670bd 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -494,6 +494,9 @@ struct xe_device {
>>>           bool inconsistent_reset;
>>>       } wedged;
>>>   +    /** @in_recovery: Indicates if device is in recovery */
>>> +    atomic_t in_recovery;
>>> +
>>>       /** @bo_device: Struct to control async free of BOs */
>>>       struct xe_bo_dev {
>>>           /** @bo_device.async_free: Free worker */
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 1df3f08e2e1c..30d71795dd2e 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -1323,6 +1323,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>>   };
>>>   #endif
>>>   +extern const struct pci_error_handlers xe_pci_error_handlers;
>>> +
>>>   static struct pci_driver xe_pci_driver = {
>>>       .name = DRIVER_NAME,
>>>       .id_table = pciidlist,
>>> @@ -1330,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>>>       .remove = xe_pci_remove,
>>>       .shutdown = xe_pci_shutdown,
>>>       .sriov_configure = xe_pci_sriov_configure,
>>> +    .err_handler = &xe_pci_error_handlers,
>>>   #ifdef CONFIG_PM_SLEEP
>>>       .driver.pm = &xe_pm_ops,
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c 
>>> b/drivers/gpu/drm/xe/xe_pci_error.c
>>> new file mode 100644
>>> index 000000000000..cd9f39010278
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>> @@ -0,0 +1,104 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +#include <linux/pci.h>
>>> +
>>> +#include <drm/drm_drv.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_pci.h"
>>> +#include "xe_survivability_mode.h"
>>> +#include "xe_uc.h"
>>> +
>>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +    struct xe_gt *gt;
>>> +    u8 id;
>>> +
>>> +    /* Return if device is wedged or in survivability mode */
>>> +    if (xe_survivability_mode_is_boot_enabled(xe) || 
>>> xe_device_wedged(xe))
>>> +        return;
>>> +
>>> +    /* Wedge the device to prevent userspace access but don't send 
>>> the event yet */
>>> +    atomic_set(&xe->wedged.flag, 1);
>> We can't blindly set '&xe->wedged.flag, 1' as this is tied to a PM ref
>> [1], [2]. The existing sematic might be wrong but we to normalize
>> adjustmets to the '&xe->wedged.flag' field with uniform rules, or the
>> cases when we wedge we also take a PM ref
>>
>
> If the device was already wedged from xe_device_declare_wedged, this 
> function returns.
> And the ref is released in fini.
>
> PM ref was added to prevent runtime suspend during wedging. But in 
> case of error_callbacks
> this is already taken by PCI core drivers/pci/pcie/err.c
>
> pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
>
> I will add a comment here.
>
> Thanks
> Riana
>
>>   Matt
>>
>> [1] https://patchwork.freedesktop.org/patch/714622/?series=163948&rev=1
>> [2] 
>> https://patchwork.freedesktop.org/patch/715028/?series=162055&rev=4#comment_1315905
>>
>>> +
>>> +    for_each_gt(gt, xe, id)
>>> +        xe_gt_declare_wedged(gt);
>>> +
>>> +    pci_disable_device(pdev);
>>> +}
>>> +
>>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, 
>>> pci_channel_state_t state)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +
>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: error detected 
>>> state %d\n", state);
>>> +
>>> +    if (state == pci_channel_io_perm_failure)
>>> +        return PCI_ERS_RESULT_DISCONNECT;
>>> +
>>> +    xe_device_set_in_recovery(xe);
>>> +
>>> +    switch (state) {
>>> +    case pci_channel_io_normal:
>>> +        return PCI_ERS_RESULT_CAN_RECOVER;
>>> +    case pci_channel_io_frozen:
>>> +        xe_pci_error_handling(pdev);
>>> +        return PCI_ERS_RESULT_NEED_RESET;
>>> +    default:
>>> +        dev_err(&pdev->dev, "Unknown state %d\n", state);
>>> +        return PCI_ERS_RESULT_NEED_RESET;
>>> +    }
>>> +}
>>> +
>>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev 
>>> *pdev)
>>> +{
>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>>> +
>>> +    return PCI_ERS_RESULT_NEED_RESET;
>>> +}
>>> +
>>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>>> +{
>>> +    const struct pci_device_id *ent = 
>>> pci_match_id(pdev->driver->id_table, pdev);
>>> +
>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
>>> +
>>> +    pci_restore_state(pdev);

Is pci_restore_state() needed here? before invoking slot_reset, the PCI 
core already calls

pci_restore_state() right.

Thanks,

-/Mallesh

>>> +
>>> +    if (pci_enable_device(pdev)) {
>>> +        dev_err(&pdev->dev,
>>> +            "Cannot re-enable PCI device after reset\n");
>>> +        return PCI_ERS_RESULT_DISCONNECT;
>>> +    }
>>> +
>>> +    /*
>>> +     * Secondary Bus Reset wipes out all device memory
>>> +     * requiring XE KMD to perform a device removal and reprobe.
>>> +     */
>>> +    pdev->driver->remove(pdev);
>>> +
>>> +    if (!pdev->driver->probe(pdev, ent))
>>> +        return PCI_ERS_RESULT_RECOVERED;
>>> +
>>> +    return PCI_ERS_RESULT_DISCONNECT;
>>> +}
>>> +
>>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +
>>> +    dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
>>> +
>>> +    xe_device_clear_in_recovery(xe);
>>> +}
>>> +
>>> +const struct pci_error_handlers xe_pci_error_handlers = {
>>> +    .error_detected    = xe_pci_error_detected,
>>> +    .mmio_enabled    = xe_pci_error_mmio_enabled,
>>> +    .slot_reset    = xe_pci_error_slot_reset,
>>> +    .resume        = xe_pci_error_resume,
>>> +};
>>> -- 
>>> 2.47.1
>>>
