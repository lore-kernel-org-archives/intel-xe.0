Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6319ACD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 16:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D30310E4A6;
	Wed, 10 Jun 2026 16:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiJtk5qS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10CB10E4A6
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 16:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781107640; x=1812643640;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D0N2ls1mEjjqacxUdRbqMN8awC9L9me+R+VAOhPUG0c=;
 b=ZiJtk5qSV7kfmAaro+P8e1DlINiiR/lnOVLKgSb/5lkJs4D8Suf2SVqk
 jmFBX1ai0xcThu5uqaf2j9pXiLmOTHEURaWYOxdradvS+Fr8OlmxP9lAj
 IyjMioZCCGgRt/5TNaS1PAT9pA/cf4w2ufSjb4QeRNHcOAg7WtLs7tHlJ
 a3I6QeqpXA4U6xB+4CyCLESeeE2rf7rPLOmfeaPQhVlIm/klnou3kbskC
 rZJFHZUzhsHY6E0hqrLfw+CKGB9DVJR7w3p/tZhsu1xock6nfBykDzLch
 G974tWYzAuEVKIH/x/fQvu1aSlxFkIG4Y73YLUf5+i+mOZogA3yCHA2Gb A==;
X-CSE-ConnectionGUID: J48z1HXXSbu6w/15QIfP3g==
X-CSE-MsgGUID: BHfWRML3RMmZacHCULjgtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92224961"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92224961"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 09:07:19 -0700
X-CSE-ConnectionGUID: sZ+KLRsYQVaio1/9yv+pbA==
X-CSE-MsgGUID: zwx2MvOFS723gk+OKX8mvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246293387"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 09:07:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 09:07:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 09:07:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 09:07:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvLn6vtROmBOp54ZxbgoKUZcYRB87PKOnkLM0OYfxWkPh6cEKOXA5kUBdSz0hD76NdTP3fwK460tkCiZfosXbbHKnXyVYVSXVr5QcsK+Z+ZOYaZedoDW189/ZJKWYEe7AuLPZUJHOUroaHUES1FUHJQua+AibC9Gyxpxf0LRa+bX+aC2Cwm9To5zL+I6vFYHCP39eG/NwGK2va7h2NMjHFOxKuGs9kYk1NKsM3sshZPJRkXPNendgVJAdF3WLrGuSxqwjT7tYyGE7dh9VhTTXi6wtDoELvH//rz02wllxLaPPOJapvxHpLdz8x06pc1bYkD1vKxpAPCYElV6/oVzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWiqIsvurOk3ZZ2TN6yXWR0ojxtKq/acaPnuNpqaISs=;
 b=Z7iHzWTdRVRBxBT49JDxLWYGCC5ewvNOdZ6BQTkKo1sM0rDPyC0XjAvdnnopl2SoDD8BSDc2Jz5kcHjd+ZaHvoXYNJcTH9QERXhAq2tGnpFzFBSro5AZGsfpSK+lngi5CVHJn0hpYpIoq0QATtkG2syFxBXVyA8XzMQbpFTenUUABgTsXWR7mJ6z8aHr3m2otYOo7doYcya4exqJ/EgKNK9pLEJS4ZqTRDrOQiWNLQE4kFguX6w/7IU3bHMPRj4HfAIxwvg0wICCXIctT3H1KhUp1Zrg9ctKhCD2JOct5eR2wjCOsM0iySHBWsR331bDvj022RHEfD6FdzQnPzJJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 16:07:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 16:07:14 +0000
