Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CDC87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 16:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8310E97C;
	Thu, 24 Jul 2025 16:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bn0IXVYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A9510E97C
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753375352; x=1784911352;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cidYTWwubQ+GAT14ysMJCmwSJ7fz/dJwuL2lA6k88qY=;
 b=Bn0IXVYiWIMp5McTV1NJMq/KKcRB+4pBFLGf04W4KP4vKKt6Xz1T9JMV
 XSYXNiYODntLibRNywugoLhs0siVDV+6bErVfxMd79DUlkZGLz+2JfdZ5
 hSZUIwKc93Lg3xD2jrhjt/gkKX62TvWMkUOdRrlDo04WdVUYnxeuWM7Ce
 IUt5Sthh5s61bFK5WrG+BqxNzJlrDNMWXQBxjMpVQOnuHk4fs7XjT9hFp
 rqChK/H40xZpj1PIGD6yUDy3RY4NoJzG+WWDBJ0zy/DnhdCRPAlZ+DhV0
 NghKcRbfgHVsFDTqsgyLm63v6s3Tfffxm8zv6gtO+pMMFUJaN/ltzy5yl w==;
X-CSE-ConnectionGUID: wTSBKVtlS9G0E4kukNa0+w==
X-CSE-MsgGUID: /hjFoY9ITN2Wm/DP1f2GAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67139448"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="67139448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:42:32 -0700
X-CSE-ConnectionGUID: ROK41oXvRIGcUmo7Arj1uQ==
X-CSE-MsgGUID: 1xcAP+QfT6q/DU0uig0jRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="197479809"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:42:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:42:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 09:42:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uipjxJ9XQowhepr6wx2EDk8kLJRgsls2QkqkfsRQdHqYZPofaJI0o6/Ngq+VgZkgcxsTAh/DNmgRRnZ1LiuvySg8JX9YHksUc56rUYRwHL6sVAMQTpY6eTk/LHV+hyqy/O90dDXFdmqj1eI1sBJpbzva8DhCac/Fht+m0T/Q1HSJA19iiHQX4V3pjD+A5VkCHb02Xa3D8a17Prvj5zZHsrGwg4nwaPQReQWF0x+C6XZXmvc5GumP97/AE7mrvS2nzbOd4r4dJe74sxIhZxR7mbsIs5S4CHRUWVFZ9kJyAt2hMJOQ2dbt8ONZ0iF0cmCjO/mwEC+OQctKhtExlvoRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbtXEmPAqeQ1KFJfX2uuI225z/m5Lwfo5wOAxDw6FP0=;
 b=Ne7N1YLwA0CKXpggoo0JoUzZ3WkicNGRRsWPzjNMbIeX2/LiDeZlGdi2rSNDxzI0k9emA5VDx0JLjD5k/+ncmZvHGOQAeEcmN4jXWPkb/+nsy/GPmf0zO9DCLAbjB9sOBbcoQi4hkFoZMoSvtUkJcDpE8eX41eczEfxYMurq2zIXQp1P+dmv0fv+PeSqcgfhOvCr4+3s2QA8VBfIkvNBmVy2WIEysAt6OvKxA/Tj1qCl8ghPEgRZiW8LDl3jQQ8BXuPSMdjzC/UCN5vmvK0+fb5xhwq+nUQ/IpmRVMy+oHlRnJUR+SGQxuasw94AVcQRt8go3bHLXDob2tquX3yv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.40; Thu, 24 Jul
 2025 16:41:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 16:41:54 +0000
