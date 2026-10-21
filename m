Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C99606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Px3KQm8h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BD310F9A3;
	Wed, 21 Oct 2026 08:57:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E48610F9A3
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792573068; x=1824109068;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=k4FVUhwen0mPobvxBNNje8sBAEpbJStYUuOSFZkcpGc=;
 b=Px3KQm8hnFJafGgy4rlezoRg7m+KEkNEPqdCczR/8opTeHG15mqebKqN
 nG7XDkxx9eRQ65KYhBNozFoivBwCUsbpmNpOkVmzo02MosdIxEOksYa6L
 bE0fmmgiPmUBNXMdWDB4ATTYjvZ06mKZ2XhHllCrofThTCl9zu591aanG
 Wfanc3BwI8Rd31curE2a7jcSBsKO4Zn5BvD39XxbBs7DBPe6XMj8CpUvC
 GwVvr3k7zw59E956tVC2SAwGsLlMiGTKSyhE7KZRMsvGOoC8jtN3U8KFv
 o4pAOXM58a0XJoNe2xEYxjKkxrUC90Og4pL9G1cUagQcKj4jSikGs6B86 g==;
X-CSE-ConnectionGUID: TZRGPsySRe2dCOMXbW8wUw==
X-CSE-MsgGUID: 7Mtc31YtRz2m1E/+rTcT0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1166915"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1166915"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:57:48 -0700
X-CSE-ConnectionGUID: gtfAYY6ETXyJkZvRTehSfA==
X-CSE-MsgGUID: QvEImhDESlu3veT98zzIYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="4870819"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:57:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:57:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 01:57:47 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:57:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqbBS/7x+OZYIapeCnhPvhDEHh4NRA09p32/G08kXCV6PGgj1ifgdeLD62oJXe59PcMQBsGRTvnC0yulM9zHlQMiJndpou6PQkpPt8QdunRiUJcaUMVAwW2L1LWAvX3VWemO482wFdtu+egNz0H5T05ABNHPHEluSu8vnTdu8bpjIzym1dhqw/7WOSLlnqV114O3nhJGBU7+W8G7OEp7wW9maSm7c8gyBw4zDCu10wczRMO6OrK7H57S9anbN1UzgbixsslTYAJvUl1yoUlx3hBNpiJUBdsFgW86XE/col0ChPgGW/5x7ztyV5VkpVk9pj/fGB53OwgNZu28XK5gyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbLXOonw7ujclJUjyV1dcGDzCpIPXOe6Bse4WX623l8=;
 b=A2MpScUYvKjqtlOiOKaPWUpvIR+F/xTNbuXvd6c46jJ3GueJphnYFfsY61Sq7denvegrtY/MkapZYInqjQoEVd6oJDtJEWkcGbG2vUUKThGp7055Ri3ufAlQgPEj7fmQY+CIcw74hffuYQMyktxwDF4bwQnPdXbEfe6zT65lpykHD2r0rzsYrsSEGGxT6e8/fzFx+1CC3vlnTt0Uqmk3+TFUTV2KvVn1VIZDbr7aQ8FFhMZ/XF9OI8BdKao9DtvokDjHf5aAekutNOzapvj+1PX75PCFOBW61+kLVl9ylEtzyjgATD9faTh4ZAc6J7T7DFOspt1UYqeYy0TW54B19w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS6PR11MB943645.namprd11.prod.outlook.com (2603:10b6:8:499::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:57:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:57:45 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v7 0/5] Separate GGTT pools for submissions and VFs
 provisioning
