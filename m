Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9691C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 21:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567BE10E0CC;
	Wed, 26 Aug 2026 21:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmBI9op0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BFD10E0CC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 21:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787779874; x=1819315874;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vFH9MPRNZfkYqUcE3rMjzS6aC5kLmMYVYF2ZDmVXxA8=;
 b=YmBI9op01Np9nANOqwxZmY6LI8yfyeo2xFmjWzlRgLLILr+1NI9McrdS
 5W7yNhBfuNPycegSS9BlI8yFbVoHdynKp3qN9yewR95Q3zBk4u8fM4AtX
 KgnhU3uG+4ho3NWBzBIoZx0VaNJL8/nnViB6iYfYSiMwYwtxbCHQ+jV4M
 BfiUsC8S2FvbNIQmQpfXJbEXScPEILCezdb/s9ZgkJQ1BQOr+v+0w7q3x
 Xy2FePKKLb4WXIWntUacayyAW9q4G+HX8l6vbN5o9zDm31aBny8hNXTS9
 ljRA3QeyPs/hXzhwgo6iVzTU7OGhvF2+rnB/yVsdSvws5z4byzR5QoZJ9 w==;
X-CSE-ConnectionGUID: wcvEQFY5SfeMHSjCSZolwQ==
X-CSE-MsgGUID: E+ZlkVikSeGrN/GUOiAh/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105798499"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="105798499"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 14:31:14 -0700
X-CSE-ConnectionGUID: qV/ENEzrRnqgkCgOSsNnhQ==
X-CSE-MsgGUID: GkLHKDgeQ3ywjwSgZRa4mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="261545116"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 14:31:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 14:31:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 14:31:13 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 14:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9rlYNKbq14Iq/zSFCGDdA/aQMy8sPAEtkvqp64YQCZl63tla0Axuf7DpqYN8tdb9zuqbropyJNUVW7eVLZ2guIaa0IBYeqZN6Bi+cDhMNkfjGGmg/YBdTQsQPwZMj3nchNTS4bSwWV8u8eKC/rgon6IXrXsgaWRTbCARZ0HRqfe/gevvLdLWttrTNgayeYwZr48P91gMX6yFxeRCR2PSRMS9VFCnZUeuI3H6PQxNIFlgBSiRU9RganrKWM4kD5i0SbLZ7VXtz/rCsCM5r2/i1TM/45EpJy8xoKsBk3p5TuS4ZlOVneJUbdX/W36gfUoMosjuWqQVYW1n2qeEeBUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYhyPUAGfs3s7PmWYJOqdxQKpt4UkjSJirtUvuHJE3k=;
 b=DGDcZEj/M8ryatqjRs/WnjwGUMF9jwXdrE187e7QZIqL+2JmrFXOJE6ATyjkdjWsh77KXNpegYDFTnNkG6F01v3GQk+Ete5jNufFXBozZaHzB+neA+veCu2vCsRwoCAnPnxh2vclDY2fo2jUnQuT+TQK8wUqugDjO23zb/gm1QlfdyUeR7Iip5KtU2qoQNJdIyhWds5tjrLvwLFNPKAQRCcXnuLimQQL2EfB3c1qx6Zt+f3kYBEoqpfqkVWaSvtCrOr/f/CRb7v+kaToboJqY2J2AWOcWnASXxjW3y56ZXMGAjQRvIDWPiQqPbaGgFVzH+8kzURTAHXdeIA4K5xmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 21:31:09 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 21:31:09 +0000
Date: Wed, 26 Aug 2026 17:31:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: "Anoop, Vijay" <anoop.c.vijay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 2/2] drm/xe/sysctrl: Add helper to check oCode
 firmware readiness