Date: Wed, 10 Jun 2026 09:07:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Avoid self-deadlock in queue destruction
Message-ID: <aimLsPSqWY7rUjCS@gsse-cloud1.jf.intel.com>
References: <20260610120945.1726638-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610120945.1726638-1-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd945e5-511f-4f81-e6d0-08dec70a5621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BS8nQZuvRWI7oW1GkmBuHdwuWT2aPy1xQD52V7jdFVNWa3yp/lsRM19WvG1aZHphGTI3nz3kfBMb19bBWpTufGqb3TZGtnn3yMF3BdlHm2Ma9aUS7ju4vn/JUdzFD6PMhAfaPdYq/eKmes2pVtBvHm6IsJhLD5DzjJ/RN0VSzD2Qb8VK8l09P3/wM9aTM6bE2GxvMjd3E8YLJc7Dt2GhcVhqD7RLRMzED3KvLfVxSibvcT93rHgJEULxRX4LZCqmFrZKUFUMkUZIgYhan2/UnW1A4iirOHDq265yHzLccH3apIO32YN4sVuQPJvxV+dID8XlxH9D3WjZePieOHGLErm3hqWbtdyHhaMVqATZxQ0WDqNr719LXZ4CcjllmbwZh+VjttMzBK7UVhKtJKxkfSDsDAGk7sOSFwo37rlqpbxKR7u32sLIuIC2dMhQe/38y143DyKOKV7gcyzcry+h2GFWqqfyBpn52C/8wt1SqL58dmrVgW5cBvj5akgKrk5qUGJatvzFl1Wb0j1J8z4WdmvuHSTsqOWAQt8GGfkcpSJ9Eb0r8yNZTva9P/D9I5qvSeMHA+4uU8zrMbGNWEE+VllrvTcDjiC7VbEEgp97NQm2IToF+W0GgP3V7cfSo/x5+NagqKL3dxjtH2YvNV0XfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTV5WEl6Tmo4ODMrc3FnaU9jTXN6VThEZ1U5c1NmeWpnQy9vYjkyMjV1OVJS?=
 =?utf-8?B?VCsyUFlXOWlNZjJtVWRQZVUvakJoZ3JoQzdsZ0VVVDlvQVdNc29EcDc3bjln?=
 =?utf-8?B?NCt4SXdER2o2U0NZUVhWTlVLZnFkM1VleU16b1BqZEZjWmhVZTROQTJXWjJN?=
 =?utf-8?B?NS8xZ05BWDhKT0J6aUVQeDRFL2FMQkxhRkpmQ2hXZFVhbm43S2YvZTlFeG5i?=
 =?utf-8?B?VUpsYUlTQkU1WHY0NFpqSUlEMUw4TU9TTHQ4S0NWbFBxdVByM1FDMXdmLzBl?=
 =?utf-8?B?SlRtZ0I0UGhuR09FS1RSdklCMHZpVlluangzVG1HUEl2OS9rMnpHS0hpeDBB?=
 =?utf-8?B?MFFsTDNDR2RDbG1HNm9tdDlqZkRKSUQvM1VzMTRIaGFoNUdhTTAyaWpPb1VY?=
 =?utf-8?B?a3pmS25DOGIzT0tCVGIzc3B2dHZqbGk1VWFMd1pUYWl4Rm1YZ2UvMG1WTy9j?=
 =?utf-8?B?RUJYdjN5ZVk3TnBXcHRwUjRqT08zYy9FZGNlcXRTVGR3YmEvRmw4dkZmZkcy?=
 =?utf-8?B?UmYrbUQ5ZXlpckFrNFhWOXlnR3k4RmRIY21vUVN1ZW1YMENQM3Q4Rmg3YUJq?=
 =?utf-8?B?cnNLZXIrRElvblpwWHNLT284aXFCVUNCOXl2MzRiN2hiL0czSXFHSW5UR05F?=
 =?utf-8?B?dGNNb1pGM3dhZHhTZEZ3RnF1OWU5RldxNm9RQk5NSThkbFowUEhJTkxveUJG?=
 =?utf-8?B?cndXUkhDNnlaV0wvZkxVdHNFNXVvbW5qYjZ4NENEd1lvRUVnVE5VK0M1bW0x?=
 =?utf-8?B?TTdtcFNsZFlVcGRiNG8wV25WWjBKbngwaVBrRXZtR2kyR0JtcFZyY1J6Wk9L?=
 =?utf-8?B?SjMvUWNka24ycExzcElENHRLcXhERnBSYXp3VDhOS1RwV09vM0FpMmZwclZD?=
 =?utf-8?B?QzNUbEdCSEovemk4UThJR1ZFV21JZlVhSUhJMXRJaXlvYytpc0c5a3ZwejNo?=
 =?utf-8?B?WlI2b3JxelRRNnZMc2JaQy9TcnBHU3hROWRzZlpUVWRsVjUzcSs0bUlZaGM1?=
 =?utf-8?B?d1diTVpUQmQxREU3RjdyMjRwTDRTYmN6TXZKeW9PejFoUnIvWStVRmhIUit2?=
 =?utf-8?B?RTlyK05td1hCaVZSM0d6T3FvcHhxaU1MS1V1OEgxcE4wQmNXN3VCNVdHRDFv?=
 =?utf-8?B?WHNBVFpPNzdaY2RXQ3g0cldhRlB4a2tjM1NuMHN5OVdDSktuR3N5WEdyVjlY?=
 =?utf-8?B?ZkVnT3ZjNUVUZTZkYXluWHNHWFpJd0V3OVVLTGJROHZDRGcxanZmWG01YTgr?=
 =?utf-8?B?c2NobGFsbUZvaGhGVmI2OVBUVFZRazlxbHJ5TVhvV0oyMlcwaVZibmZwNE5N?=
 =?utf-8?B?b0wxdTRuQURpSUMxK0lKVm0yOFZPYkdxSElJb1h0aTNwa003bWRNaTk1WFEr?=
 =?utf-8?B?c3FBenlvS0x0NTl2ejVMWHpkTys2Z1VsYUVzbEtUcTlIczF1L0F5ZjRwaGxk?=
 =?utf-8?B?UEFoQmROR2VzVk1nNTF2ZzR2YjRmejYyUitZZ3Q4NkdHYUFEWk9CU01pMUZs?=
 =?utf-8?B?QVYyZHpQNjlicUxPZ2lGWUNjU2V6VGtPM0NZQ1ZGWk5zUUtLT2hFSktzVm5M?=
 =?utf-8?B?R3BnU2J4UEN6UVlGM3BaUU9lQ0tlYXcyZHNzNllFMEtDS2ZyWmZxWFdZZDBS?=
 =?utf-8?B?VFNtSjkzSjdVSnBUUHp5a2pYUDVTMlowRE4vTmFUeUFnNDhza2xYc1h4SG5B?=
 =?utf-8?B?aDdxdjR5MGpQeHJTZG1ZOThEckRSU3dKeVg4cTE0eWIyK0kwbVNpNE5iSjVF?=
 =?utf-8?B?aFFTWnRhUVdMSmFwQU4rR1pubjFmN3AyaUdTZEw3aVdVTU43NGErUVYrNlFE?=
 =?utf-8?B?NkpaQW9pcm0vVTM3Sy9VUkdRcDROQit5SnVZMnhISE55U2w0dHdTdUIzcXo4?=
 =?utf-8?B?YzRYY3ozcU5IcHlQaHRWc3o4NDhFNWRkcUNwRzhHQU1RN0dpRHdlSk5LVE9r?=
 =?utf-8?B?YmlJR00zZ1RpeHgvaHFWN2VOakFUSTVIZlBoRmsxdHZNdFhzOWUzTG01cXQw?=
 =?utf-8?B?emlqdlRiVm1uQXVjSjRhcGFRN1dQcUl4Q2MrbUxkaUEvWkR4QWc1Q3ZrTGh5?=
 =?utf-8?B?WHJiVEYrWE5wTUpDT00zM01zVWFSY3lZYTdTelZXNncyZ0JQNkRUWG91VDJt?=
 =?utf-8?B?REhuR3V3bnovMWFxYkxtSzAzMXhQZ0pxeXlUY1I5L0J5Z3dtTSs1L2R5bkRu?=
 =?utf-8?B?aWh4Vk1oeGErYlJVclBKZlVYaDhMOEVuUHdOaTB5ZHNJamtYZlIwT2pxcEZW?=
 =?utf-8?B?c2w1S3pCb0VpeWtScWpPWlRVVjB3aDEzeWpBSUFFbFlVbmhzSXhtOU4xODZI?=
 =?utf-8?B?bEEzVENJTG9rU0Niazc1OU42QVVuVHJEZGdpNlNkZ0F4WU1tNDVBQT09?=