Date: Wed, 21 Oct 2026 10:57:11 +0200
Message-ID: <20261021085716.709503-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0032.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::15) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS6PR11MB943645:EE_
X-MS-Office365-Filtering-Correlation-Id: 478eab16-ec7b-44df-7b02-08df2f515fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|261009223027099003|10067099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: jiE+P6lu4jRU2sWapPPh4YkK/0f0vuSwMocxIhNKiuSjjBPrKzMcBn5vk9dZDX4GdQ9Y3S7ejqNxaAmPK5ejJ1dJn42s68e61uBiX7HVsm5Og7YOOWjYgm/bxgYgS8RhcBAiQvrqD/TAzDFUdIrE7qz8n5RC11XqgH1Nz599Td765hJnlxtWG3wc+IsNy28Ysa9r3+l9axV6Tn2jk8OujatDOY7wO9gjpxV9kD7wgHGmkqtJ/m4DOB59qEVO/dI/y2TO81qVlBlKX8xQz9KRZOYKu0n7aZGvXnS8+4aa4QDWkcTiibsbBy03wFSiCWaPPSGuxTblj+PKx+ne9pRb9LWj/eMjwCnpTTaxXMlV/vyAyvkNA1PAhYG6McZ+oB2aZkSDxmK6pK9CydcToqKbJriNsn8qzf2doFNsN0Jyn/gu6rRSkI5wtnocY7N5nfdOQ4K53eNEVCF7HezQ7l8dChXVD4egVoTlkM78DUUh8bALHYRWDS1ai48rWo0wZH5AOzW+K0iXUcXM5NMXxUqYIltNL5vDf0w2YNldVBVEIvs509QKWtg/KQ/FF2Gk2xjVQlZsC50/qGNaM3Ii9Mk42Fhjaj+JihzljtojTF0bHGbS5502SoB1PUZZpG+YSsXYVNyOaywkyPKX7H7vVTmrFiw9Q7j8YmI/oJNLnd/uz1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2VpNE55Wld6WWdMYkpuOUY5bVlXYnZ2UWdQSzhnUjdtZGxtRm5BQjJKZStp?=
 =?utf-8?B?bEJBalVTS2VwTUM0UkgzdmhnWkZCOTA4NjBJT2lZTlVlWXNrdUNvNmFPbW4x?=
 =?utf-8?B?VzhjQ1hNYUxhbUdrMlYyRWh1bzllM1pyaHhzY1ByVkxRWDNKVVM1WC9ua1FR?=
 =?utf-8?B?aCtXaWo1VDNGRUpqZHZRakpPU0dyL01BeURoZ0x6Z2tObTJ3RUZ5ZVFEM2J0?=
 =?utf-8?B?YWIvNzZNMnJZdktkbUlQV0JEcWhaQzZscWRWRm5GaXpMWXk4YkoxejF2VXMr?=
 =?utf-8?B?ZkxBSlR3ZElWWlFjVFRxR2oveEMvc2dsOTFnV3AvaXFNcVdwNEV3Q0ZIY3hz?=
 =?utf-8?B?dGVGbU12ME5yaVFEb0dPbGs1TEgyWGE1OEJxWWNSTjh2N1NnZ1R4eGpHR2RX?=
 =?utf-8?B?RHJwbTlPK3lNQ214cUViZ01YQjZtOVZnMmVzMlN4M0RUdU9aaVNYVy80OTJl?=
 =?utf-8?B?bVFncVlxMUh4UlNYTVgyc1ZqOFJGalAycXMwSWZRanR6STFpZFZ5RWhXSG9E?=
 =?utf-8?B?VlVWSWhETDZxNUNLbUJVOXpiR0FKVDZpNTMwVU9YQzJYWTluaFpmVjUzOWYz?=
 =?utf-8?B?OUgxSVhNeStQSDliTjUwMU5PQ3FSbVo5VTRLa3hCTU9zZzlXVHdTZjMrTDdI?=
 =?utf-8?B?eU9JcURwQktTRWdCZ2krd2ZMQ3VmTlBSS3VDU3V2TkVWbURZY1pYbkJCaTNl?=
 =?utf-8?B?THRObkIrWjNVbkU0Y2RTd2hZenhXQmU3ajNnWU56OWk1N3ZyZjU2cmQzWlg0?=
 =?utf-8?B?QzVOTmJCQ0RLQnpUVlpJUEZPZlRjQjkwM25MSmVmQ1dYUzZBT1RSdkhkb3U0?=
 =?utf-8?B?UDdxbmNQcFQyQ05rd0dud3ZWamZENW14OFVZVXZuQjVSYkpZeFplN25BMVdL?=
 =?utf-8?B?RkRvVzU5Yk5kQUhiR3E3T0drbklWa21IRCtXNWhES1FsT2lxUVBobVNoc2F3?=
 =?utf-8?B?dzg2YWpRNGo0elhIS3Z6bkpkNUw1cHBtYlBEMElyc2doR2FDRHc3V0dlY3lE?=
 =?utf-8?B?ZlVlWjBydnlmd0lETWdrM09zRDZHMmM0YVc5Uy9JZWpEc0NPQlJ3RXZab3Zn?=
 =?utf-8?B?cXV4aFZ0R3d3aUhoeTJSdGdqWGh3UGlIOEhXdnpxSEJMTVV5cjU5MGpMMURj?=
 =?utf-8?B?dGd5WTFaS0xWUkFySGFHam9kaENqYkUwYnpmeXIwR3MyMU5MNVJGUHlreis5?=
 =?utf-8?B?UXpTb3YvU21xTHNnWWlZekRQNU9NZ3g4ZGFaU0h2dDJyTFNVNThaV3JoUzVi?=
 =?utf-8?B?bVRnWGZZVm5WMjJtdlczTWkwdk02YTlHK0lESUVhMDg1RDlsdkd1MWlFbTEv?=
 =?utf-8?B?c0x4QWdaSmxld2xIMkxlblVDeGliWUNwR3ZJOTZ0OFYxWmxsdGkzTWJCVC9N?=
 =?utf-8?B?WlJEaTNOY2ltc29ZM0J5cDJHcHB2ZjFZUm00dkd4dUhsQWMrcTlndnNmaXdn?=
 =?utf-8?B?ajVuRDM4MVhwb2kwMjdZZ3VWeVppRmE1bkpvS1RNSHZRVXFLK1ZsSHYwd0Vo?=
 =?utf-8?B?VTByM0V0ZFhMTDEzeFhtOW9oV3ExNEQwN3prRUE5RFRERmVvaDZqSCtaWHNx?=
 =?utf-8?B?Z2xGQnRCQmowditSL3BqRjdwanVxbXpPQ1dKQ0RoUHdNM3BwOTB4TGxMMVhT?=
 =?utf-8?B?SmFUUVp4N0xlUVFnZW5URGFEbCtHWUFHWVF4Snl3ZkxDVzlDa3JJVXdoLzBk?=
 =?utf-8?B?RTBsVUVaWFMybC9QMkMwSXRwdGlZa0EwQUxQSnJsdG9DVUtIeGhZOEZxcERH?=
 =?utf-8?B?TWROc3hEUGxXZHlzNU1Ka0ptcTB5N0c1ckcvMWVLRmZjenJkSVdpcUxmaHRj?=
 =?utf-8?B?d2hCNXYvUFREeUJScklkOUtwR1A5Z3lpU3ZIMlpEVHFreENHeld0NEpGZU92?=
 =?utf-8?B?WEFqQUppbEpzbkxob01sUHlaZlRNOG56b3VTNEdGdmJoR1ludytHMUVJMFlU?=
 =?utf-8?B?RWVjS2pKakZlbitYY2hPa09YN05BMlhVNEVlYjFITGNpZ01KdDV0Ryt2azNK?=
 =?utf-8?B?d2l1S2ZWUzd4cDBLbVpGRE4yamZGOXhaQk9NU0JQbzFtYnRFemZOS1cyRE15?=
 =?utf-8?B?SENiZnRoUHZTZzR1L2hqZFA2WXdnNm9xTTF4N0NNYmdBb216VnRxRDJQbkYw?=
 =?utf-8?B?VjNpVEZRL1ZlbXBHUGxJT1Zzbkc1Z0Z1MHU4VzFxd2JiazAvd3NIOFJwdWNY?=
 =?utf-8?B?NlJyUjdXZmRLNytjbmFwS3FLUkxhVUMzaGJ0ZHFBUjBTWWMvcmd0a2tvVkln?=
 =?utf-8?B?TFlQbUVkNThCUHFNZTNJUXdNWi9sWDJ4bG9LYm5HcjBMYlh3M2JZWmczQVBz?=
 =?utf-8?B?NlFsT2JKeHVNTFBqNTVkZlp1dWxzSkJBUDFHYnNxZnNQVG1HN1N3eTQ0bnph?=
 =?utf-8?Q?OcC21LrzxWunXw5M=3D?=