Date: Thu, 24 Jul 2025 13:41:49 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/6] drm/xe/configfs: Check if device was preconfigured
Message-ID: <xi7mzmwnpjyk6wdku7iqlzoy3a4hyktf3agt6vbjujtzliq3pv@bvclmkyde2so>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
 <20250722141059.30707-5-michal.wajdeczko@intel.com>
 <sihlqt7y2k33ay4pi23ziltr7lfprbujyxyhloozeoqvpvkewx@jikbnw2so6ac>
 <c77f0c14-e4f3-49bd-9516-6fb4a15e92e3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c77f0c14-e4f3-49bd-9516-6fb4a15e92e3@intel.com>
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 31457451-62bc-41a9-ebbe-08ddcad0ff82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?n058NDB6AtNAhLTpbqsYQ3iW8QL0iBxH1dViQCzM8l5ybejCwGsX+1ou3L?=
 =?iso-8859-1?Q?H8cK1oS62wIKgwRkXfnkl6xhAz2WKB4kf12BT9DNGoM67/6eTwhaxQLelZ?=
 =?iso-8859-1?Q?SX/pLTsfLfvFTcZkqO5BXxZw2lWxOQFk/myBrwZhZE0yOAB/k0XnM7J3xU?=
 =?iso-8859-1?Q?RpTbXHDzCHEqP0tmHZL9r2+eLBHNYiK8Qb2+m7f3eYSGuXcf/udwYCn4li?=
 =?iso-8859-1?Q?GUBJ4gr9rJ/OjNqMjwdsPQoTMrllft/vzaY6BA4Ty7LB0rP48n8f3YX4BS?=
 =?iso-8859-1?Q?8k79S7Umsx+TpIcGjuHXW3tcJUE5UvFsVCzVCSF7JgzNmxDqgHQ+v5Dwek?=
 =?iso-8859-1?Q?fcwbLAL2oOa7Wk4fcSnjWlhNIy0EZFiIilPtEEc6lwTtGKUfnoEXuevDuO?=
 =?iso-8859-1?Q?g34cDMHlekcojdNa52q09Ma6btkh4q13+p1HDB0eo3JfMbXE8gnvoN+hv6?=
 =?iso-8859-1?Q?HeKkpKQljHsMlrCIRqE7/F6uFfjW+lcJpR6tgzP9yLEkDOg5iDC8KDzlP/?=
 =?iso-8859-1?Q?0kuMzb04KvgObD6epY0tQgb5s7koKqflmttakv+eL29afjTdL6ou4/fXF5?=
 =?iso-8859-1?Q?auBIJVn+1Cdkpa3OY7HJb7FdODYqy+9gmZvyKVtvLCOzQRH28eNk+BZC3x?=
 =?iso-8859-1?Q?a2lst04owFgX2dl0JxCWALFqacAlNh7dkY70xM7hvaP7TmvA7oY3bksd7W?=
 =?iso-8859-1?Q?SUB1S1uKxUq6vojiIyv/eQ9C7r4NKfsb3NRn/XoxcBYuqhgWknGouX5FtT?=
 =?iso-8859-1?Q?e2RygcJSHGSuqDRPPYt3yeT+AwxdLaay13D20ai5xfAaHAxSvJq8SmB6o8?=
 =?iso-8859-1?Q?kI4IDhAlYLjWsDcGOZea5MXopsRvbzgV6gTWcQXcEM6gu3FQg+SIjda/EL?=
 =?iso-8859-1?Q?T7cKSS7z1XkBjT/cxBm+GGDstUyRN2b52AcBeM5b2e2Q4OPp6fu5UcEbIJ?=
 =?iso-8859-1?Q?ohwa+lUdwiEJKcV1KiaqMbSQo8poUb+TkSfWkCwr76NnfBJu7voeu0Eoni?=
 =?iso-8859-1?Q?IF+qMWA6+GyvIaAoT5QKRa6MdnT6zfX30u6s7bwBohS8jP3LKK3rYRj7of?=
 =?iso-8859-1?Q?4fGzquEHrDrFt4M4l+zhCFGwpYaEWQRDmTmwX5GimrLeTap15T9jE2LRLa?=
 =?iso-8859-1?Q?/tGgY+2eVkHTtutLM9J3UTcZ9Enn/idqFBUANlnPyN2JA8A5qWWW3/Yore?=
 =?iso-8859-1?Q?5fZKelOADjIIK3EuxK1d3/q1vW+5+lU6DSNIc2x3DrOdww+TFE2My9a++7?=
 =?iso-8859-1?Q?bF9SH66aPSxPw30EoZBl/pMDIV8z47xJBzwSfgqlfVarzJGwogaQ9SLoPG?=
 =?iso-8859-1?Q?PhZHJYb3j4qnW9R9uabCGEZxUymnW0/7HuhKYiVrx1n/Ou17IAJWgxy0EI?=
 =?iso-8859-1?Q?lE5r3+mH9pWHy4pC0ARoE9m7v4OM6HB1EtDjsbMXzdv5sUyb6atibcXKkQ?=
 =?iso-8859-1?Q?B5EZht4VftvocHY4PmNMSj0oJrUvDFZK/NVPcTmldShwrTx5ZgdLWocAds?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/HvzzHDUtrViIfuQY7eMd3J9H9+4Jmk42LpuuydFe+Ab7exEyDiem+7OnE?=
 =?iso-8859-1?Q?+sw8hq8DXaZdqQPjiF0nE6qg5mS+qA5VjVd7NzZVpMlSvJtCTilpjWnbbJ?=
 =?iso-8859-1?Q?s+Zz6hslHFlCIHpK8tIOwIz6Uc2jjZOnhwZCCjItqxgumrE/0fn7cajBWP?=
 =?iso-8859-1?Q?W/JYZ8UAaBu8JUN1TNX73LhEgk+KcHbPG8EEkVW6xOzGaOtvpHbc0tzPfg?=
 =?iso-8859-1?Q?5XwspuH/qKoiYRr3WIw+k0xSmFlbB4gVznJjilbzWR9ORkc3RDr/bKywx0?=
 =?iso-8859-1?Q?T6cJbYXQ6C85imWxjqWBO/jdljwdy8vjS3iYI8rXTbuhM/ZBaq3bC8KiNF?=
 =?iso-8859-1?Q?mAZmuwopWvZSx5SJK29DSXqO1lPrU7isxr2fRMGMqilVTWXtOng2pqUTUH?=
 =?iso-8859-1?Q?YSFF/GnxG51CBjxMvTzKTZ+HZvptrsKWPDqvQfPAK0k2JL2NYNtzy7szKT?=
 =?iso-8859-1?Q?111KUEVS2GpoDANnYPEbdvYlv4c/1DhyDul4dtGbsQO/Bs6mTkEDDFW0dQ?=
 =?iso-8859-1?Q?imO996xTkt5sfOHahjwb0fIZz1AC8M+23KA7vY/v1gEKV4ZVr+Rk1w/Pq2?=
 =?iso-8859-1?Q?A2vT7vDY+ppvfp68qOTGeARzK0NSC6QAjv0bPnFg6Xhip/syhcRMOkCsSK?=
 =?iso-8859-1?Q?mS48J2RInuh+0ZOuW5E6CvUklPzXXHoMGR7IV1CfJDr28B5O3mlbQpwj/V?=
 =?iso-8859-1?Q?8rdPTuoq1WbmhelBadhjxSwnkijPv9Ynk+NxFjjkDNfEnGLU8vDnEohFm6?=
 =?iso-8859-1?Q?OAYQgx2LzILknQUh60ar120+ux0koThSRgyt7NyJgio3s2QJWdd/+lHPZs?=
 =?iso-8859-1?Q?FVC7vPbkU+xvKj37WuNK9kD1qx8Qssu7uEIEJg4uWCKVk6UOIjulmXU/xQ?=
 =?iso-8859-1?Q?s42KNnTjWrL68FhG41dCZhONq7G24QmnPNZCNOU6voWgNI20Q7PKiqEhDn?=
 =?iso-8859-1?Q?5gviTGdTkAeMWHhL2MtzrOYiMcolL/vIEaEhIT6gIdvL0xF6b5oQb7ndwF?=
 =?iso-8859-1?Q?d7e6KLCCNHqkQQHc8jVKNIK6cpbEyFNgVlWH+4j/42F1HYdNHOueyV2B30?=
 =?iso-8859-1?Q?pMbDiR2QFHhnpX9m/Vl1hb1TnzOo1miBJrK8V9K/kkb3sgqQ9l/p6syEws?=
 =?iso-8859-1?Q?t/K7nWu/N3MWeFKUuGh1343AG0YISbiuglYJ7lLLPj8Ox/3Zfa+ezfvCsH?=
 =?iso-8859-1?Q?V0xlRrr3xKWkMWxt1zkdKuT64nKGrhGceLeiKu8tyh5kjelACGd0Aa7CmL?=
 =?iso-8859-1?Q?2SZA1f2fccjLiFaxhmdYJfSrNqrd6yfL1LD2MjINGIBwq/+4UoEu2x0cqD?=
 =?iso-8859-1?Q?WPpENeJ/y9ZZSp6ly0lpQUJad1d/udpEDmh80tVF9KAWztLnDRuqcJqc3R?=
 =?iso-8859-1?Q?CgvpfJ/gZDsHdy9AyuCD64WxOKs7ma+VLJ26mZ4mLJ6O54K9HJNGdn1Zfo?=
 =?iso-8859-1?Q?MaawKFqV/gc0OpfSPtTFeblJC+8/O1835iYx4OY8tR0FdC1mAHOlUd8aum?=
 =?iso-8859-1?Q?VDvGLUfyk6cA4Z94lsPHD23T7CwIJRllzyVxUY8UuQ7W5tSW1NN0Fi7UJ1?=
 =?iso-8859-1?Q?LxIe5JEWASF1LK79EDlfGsfBg5O2u5oHJOz1yPdk99kbT6VmrjhrBqwcJo?=
 =?iso-8859-1?Q?tsCnJjiXK1hKBz5Kir0MM1t0VwQBThOWKOGgyZ+RkKoPQAo6csRoD4aw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31457451-62bc-41a9-ebbe-08ddcad0ff82
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:41:54.8402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adZVFBaTr0dBo44LCMB/YWY/io4MYuCOFe6UCkZfzjSnjxoXDCatWMOxJ464oJ1rWp6IlyC1PH9GT/ST3JXLkk8SJQXicMMZ9ICQ/ERa+aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
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

