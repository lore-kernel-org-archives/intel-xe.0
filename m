Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B808C6FD1D
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 01:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CB410E1D1;
	Sun,  2 Apr 2023 01:24:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD96910E1D1
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 01:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680398694; x=1711934694;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2QO7NPZNJ3hKO66UyKoMPv2y+0tlIxkgv6Jzf8+xIIc=;
 b=JeqhuBxoCI81qLQ4ZgHAexGgL2o+2EoLAHXR3JyQnffXr36cGuFbitSm
 pgaBuQ+CQSlia3R4t/ekFqwy75sCdYBRI1UEYadkVMP5vWWZyQeaLGZX3
 AaJYQLt4+US9JaUgcqAEEUI9/Ow9NsCOK8JQriTqfhRWneTeg3f3xgWNd
 Vs4HmfGb6JL9YOW0hYFM78j+09FwiM0yXmZ8/od3xInuW3Vut0XKttq6D
 Lj/2jdN50L+GXyKkmMXOdx8wowCUUI1UvNhU7w8SHKoctglienRKSzhSC
 iCkt9SqiHDg1+85QHde+OiJyehc+4yXf/R6lBx2n2lkycqTTgmPHEJO7r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="321349873"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="321349873"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 18:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="1015268602"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="1015268602"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2023 18:24:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 1 Apr 2023 18:24:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 1 Apr 2023 18:24:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sat, 1 Apr 2023 18:24:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sat, 1 Apr 2023 18:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4xvL9+VyFNcbAr7ZAo4FQvs939TWq2wynEgDBXbcsBMMjF11zIYPq2UoEfZagjcRa4fhnL4llMxUjEw+nPjjJPskw3GmT7BFHWzVv4X36vTouvKIKQQ2pgLkSJDWP48/qnFmlej3Gr3x81lpx36UzGvYcdDgPPuXRSkMxOdW2XLsJJUfsQkPIVwR7wz5sUxSf7SCFE9Hi4qw2Zh6xmhBwa5VJqXaTCIUERgISak1hCTB5bo6bWnZDbXh7IjxmsxGrL0GckA4aCPcv4qEt2J3kf5m1KKfIHk/9cCdRkGvoAQX5nuDJJXUUwM+EKjPq6fAgjb467lTGfwUphvbYqIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgBdbR4yowuW27KJTCWmXUFLgHr3BEWY9haTgfIbCW8=;
 b=hCPgXRsUdT1vHbVibRHbxdzOgXfrc/RJVvTRbWa8pwhcsZXmKk/Eoom6JIjkxcA9Ctuj+HJonHpzWD3g6yXKyUO3mpuZqIf1rETp4HQ7PgwonBgzFjd90ZkKgUVeyJN3qlf8eVaInntZb7MV2N2P0EqewEpA2u7FMgckozlOtobCmez4agutS7AOhSlu89NGgMqdFmTb0jGDjMWnT7Uicp64eP3C73ZnreiY1u/LjqrF6k5QuM2A1GGM7ZNjdr2gop+TpC99VUKa2iqF3jJIlk7XbuRJCYF/chPCGZRvKnOxaIixI2T1M8UjqZZ+fj96K7yV8M39yZ0xGdmUXEyidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8348.namprd11.prod.outlook.com (2603:10b6:a03:53a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Sun, 2 Apr
 2023 01:24:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6254.029; Sun, 2 Apr 2023
 01:24:50 +0000
Date: Sat, 1 Apr 2023 18:24:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230402012447.7p6m37l74ao2u2hf@ldmartin-desk2.lan>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331134334.x5u5ixt7nnr666mc@ldmartin-desk2>
 <20230401085932.g6d3zn5th64hxdya@ldmartin-desk2.lan>
 <eboeoenvzefqll4pb6c7ligtoypwttqwolmztrl7dydcjlxh4v@g5iuj2exe72x>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eboeoenvzefqll4pb6c7ligtoypwttqwolmztrl7dydcjlxh4v@g5iuj2exe72x>
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d29cbc-4dd3-4478-aa13-08db33190d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0QbD6VPlqf/62jFaWP3l2y2PmxHLSjqv8NCX19XuUSX3VCo52Y6kUa7IjceA+6aGeD7PJGKYeqT/UnWo1+t5IAlh2nE4UAqiehWVAZWVWdgINWpXD4HtmPrjcgoYJF2DbP8wlJ8sc1JHfHs9LKV/g/CXQSzUdYjnITqi/0LeOHXbraNyIPQy+fA4q91YmrFB8qkFOeSrbO8ZahHDEAHnfyHuSpND3UhnaQEN4lwZj1BE5nLAeTTaD2y1NmX19Pxx6jowLQcz8gPudk3pOo2VItfUporc4g98jP93bR0N2ZOJajdz6CNFzfw9syBc74Xj3TzjS7VxFW4CToc+G/SnegTzYJAGwG4B72WhcDKynHyYfxD/E5toH62l0EJmYcki5YOzo8EWdcc37n58GR7YoyF8SKz+95HdRqflo4W3c7ZZpAMjYm0BUXRslGp0W8dyBysWo5AyLT2V570NR1t7MYYVmkKM5w7VEt8UA/cDpbSp8fJ4iquN60fkb1wq6fhDZoOrAhKLV1X6qVwxHErmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(478600001)(316002)(36756003)(5660300002)(38100700002)(8936002)(66946007)(2906002)(41300700001)(82960400001)(4326008)(66476007)(66556008)(6916009)(8676002)(9686003)(6512007)(6506007)(1076003)(26005)(107886003)(6666004)(86362001)(186003)(83380400001)(6486002)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk5UZ1lhZzQxN1VEUkd1bjc4WGx6VGlNWVpkMU9XRlk2SEpmcndHeCtQMWt6?=
 =?utf-8?B?ZzdZcmttNFpIMkZ4YzlrUkxXTmhBdEFReFZ0MkhSWHhlTTBUbkdJckJYWTVI?=
 =?utf-8?B?b214OVFobmoweXZWS3dUeEsvbERRNkdqSnlXdjU4STNSenV2SGF1TGhMTjdm?=
 =?utf-8?B?blNrM3puNVhaMHJ6RUNESGpFRlhOVnc4bEw3RHluUEJURVRFRlhEc3FGVWtD?=
 =?utf-8?B?bUJLc0l1Ynh3L1Qvc240Z3dRN1N2ZlhWK3FhWis3OEgveVg1ZXZlY2kwNC91?=
 =?utf-8?B?d0tKVk85aDM5NnJGQ2hFOXpiaVhiOHBVRVBtck9iMUVvdSt5YjljSkhpZUFh?=
 =?utf-8?B?TzlaUnJ2dHBaQmlJWEY0SWllZlAvckVhTW9VNkdqYnNDUWNpWWl0Z2o3blNa?=
 =?utf-8?B?YzJ0dTUzN29MWlRxSDNFWVRRcDZvWDNERzlyM0VUWlp0VkZPUVVHVGwwY3M3?=
 =?utf-8?B?UVpkRG1XTmFOOFRZeDNpK2cvSTNzQ3lIT2ZZUUhMSi9hc3VHYTNsMTN1Vm1t?=
 =?utf-8?B?ZWk3WHpucjJ2SW5FU2E4VE52UmRyQUZyc2NmWjh4RDA0Q3pDbGJjSEhJaVYr?=
 =?utf-8?B?Y2tabmhtd1BobGxJRXJWbzhjOUdJS2cxUFVEUUZzZXBXQm1WcjJObWpOSmhF?=
 =?utf-8?B?ZUQ1am45MmVubmRyR2o5aVRCQ01HMTIxYWp4WnY4ZDRyYnFVU1UzL1R2c3NC?=
 =?utf-8?B?dm5rbmhRSEpWSEZZNVdsYmE4S0E1bm9uK25pSnhQNGhFTWtEb0srK0Z0Q1or?=
 =?utf-8?B?dW9Qd3g0Wm82aHVnVzFvZjVlUXFSamFxS3MyZFVEenhFd0pnQjErSGpCUzNY?=
 =?utf-8?B?R1RzZnhKeU9GRFZIN3djMzlmclkrdDlqRXlHSkFpUTcrVW14bkc1NExJWng1?=
 =?utf-8?B?MlFsOVBlVFE5dlhwakRsd0VmWXhLN1BFaWp5UDlrdysrUE1nTFRjNHVZUk5N?=
 =?utf-8?B?Um9TUFJEdDRjdFZEZ0ptSzBIQTZWVGxMbTFwTjJhQmlhc0tlNzJrQzdVT3Nq?=
 =?utf-8?B?clBLWXB1dkpSS3Iveno0QWg1Nlhmbi85NjFIdjF4T1E1VG9sbVhqeWwxVzd3?=
 =?utf-8?B?NHoyVStHcjl4K2VKZGNqUmxRbUFWcEI0enRJT2YvbVFqVjBiVDlpNlhMalM3?=
 =?utf-8?B?aytCZGEyMXBjVzBWdlFtbVRWR3lkUTJNWHRhcWpRdmZaMlA0RTloMUllcktM?=
 =?utf-8?B?K3h1eDRjdk4wL2tMOWY5RjBlb0xNWUgrZ01RNnJlVXh3RHRJWXNpeGN6Mldy?=
 =?utf-8?B?M3JBdi9NNG9pZGUwYmtSL1BhR1lScndGbFRwcG5MdGpNOWVwQzhYOWN1cDVh?=
 =?utf-8?B?UFJqRjNhQ0dabENGd0tUZHN6RjNFcmRybG9uVHF6aXducXFTdUhNUFpxb25j?=
 =?utf-8?B?VzRiN2xQVkVnSTdqVFJBT0hXaDY5Mm9FMEpZbk0wWG5YamQxVnVJZ3E0UkhU?=
 =?utf-8?B?TmNqd2xrdEErNC9MWTcxc3JldU50SFJoSlNRcUp1ejRaYmQ5WDlYVkphSWwx?=
 =?utf-8?B?VG81dTdWSHBkYmd4UW5RdVN5QXRiYWU3VGVZdWVINXoxSHcrYmtYTk9rcUdV?=
 =?utf-8?B?dThZY3lkdjFUTzZ5NFJGUTRtRmRIRUQvbDJPRnZqSE8zOGhyOUh3a1luU05D?=
 =?utf-8?B?MlE5VmlLTWg2SVV0SWxEcVJVbzlFVTUveTgvMWNTR1NRNWhYWE5Qd3JneWdu?=
 =?utf-8?B?V2NDdTFGYTRPbS9JRk92UlhIOHZqVnlFN0FKdXlqSnR4U0tTd0tPdzdIYUVX?=
 =?utf-8?B?VGp4VUcwQzR4VXBNRHliVHFZMkVIYVUyclBaOVRpMVdPMFl3Tlg0K3NGTkJR?=
 =?utf-8?B?R1BOZWY0bkQ1NE54MlJCdDF0REpEcXdhZjNOU1pNYVJzYlQvQnNXMVd5Y2dH?=
 =?utf-8?B?ekxzOVViNVUyczUzTDdRQk1wUk5FY3RqR01rYmlWdzJZQkFaS3NHNHErOVU0?=
 =?utf-8?B?THpMR3oxR25QMGpHUWE4NHFwL3dpeDFIWnRqUElCekVaay95OGtaVForR1Nt?=
 =?utf-8?B?TnhJeE91WkRSdzZqOFgrQ0JrRWxIM09Jd1dBTUhPVVhmYVY5UEdzajZMOXIv?=
 =?utf-8?B?VFhZRmpzTXQxN21QNUx0RFZuK3FxK0FsWnJPOW8zdHk1N21EY0lVL094alcr?=
 =?utf-8?B?aWdoOXBqaGlralZZNHNab29JZElxemJxUG9SUUtLQlFVV0xSZFU2czJhL1pT?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d29cbc-4dd3-4478-aa13-08db33190d5f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 01:24:49.7800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnB4FgyxIsg1OtaSBqwX1MBVacZwTIKB7CoF99NZq4LSbCvG0IT5g2yUdez5UXp84LK1kXS8Woxa+7cgpuudEy1z9FNtAV5BsS0/n2SjCnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8348
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 08:54:18PM +0200, Michał Winiarski wrote:
>On Sat, Apr 01, 2023 at 01:59:32AM -0700, Lucas De Marchi wrote:
>> On Fri, Mar 31, 2023 at 07:43:34AM -0600, Lucas De Marchi wrote:
>> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>> > > > Add some basic unit tests for rtp. This is intended to prove the
>> > > > functionality of the rtp itself, like coalescing entries, rejecting
>> > > > non-disjoint values, etc.
>> > > >
>> > > > Contrary to the other tests in xe, this is a unit test to test the
>> > > > sw-side only, so it can be executed on any machine - it doesn't interact
>> > > > with the real hardware. For that a mock was provided with the minimum
>> > > > initialization needed. Running it produces the following output:
>> > > >
>> > > > 	$ ./tools/testing/kunit/kunit.py run --raw_output  \
>> > > > 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
>> > > > 	...
>> > > > 	[13:46:14] Starting KUnit Kernel (1/1)...
>> > > > 	KTAP version 1
>> > > > 	1..1
>> > > > 	    KTAP version 1
>> > > > 	    # Subtest: xe_rtp
>> > > > 	    1..3
>> > > > 	    ok 1 xe_rtp_process_basic
>> > > > 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>> > > > 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>> > > > 	    ok 2 xe_rtp_process_dup
>> > > > 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>> > > > 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>> > > > 	    ok 3 xe_rtp_process_incompat_types
>> > > > 	# xe_rtp: pass:3 fail:0 skip:0 total:3
>> > > > 	# Totals: pass:3 fail:0 skip:0 total:3
>> > > > 	ok 1 xe_rtp
>> > > > 	[13:46:14] Elapsed time: 6.800s total, 0.002s configuring, 6.682s building, 0.073s running
>> > > >
>> > > > Note that the ERRORs in the kernel log are expected since it's testing
>> > > > non-disjoint or incompatible entries.
>> > > >
>> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/Kconfig.debug       |   1 +
>> > > > drivers/gpu/drm/xe/tests/Makefile      |   7 +-
>> > > > drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
>> > > > drivers/gpu/drm/xe/tests/xe_rtp_test.c |  64 ++++++++
>> > > > drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
>> > > > drivers/gpu/drm/xe/xe_rtp.c            |   4 +
>> > > > 6 files changed, 290 insertions(+), 2 deletions(-)
>> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
>> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>> > > > index 93b284cdd0a2..11bb13c73e7b 100644
>> > > > --- a/drivers/gpu/drm/xe/Kconfig.debug
>> > > > +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> > > > @@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
>> > > > 	depends on DRM_XE && KUNIT && DEBUG_FS
>> > > > 	default KUNIT_ALL_TESTS
>> > > > 	select DRM_EXPORT_FOR_TESTS if m
>> > > > +	select DRM_KUNIT_TEST_HELPERS
>> > > > 	help
>> > > > 	  Choose this option to allow the driver to perform selftests under
>> > > > 	  the kunit framework
>> > >
>> > > But now we're mixing proper isolated tests with HW-interacting ones.
>> > > Can we move the HW-interacting ones to a separate Kconfig which is not
>> > > included in .kunitconfig and doesn't set its default value using
>> > > KUNIT_ALL_TESTS?
>> >
>> > I'm not sure moving them to a separate kconfig is good, because that
>> > would mean people building without one or the other. The only case it
>> > makes sense to build without the hw-interacting ones would be for when
>> > we are building for UML.
>> >
>> > I want to make sure the kconfig from CI includes both and people can
>> > run under !UML both of them.
>> >
>> > On the positive side for your approach, we'd be moving the
>> > *HW-interacting* ones to a separate config. This means we can create the
>> > split between the true unit tests and the ones just using the kunit
>> > infrastructure. I will give this a try and see how it looks in the end.
>> >
>> > I've been advocating for a split on a name-basis, calling these unit
>> > tests as sw_* and the others as hw_*. Then running just the sw ones is
>> > simply a matter of passing it as argument to kunit.py
>>
>> I will leave this for later as I don't want to stall the tests on
>> something that can be converted later and... this is not making the
>> situation any worse: actually running this in CI will provide an output
>> a little more useful than it actually is giving: a skip on all tests.
>>
>> I'm almost convinced we can make it work with separate configs as you
>> suggested, but we will need to sync with CI to make sure it fits
>> everyody.
>
>Sure, just something to keep in mind for the future.
>
>And it's not really about architecture (UML or not).
>.kunitconfig and KUNIT_ALL_TESTS are only relevant for kunit.py users,
>and so we want to have config for non-HW-interacting tests in
>.kunitconfig with a default value based on KUNIT_ALL_TESTS. Adding any
>architecture dependencies here would break kunit.py --arch=X usecase.
>
>For HW-interacting tests, we want a completely separate config, that's
>not part of .kunitconfig and does not have anything to do with
>KUNIT_ALL_TESTS.
>
>This way - kunit.py users won't even notice the skips (unless they build
>custom config), and for HW, I expect CI to be using a custom kernel
>config anyway (KUnit one is very unlikely to boot on real hardware), so

that's why this will need to be synchronized with a change in CI config
as with the current config we would stop having the hw tests.

>.kunitconfig and KUNIT_ALL_TESTS don't really matter for HW-interacting
>tests.

I agree about .kunitconfig, but if we create a
CONFIG_DRM_XE_HW_KUNIT_TEST and default it to N instead of
KUNIT_ALL_TESTS as you propose, CI would stop having those tests in its
config. Here it's not about .kunitconfig, but the .config CI is using:
https://gitlab.freedesktop.org/drm/xe/ci/-/blob/main/kernel/kconfig

Options:
1) CONFIG_DRM_XE_HW_KUNIT_TEST 
2) CONFIG_DRM_XE_LIVE_TEST
3) CONFIG_DRM_XE_SELFTEST

The above would be my order of preference, but I don't have a strong
opinion.

thanks
Lucas De Marchi