X-Exchange-RoutingPolicyChecked: zDxrVCvmTPtb5tHQ1ttBl2Dz+S8CdKKYe4F+Mg1O1FGf7tqvvHR/16FGyAuRh6c8tB6aDRPjlE65MvAfV9ZeUk/Uynq0JcoCVDiKi4FqBNoC7WKG9zNc8oIMg2QFmJRLbTqgKY6nf2z/KjozK7Wfd+TCcUAHFBdkZYEXgFYgJyvGExSlQzUzzzAyHJVqpwhbFctySQTYLyeHl7zt88rjU+GcrWlkcyp5e6vwLRKdNqhoHW6ZDxwN+V47QBoh2T6r3v1qRNw7KJHc5l29d+dXC9iI2u0WEgvQeZJV4MqhclKrn8RtHfRWWQ4we1TQsN9Y7NbHZdrOrpenpKmW6izbog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 478eab16-ec7b-44df-7b02-08df2f515fd9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:57:45.7781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xx1eJ39hByTUnyKUFBlddl6uUkaXXyupjpiQ37KQnGtW+SYkcFdnMVKvVO0rCf3Xy2m7ZlLwgPDy7ByydChgfq17zs1UNn8iVEDqirXS2Qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB943645
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

GGTT space is used both for driver-owned allocations and for provisioning
GGTT regions to VFs. These allocations currently share a single pool,
which does not allow their usable ranges or allocation policies to be
managed independently.