X-Exchange-RoutingPolicyChecked: rQmcqpAUeO8FajiuVY5hXtnsCxiHPQslATpDn3U5JtK+ZZ7/xEf3SFVIT2nG4weeP1nuazZlCwCubxuV5i77XhbyeZndedKWhF0eFb6oVBWQ8dI+tCv6ehwto9w5NIxhV/0mZtbbeJBxOCa9o3NZ8Zca9T7B3xlC+0i3qm/QiPFiA094q4z+ruR/DLGocQmakN+CDehezFzw9iq5QlrNDyCNplUti4x/k4r9VnO70ouLK3ZxosMT60376oqF5qhd9MzfOVNtz4IUD9m304uL+/6jqJCpf+XCDYRjzRLg+fmhpSnx1RVvK9u/yvfg9cqpgi1DuCwzDTs1Sb/DVTIdJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd945e5-511f-4f81-e6d0-08dec70a5621
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:07:14.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMrT/1gpYowwyzJYU1hW1Y2kAqHsOGdvdGzRMrk4jjKeJI4TXID8zuwQU1+Hmfxt+1fl9Yw/+dmDtlmmN/pQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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

On Wed, Jun 10, 2026 at 05:39:45PM +0530, Arvind Yadav wrote:
> GuC exec queue destruction can run on xe->destroy_wq. During queue
> cleanup, xe_exec_queue_fini() can drop the last reference to objects
> which eventually release the DRM device and run drmm cleanup actions.
> 
> guc_submit_sw_fini(), registered as a drmm action, drains
> xe->destroy_wq. If the final drm_dev_put() happens from an
> xe->destroy_wq worker, teardown can try to drain the same workqueue
> the current worker is running on, causing a self-deadlock.
> 
> Fix this by taking an extra drm_device reference across async exec queue
> cleanup and dropping it from system_dfl_wq. The deferred put work is
> preallocated during queue init, so the destroy path does not need a
> failing or nofail allocation.
> 