On Thu, Jul 24, 2025 at 05:51:43PM +0200, Michal Wajdeczko wrote:
>
>
>On 7/24/2025 5:17 PM, Lucas De Marchi wrote:
>> On Tue, Jul 22, 2025 at 04:10:57PM +0200, Michal Wajdeczko wrote:
>>> Since device configuration using configfs could be prepared long
>>> time prior the driver load, add a debug log whether the current
>>> device driver probe is using custom or default settings.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_configfs.c | 35 ++++++++++++++++++++++++++++++--
>>> drivers/gpu/drm/xe/xe_configfs.h |  2 ++
>>> drivers/gpu/drm/xe/xe_pci.c      |  3 +++
>>> 3 files changed, 38 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>> index 36e2b45b305f..f83e8e9f070f 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> @@ -118,6 +118,17 @@ static struct xe_config_device *to_xe_config_device(struct config_item *item)
>>>     return container_of(to_config_group(item), struct xe_config_device, group);
>>> }
>>>
>>> +static void xe_config_set_defaults(struct xe_config_device *dev)
>>> +{
>>> +    dev->engines_allowed = U64_MAX;
>>> +    dev->survivability_mode = false;
>>> +}
>>
>> other places here follow the file prefix, xe_configfs. I think mixing
>> both is confusing.
>
>but those are different classes:
>
>xe_configfs() functions take struct pci_dev *pdev
>
>while
>
>xe_config() functions take struct xe_config_device *dev
>
>so maybe this one should be just in full name:
>
>xe_config_device_set_defaults()
>
>or short name:
>
>device_set_defaults()
>set_device_defaults()