Introduce separate logical usable and shareable GGTT pools. The pools may
overlap, while each allocation remains constrained to its corresponding
range. When a shareable pool is present, usable allocations proceed from
the bottom and shareable allocations from the top.

v1 -> v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v2 -> v3:
 - Init ggtt.lock with mutex_init() in each test.
 - Introduce the hw_size struct field instead of the ggtt_accessible_size
   function.
v3 -> v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v4 -> v5:
 - Add a preparatory patch introducing ggtt->full_size to separate the full
   assigned GGTT range from the regular usable range.
 - Rework the GGTT split patch to use full_size/shareable_size terminology,
   compute the shareable start on demand, and keep regular allocations within
   the usable pool.
 - Move the range initializer rename and full_size parameter into the GGTT
   split patch.
 - Rename the native range discovery helper to ggtt_probe().
 - Treat out-of-range VF GGTT configuration as invalid instead of clamping it.
 - Move GGTT range logging into the common initialization path.
 - Add GGTT KUnit coverage for usable/shareable pool initialization,
   allocation direction, overlapping pools, unavailable shareable pool, and
   oversized requests.
 - Rename the GGTT KUnit test file to use the _kunit.c suffix, add shared
   setup/cleanup helpers, and split PCI IOV tests into a separate suite.
 - Drop redundant non-PCI_IOV stubs and misleading provisioning debug output.
v5 -> v6:
 - Release allocated GGTT nodes in the KUnit tests through deferred
   actions, so that an aborted test does not leak them into
   drm_mm_takedown() (Sashiko).
 - Rebase on current drm-tip
v6 -> v7:
 - Add a preparatory patch asserting the lower bound of GGTT PTE
   addresses (Tomasz).
 - Rename ggtt_shareable_start() to ggtt_shareable_offset(), as it
   returns an offset within the GGTT range, not a GGTT address (Tomasz).
 - Explain why the usable and shareable pool sizes are checked
   separately (Tomasz).
 - Drop the guard() conversion in __xe_ggtt_insert_bo_at(), so the GGTT
   lock is again released before the invalidation (Tomasz).
 - Fix the !CONFIG_PCI_IOV KUnit build (Sashiko).

Piotr Piórkowski (5):
  drm/xe/ggtt: Assert lower bound of GGTT PTE address
  drm/xe/ggtt: Introduce full GGTT range size
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 341 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             | 295 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h             |   4 +
 3 files changed, 587 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

-- 
2.34.1