I’m convinced an extra worker is required here.

The teardown sequence is a mess, but in the DRM dep work [1] I was able
to move xe->destroy_wq into the DRM dep layer [2] (see
drm_dep_queue_free_work). I also called drm_dev_get on each queue
creation and dropped it in drm_dep_queue_free_work via
drm_dep_queue_free(). It all seemed to work without an additional
worker.

In [3], I refactored the Xe object model on top of DRM dep using the DRM
worker. I was also able to drop the wait_event_timeout in
guc_submit_sw_fini [4] around the async release of GuC IDs, because the
drm_dep_get on the queue prevented guc_submit_sw_fini from running until
all queues had dropped their drm_dev reference.

I do plan to respin DRM dep in the next few weeks, but given that this
is common DRM code, it may take a while to merge.

That said, I don’t see why we can’t merge the DRM dep drm_dev_get/put
model ahead that, hook a drm_dev_get into exec queue creation, drop it
as the final action of guc_exec_queue_fini, and remove the
wait_event_timeout in guc_submit_sw_fini. I think that would work and is
simpler than what this patch is doing (i.e., it should only be 2 lines
of code for drm_dev_get/put + delete some unused code).

Matt

[1] https://patchwork.freedesktop.org/series/163245/
[2] https://patchwork.freedesktop.org/patch/711933/?series=163245&rev=1
[3] https://patchwork.freedesktop.org/patch/711937/?series=163245&rev=1
[4] https://patchwork.freedesktop.org/patch/711934/?series=163245&rev=1