lgtm

>
>>
>>> +
>>> +static bool xe_config_is_default(const struct xe_config_device *dev)
>>> +{
>>> +    return dev->engines_allowed == U64_MAX && !dev->survivability_mode;
>>
>> maybe have something like below would be more maintainable? We may need
>> to move the attribute values to an inner struct or just set the
>> defaults very early.
>>
>> At least aligning the variables would be good. On a first read I missed
>> you were checking the 2 vars.
>>
>> static const struct xe_config_device defaults = {
>>     .engines_allowed = U64_MAX,
>> };
>
>could work, but this will likely prevent us from building defaults in the
>runtime based on the data from xe_device_desc (if we ever want that way)
>
>>
>> static void set_defaults(struct xe_config_device *dev)
>> {
>>     *dev = defaults;
>> }
>>
>> static bool is_default(const struct xe_config_device *dev)
>> {
>>     /*
>>      * If a new attribute is added, there should be also a check for
>>      * default. Assert it's not forgotten
>>      */
>>     static_assert(ARRAY_SIZE(xe_config_device_attrs) == 3);
>
>maybe inner struct with attributes would be a better solution as then
>we can just memcmp() actual item with fresh default, or at least keep
>all non-attributes members first, followed by real attribute members:
>
>struct xe_device_config {
>	struct config_group group;
>	struct mutex lock; /* protects attributes */
>
>	/* attributes must be placed here: */
>	bool survivability_mode;
>	u64 engines_allowed;
>	...
>};
>
>return !compare_after_member(def, dev, lock);
>
>btw, do we really need mutex per each group?
>can't we use our singleton xe_configfs.su_mutex?

I think it would be fine. This is very rarely changed and doesn't matter
much it crosses all devices.

>
>>
>>     return dev->engines_allowed != defaults.engines_allowed &&
>>            dev->survivability_mode != defaults.survivability_mode;
>
>you likely mean ==

yes

Lucas De Marchi