Message-ID: <ao9bGMMFk1mnWmvM@intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
 <20260814095306.2482289-6-anoop.c.vijay@intel.com>
 <an+HER3exoUdIj0P@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <an+HER3exoUdIj0P@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|CY5PR11MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: dc474a05-b4b7-4fcb-541b-08df03b95820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|10067099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 2VKvrjPC4plDvHMF495fhfQVDNFruqNiZ2NYhBpZMz3/u6iDZNQUhkJSeWOne4MFano4FMzyYqXq20dKabLXVZxzzAJqaaS/9G4oxCScqHDeMcU8D8ZtOvvICC5Ud+C8qmTK7pvzP8DxjwT7H9tX49/EnmlaRrc4iFHkKdJRmzivQPs50iX1RtD9Fq5jZVKfunVxnL0TcBQPpS79CiFDxcQ7E/JuxTaIqMtf+CGIID4+ua5t6SJWdlR8Ok7u+/alS783h8wYNR9DdmEcm9HdiyJDr2Hsp+rvHOOJdfhrMSTcxWpZfmxOv66y7Ja0mTKxnXEo9+t9N2EJ3uOu8Js7856hdQPv0xNV87lxP7iT1XD1GsrdWybrFNl4ZgLWmu10kHobWTJ5CJck+NQfgjlGOwHFb56eVfp9KvfdcS1DXv57g7t8MJR5ZzX1J0gQIaVn/BLI6XgfUqOKDvz1rfS2kUrqFN7iTsdaf9ncKsRbVKNgGc/+TeMdO6Vqrfy8SlkJuLGnUAIDKwKsAKRCN2AukAkMJvuDfuAGfHXxUxjRGvmd63TSb5wtWBhI0yL+7plUYWeAkzIo7jXsuG5ZVgfl7Y/zKr0cZWhmQkoHZ+TqWBU5fRdc3Gc1I++uActujtz2enle60WuIrh7wiO9dCdcHjsPNHUKQ9oJQZ1FI5tAlTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(10067099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHZBYVIvTnJ6S0tpektSS3dTQTZjUVVhU1RHR3pYWlZTbXNTdFVrTTZHaDRB?=
 =?utf-8?B?dS9YTDNCbDJHYUt6bzduL0ExUmo3Rmk4NHh4OHVOTjE0MHV4QWRLcURMN282?=
 =?utf-8?B?Y1QvT1piOWpQVDJLSHJlMFMrK2VMY21UMENwcCtJems5NXRObWNXKys1d0l3?=
 =?utf-8?B?ZmtvVE9ZdWUyZ3o5Zk1Oa2pBM3VpRllrR2puYjdkV3NlZklsTUs5WWhSc3dR?=
 =?utf-8?B?RnZYWlVPL1FIUGEzUFFFU2s0Vy9DMmRPbHF5Q2NFLyt5VGNJRmt2T0kyT1Y4?=
 =?utf-8?B?TmhtbFdnNDVPWlFZK3pITmZEbFV6a2Q0OU1HWG1nbzdQOTJ0a2xqcTQ5M1VJ?=
 =?utf-8?B?dlUrY2FYSVVyTXZXbjUvUEVJOEdTU2RMQ1VtRlovUVJ5Sm95b1BJSFpKM0o3?=
 =?utf-8?B?RDlXTk9ldXpEK3AwRFR3Q0FDcHp6MEppVy9qOENWN3dVOHFsNW5EWTZiNEFh?=
 =?utf-8?B?RkNKbzJBWUhFM1FiOXdFS2w3ZFIxdTJzb2NMNmxrYTAvRnRsTWgzVG40dTgw?=
 =?utf-8?B?YThwbEVXbEx1RllPS3cvV1QyckJLbS9ObDhKejlnOE1nd3NHK1p1V1hDTEpK?=
 =?utf-8?B?eU5LcVkrK0ZuYmZLYlRaWFdaK2ZOQ3cyaDhJWkhIRFh0eGRGd3M3WUg5d2py?=
 =?utf-8?B?SjN3a3lpOEQvMk9yOVp0SzRacDhkRkpEdXVNdGFlNWZoNU90a1dQWU9hQXVM?=
 =?utf-8?B?RDRxUGlUdzB0Z09SL294SS9WVUpnZXpGSGRwNmVkUGxyQUdUR1RpblAyYlQ1?=
 =?utf-8?B?U1NrSVVlSFVKV3F0L1paMGlxZWxpTUN4eUh3Si9UU1dPS0hCZXVjcEJ5Wi9K?=
 =?utf-8?B?OFdsL0lENEJtTmdTNVlUMnNBeEpnQ296dG1TaXdSZ0ZveTlYb3NrSktra1FJ?=
 =?utf-8?B?VFpzaStYUDZSbE5SdWdNVy9Xb0M2cTFoeVV5ZVlrdVhSY3krcXhFZzZKVkgr?=
 =?utf-8?B?UjcrZWR0K203emJRcjVoZzFjZWpReFFPWlk0cVI1cUlOSEM5RzBqQWM2QmF2?=
 =?utf-8?B?SnJ6a2FWQ2l3cWtYNlVZWHlwa1E3Yyt6S3NmelBvQktXazg2WlZRVFI5YXV3?=
 =?utf-8?B?S2Y2ZGJ2WVkwYWYrV0tTQ3FaaS95cWdUMjdHY0doYzg5eHBZMnlaM3hoQkxD?=
 =?utf-8?B?REFmWk15QlJCNjN0ZU0xQ0ZueGl0aHZzRkUxWmVxdnplcTd6QkNxVXl3Rkli?=
 =?utf-8?B?ZFFyaU1udGM3NFJGLzFYSXZQRGkzdEdERjJMNnpmamRHNWlEenJzZjBERUor?=
 =?utf-8?B?WEVFVmpRTEljenNLelIydWc1dGdPSUZEUCtjcnpnTWpDQmVRRnlkU2s5WjVO?=
 =?utf-8?B?aVlSZHQzOENFNkpTVzY3dU8xdjlyNGFBaGNadytMZjBLS211OG9vNElqUmVn?=
 =?utf-8?B?Q2tybk5NNDJVQkpDT3dIU2lwRnQrOVVMMy9XV0lNRExyOVg2UUVlVGRmaE5O?=
 =?utf-8?B?VWZCeGZUNnJNNG5SZ1lNbHF3YzlKc28rWFBzRU16dUR1cWJ6WE1QekJMblZX?=
 =?utf-8?B?OUJRM1F5eXJCYnRtWW1HMSt4UFI2aVc5R2cvZEk3cWFWSyt5TkZjUGFiTnpj?=
 =?utf-8?B?NnJKb1ZnOEdqbFpwN0tyNTVSNDQ0WXpiK0ZjSmcwYUJpekFDejdZWVBITUVD?=
 =?utf-8?B?bWIrSGRrWDJGSENTTnpCOHBER283MThwdzJuNVpSMmU3c2R2MnlHdy9jVFdu?=
 =?utf-8?B?aklXbDI4d3V2LytEVUJsMkszbjhLdE11MWVKUWVvR3k4VWVJWjhZSm1USDZL?=
 =?utf-8?B?bHV3RWtDeTRyT2E0d3J5U2dvUmlmank5NVhwaldWZC8yQUsvcmZKR3ZDWU4x?=
 =?utf-8?B?TFpQQU95MzEwQkljcGpBVzAvempLR2wrdllySkpqbm96N2lTaWQ2STVQUnNQ?=
 =?utf-8?B?ejBHWlBEOHRyVU1vNDFPNU1yMkFWbjAxYlRsTk52VXFYSmY5T1RKMGVTZ084?=
 =?utf-8?B?UmRSSCtHY0ZIcW9zWFhVcEZuUDlFYlJiYWZyYzZEeVo0dlFnRzMvbXNuYm9q?=
 =?utf-8?B?elNiKzlyRThDOUpITnFtNTJ5YVZ5VDBlOGEweklkK01vQ1M5VEk5cnhIbWF0?=
 =?utf-8?B?dlVCUGc4bGJDcFByTk9nS2dPdkxVZUJQUXpKVzFsVnRNNEtVZzhJVG91MGps?=
 =?utf-8?B?M0JDWXY1Y2l4elVyUnNGMW9qWi90VWZndjhjSllrbHRMdmtwYW1sVFF2UGFL?=
 =?utf-8?B?dnRHU0RUc1N6RWY2bjhidVo5RVZqdGVwWERLWUZFZ1FqRklIVVlKSWZnRlNK?=
 =?utf-8?B?UWF2TjQ5dzdKckZQZVNQdXo0cDQrZDVibGVVREdyeDVsWEcrSUkyUlZ5YXFq?=
 =?utf-8?B?UjNydjFjZDRZemJ1ZUNCWnR4UUoraGNyVU9PZWhaVEx6dUZmZ0V4QT09?=
X-Exchange-RoutingPolicyChecked: O7lcmuBCCwdxQQds6QMCTjbIClfYRJy8wL6TeZ1j+6+/yj8SbMNp2vF3vZfa3twG+fW+vZ0T/XUZ9WKfjbsLDdI7B10B9ryZyJs7aa9ga//bX73urp+RDdkWkCY/nXdzn/NHUOXSfQX9M8cvwF6eh6Nb8VJIABk4s0kaKCxCyKSr+kOBh6n7iXYE8F3Vg23fwlT4yLAJi+vvp06Nt2KSJ/jmTTjAKTIDsIRxCUyGW4/oxK+2Z52ME23OlDO74mTEX+qqHQdSRNjAIDkNf+0YxBM0BnJc3nLS1qURAN/sPNCKwBodVmm58oKA236xgYP5HzxcYgwinbEsaw+diZvhSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc474a05-b4b7-4fcb-541b-08df03b95820
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:31:09.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRy9/awkruGUklXPpPR14HYEmtRQYTg/b4KLcwkXYN/UjHBsfvEPtqbg+uDGFq1aLMfVTfFgXKrc/CwbXrhn+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
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

On Fri, Aug 14, 2026 at 02:22:25PM -0700, Umesh Nerlige Ramappa wrote:
> On Fri, Aug 14, 2026 at 02:53:07AM -0700, Anoop, Vijay wrote:
> > From: Anoop Vijay <anoop.c.vijay@intel.com>
> > 
> > Add xe_sysctrl_is_oobmsm_fw_ready(), a convenience wrapper around
> > xe_sysctrl_check_app_status() to check oCode application readiness.
> > 
> > Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> > ---
> > v6:
> > - New patch — split oCode application readiness helper out of the
> >  original patch into its own commit
> > 
> > v7: (Umesh)
> > - Clarify xe_sysctrl_is_oobmsm_fw_ready() comment for sysctrl-less platforms
> > - Add XE_SYSCTRL_APP_OCODE to enum xe_sysctrl_app_id in xe_sysctrl.c
> > ---
> > drivers/gpu/drm/xe/xe_sysctrl.c | 23 +++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_sysctrl.h |  1 +
> > 2 files changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> > index c53a26af3189..488e30b3d075 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> > @@ -42,6 +42,7 @@
> >  * application ID.
> >  */
> > enum xe_sysctrl_app_id {
> > +	XE_SYSCTRL_APP_OCODE	= 0x0C,
> > 	XE_SYSCTRL_APP_DIAG	= 0x0D,
> > };
> > 
> > @@ -189,6 +190,28 @@ xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
> > 	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
> > }
> > 
> > +/**
> > + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
> > + * @xe: xe device instance
> > + *
> > + * Returns true if oCode firmware has reached the initialized state, indicating
> > + * it is ready to handle requests. On platforms without System Controller
> > + * support there is no System Controller mailbox to gate on, so oCode firmware
> > + * readiness is not tracked through this path; the function unconditionally
> > + * returns true so callers are not blocked by this check on such platforms.
> > + *
> > + * Return: true if oCode firmware is initialized, or if System Controller is
> > + * not present on this platform; false otherwise
> > + */
> > +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
> > +{
> > +	enum xe_sysctrl_fw_status status =
> > +		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
> > +
> > +	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
> > +	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> > +}
> 
> Same here. I would split it into 2 separate helpers.

Yes, please!

> 
> Thanks,
> Umesh
> > +
> > /**
> >  * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
> >  * @xe: xe device instance
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> > index 8dc576796890..b69a3f474236 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> > @@ -20,6 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> > int xe_sysctrl_init(struct xe_device *xe);
> > void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> > void xe_sysctrl_pm_resume(struct xe_device *xe);
> > +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
> > bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
> > 
> > #endif
> > -- 
> > 2.43.0
> > 