> This keeps the final drm_dev_put() out of xe->destroy_wq while preserving
> exec queue teardown ordering.
> 
> v2:
>    - rebase
> 
> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 62 ++++++++++++++++++--
>  2 files changed, 59 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index e5e53b421f29..b5dfc9c9092d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -13,6 +13,7 @@
>  
>  struct dma_fence;
>  struct xe_exec_queue;
> +struct xe_drm_dev_put_work;
>  
>  /**
>   * struct xe_guc_exec_queue - GuC specific state for an xe_exec_queue
> @@ -35,6 +36,8 @@ struct xe_guc_exec_queue {
>  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>  	/** @destroy_async: do final destroy async from this worker */
>  	struct work_struct destroy_async;
> +	/** @dev_put_work: deferred drm_dev_put worker to avoid self-deadlock */
> +	struct xe_drm_dev_put_work *dev_put_work;
>  	/** @resume_time: time of last resume */
>  	u64 resume_time;
>  	/** @state: GuC specific state for this xe_exec_queue */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b29cc08e6291..d1ae4339f375 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -10,6 +10,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_abi.h"
> @@ -47,6 +48,11 @@
>  
>  #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
>  
> +struct xe_drm_dev_put_work {
> +	struct work_struct work;
> +	struct drm_device *drm;
> +};
> +
>  static int guc_submit_reset_prepare(struct xe_guc *guc);
>  
>  static struct xe_guc *
> @@ -1674,6 +1680,8 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  	xe_sched_entity_fini(&ge->entity);
>  	xe_sched_fini(&ge->sched);
>  
> +	kfree(ge->dev_put_work);
> +
>  	/*
>  	 * RCU free due sched being exported via DRM scheduler fences
>  	 * (timeline name).
> @@ -1681,20 +1689,55 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  	kfree_rcu(ge, rcu);
>  }
>  
> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
> +static void xe_drm_dev_put_work_func(struct work_struct *work)
>  {
> -	struct xe_guc_exec_queue *ge =
> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
> -	struct xe_exec_queue *q = ge->q;
> +	struct xe_drm_dev_put_work *put =
> +		container_of(work, struct xe_drm_dev_put_work, work);
> +
> +	drm_dev_put(put->drm);
> +	kfree(put);
> +}
> +
> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q, bool defer_dev_put)
> +{
> +	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_device *drm = &xe->drm;
> +	struct xe_drm_dev_put_work *put_work = NULL;
>  
> -	guard(xe_pm_runtime)(guc_to_xe(guc));
> +	if (defer_dev_put) {
> +		put_work = ge->dev_put_work;
> +		ge->dev_put_work = NULL;
> +
> +		put_work->drm = drm;
> +		INIT_WORK(&put_work->work, xe_drm_dev_put_work_func);
> +
> +		/*
> +		 * Avoid running the final drm_dev_put() from xe->destroy_wq,
> +		 * since guc_submit_sw_fini() drains that queue.
> +		 */
> +		drm_dev_get(drm);
> +	}
> +
> +	guard(xe_pm_runtime)(xe);
>  	trace_xe_exec_queue_destroy(q);
>  
>  	/* Confirm no work left behind accessing device structures */
>  	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>  
>  	xe_exec_queue_fini(q);
> +
> +	if (put_work)
> +		queue_work(system_dfl_wq, &put_work->work);
> +}
> +
> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
> +{
> +	struct xe_guc_exec_queue *ge =
> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
> +
> +	guc_exec_queue_do_destroy(ge->q, true);
>  }
>  
>  static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> @@ -1706,7 +1749,7 @@ static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>  
>  	/* We must block on kernel engines so slabs are empty on driver unload */
>  	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
> +		guc_exec_queue_do_destroy(q, false);
>  	else
>  		queue_work(xe->destroy_wq, &q->guc->destroy_async);
>  }
> @@ -1914,6 +1957,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	if (!ge)
>  		return -ENOMEM;
>  
> +	ge->dev_put_work = kmalloc_obj(*ge->dev_put_work, GFP_KERNEL);
> +	if (!ge->dev_put_work) {
> +		kfree(ge);
> +		return -ENOMEM;
> +	}
> +
>  	q->guc = ge;
>  	ge->q = q;
>  	init_rcu_head(&ge->rcu);
> @@ -1989,6 +2038,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  err_release_id:
>  	release_guc_id(guc, q);
>  err_free:
> +	kfree(ge->dev_put_work);
>  	kfree(ge);
>  
>  	return err;
> -- 
> 2.43.0
> 
