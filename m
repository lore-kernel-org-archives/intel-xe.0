Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4D8C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 16:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0FC10E069;
	Fri,  7 Jun 2024 16:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CINPQk/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589D510E069
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717776740; x=1749312740;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M5LAXDi+WkJzjaXP9r7EoiCgyb+/LgfO7GcD7zISKcE=;
 b=CINPQk/hAXbdP3Va/IWv5Y9+WklaA2iJ+lwLkP2x3Ozt09ObQnY1C/lj
 vC35sB/M53TbaTlhT48HrCx7kFBO7anBYm3tLz1hDWPwEWCPhHQaxThS9
 P2qpKG3Y2pEi/LsfRDgzLrODbaeR/AqYT7rAz31/Gii/Yzo1BG0jLhTko
 MAm70+0pS8LLr+hNt+RXIDuFVeWlJAF9MziLyw96Sed1+HF2wFjnOXhGN
 dJdQAGiWNl93obGACUqLWytNOe58EOSQDzVahiCtMdv/JsX7sgpIACYkb
 npgdU3HPZj73hlf6Qewl+IcSzP+hTxNcbjogzfXSBOn+Lg5IKDWUFF4Lm g==;
X-CSE-ConnectionGUID: KLaBhEVVS+ydA3R9BFUzAw==
X-CSE-MsgGUID: fVKCUASbQ7WgE9U+vSFXVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25908942"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25908942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 09:12:19 -0700
X-CSE-ConnectionGUID: Hb3NEc4hSI2/Fvm+7s8VvA==
X-CSE-MsgGUID: Ym4F+nYJTm2kkD4+mIgT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38813391"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 09:12:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 09:12:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 09:12:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 09:12:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 09:12:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9M6bPY3UbIAfKH3v1H2nJ+fdb5j2hyygMj1zrM9hIloEiiSYCSAISdPYLXrfFKcBE+3kRbU2pzAl4nknwmx+5gCsXxy1s33mMkkrt5T5YkzS8NHBRE8WSid4No1Zz6MCqa+53d1TWelxcgJqVFAkDHHbQ8IdKTN/3p7llzaVGUsxD5OHSD8mK+wlMsG6L6OGcoonJUe1U9TKMjPbxTjhn94qOF9UQtvKTb5Zs2x4BA5Fljwa6cZPBBWyyxNH1LlLh5NTbNQkHaITyco9OmxV88fmALN7ttmxGms1bqw3lhaS/0gjpf7imXDl18NQVteCG1eADIlUX9w5T2g0nPFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEmmj6OghPXObWKr4YCGGgK6DwqhwzhQFHw1bN1s5Yk=;
 b=EjLuSLMoYJ5Dd/P+U6LLE1//rzevv1w9yw2Wlsnt3Zo+U39vlnNe8D1QN0WTQ8Bb+m31i5Olk33hEY8+WiRfy0qEiKTXFRVM1Wvgr609eQO/FooR0BiZG7P31r1QYFK+hXxQFa+yEMQAr+IVD9brGJfOtIUheqeu0EyEx00yvpMRLM15Dg4X/XN7+OW5yduKoUW7BZhpLknGSw6eX+aEa0HthsH8twmBgTkw8SY0ddnD38NpAg7kXvEAZHKUEcE2Qw5oCWYdwxg61Hc17r+TTAQpVJxXjpI7HKzXBL4fih+Gf/Z8RBEHsMMEc2CY6BgIKWwwKn6AGw4XKCGbUpgr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Fri, 7 Jun
 2024 16:11:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 16:11:56 +0000
Date: Fri, 7 Jun 2024 12:11:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 drm/xe: Cleanup force wake registers bit definitions
Message-ID: <ZmMxSimFbf3_jbj4@intel.com>
References: <20240606085720.1327152-1-himal.prasad.ghimiray@intel.com>
 <171768830690.23043.18234551658985499446@a6498e030952>
 <2fcaa48e-8cca-41a2-9494-ea59abf4fba4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2fcaa48e-8cca-41a2-9494-ea59abf4fba4@intel.com>
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 202ae713-5b82-4862-fdf0-08dc870c8d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ccqauTw2JH/T8RhuNN6+59TTt2ymagAiCkoU5AIQ+v8L+1j1ypMdpMYuK0JF?=
 =?us-ascii?Q?TlXe5YuiIVolAjRaGoSHH8f4ZvFNdhsBom3KdEGzKM+lETpja7RUlIebBgGA?=
 =?us-ascii?Q?jywZevChqfBPpL5ouduq0Fg725G6x9bDKzl6mFeDyUT5kjinTJSCKVOsSEm0?=
 =?us-ascii?Q?XuayKXF/d1oytOXUiFVBFKI/FwGatbZfD3R1n1KfJvW9GjAsIeQ1n4i4CmVK?=
 =?us-ascii?Q?t/GDxoDtbDcHsZa42VLUqbOlY6HxuKBnY7pSdpdCP83tcF2QGcR/8l1gdKte?=
 =?us-ascii?Q?CKHKF+nyxvw+rpFkrlMHYulCXNz4I5Mh/UfxGaTwwrPLVvUWpI+tIUDqQDm2?=
 =?us-ascii?Q?oUMQIi39gFRfWuILKenrU4y14Tht7+ZgTWLn4wNoQ0Uo9W0ZltlYQqg2nVdE?=
 =?us-ascii?Q?xEfKEe61QQZeglUDyaKM5sP1ZWqR60SX7vp3jv1utLPiqi7ldxUmCmSKCpUx?=
 =?us-ascii?Q?313NPCcenMeXLq55N88wb4UXwt9DHGBgU4hCheGRJSqeFCg0XeZGXw5f4onJ?=
 =?us-ascii?Q?EGQpDQ5m+CBpkcXcuINZyihv7DmYHGUKCRvUaAoNK+bIooa4XgJ4gJ8kgDwK?=
 =?us-ascii?Q?M5F9YvDuLP/diPyBjBGT4QV08Ri+EqcNUWy7w+X22uP/Cx/lcc/cA6+pmw+z?=
 =?us-ascii?Q?ueANYE4ojmxIfnAVsoyTJjNBzqI0aLf9xGNTJBLyT5M2pAAzM4/vKBdcJxhe?=
 =?us-ascii?Q?z312tSPBkE+a4AAu43k9yZgVPtTsAO8DYQaPmo7v0a6TyxtrfYYrmNJKpZrE?=
 =?us-ascii?Q?fx3AKkmM9Fk98kb4MfoqhUZIww05h7JI6OJL8aO4wdGPwsYI6VKQScAXRhkn?=
 =?us-ascii?Q?JL8kALjDZ2xPdI/yNn2kwbcPvk+/huwW6O/g0J8U6zED+3UCR7y14eMrGYPL?=
 =?us-ascii?Q?J5abyOLr5/DfBnzW8Wo0xXBByv2IH/A3J7XCAjzDalq99lkLvDKQlld9FqLU?=
 =?us-ascii?Q?BOqc9M8xtRaNGtVomzXNgNwYn7gfVgBQ2Gu67JuHj2LzHRnhGwe92VcciT2P?=
 =?us-ascii?Q?8cngF6en9yDErEJIdmoKBE0WagBJLIMffmQm0z9Q279HtXYasdlpLpuO0sGP?=
 =?us-ascii?Q?1FkbcyyiABPm4/wOaI55AyAluBHM6ONY9b/qzU6MfApEz3ne+xXupQkgfzAI?=
 =?us-ascii?Q?48qLMyEiufA+dvubrcIKR6dajlyQtHY+t+CVu0bMW0yjkpsoj0LYbie5b2cQ?=
 =?us-ascii?Q?ousw6Szpo+h75Mj9X0VLNCmZKSMIdHww6lUrMTcP6NQnZq39eDiKBIivMMIO?=
 =?us-ascii?Q?PUY3lLSGWSuLUOOTFAMoKSaTqB8XAqKb2VkOB3mWwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bCw5yTqtg4Q0esFJKid8Z09ZWa0kszGZIyQ/5kKpjLzR1U/pN2vT6PYwtttY?=
 =?us-ascii?Q?mr751Ihub7huhl1egMaA7dVkuQ1gfoiYqEcIwDrOsIBcOvQIKDjZXaiKYnH7?=
 =?us-ascii?Q?T6d+rn29hh209fCTsk1ywolSNXQtgMAWgxsu0Ng4GygLXisVb65rj4m0zeyF?=
 =?us-ascii?Q?P8kwnLyB0pRhbvBE+KVVexRKndm3rXTa0J1p3YquepngceWBH9iaWVAni1rs?=
 =?us-ascii?Q?Piubzb7hAnd87/vnVNKAWLzyHH/zQ8fuaRLXMVQr82REbnFVptVlQ1QHb6Hg?=
 =?us-ascii?Q?RlfYV1p6iruQh9YWa7kjwaF3UEexktQ//kSHmbHlW7r8+2/e5GkMQbeZYRru?=
 =?us-ascii?Q?B1OWa/slSHFfiJudRRmwWyWM+1/MJ6vfvAQHJ/Yg0rrz4bHd1nMExSRAffZA?=
 =?us-ascii?Q?djEo2WBakF9vGpPcKncOnkNsg3v6iuaZF+7A7/Biter8B67yjgpbNiNj5McE?=
 =?us-ascii?Q?WQA+nBQ9LIKH9ec/IStJVvbTubacQWQ1+BOBdGz9S5bPxDsXev5V9SiOGsh6?=
 =?us-ascii?Q?4Q77RbjblqazvPXRmjpLroP7uIYXDk8P3e29RJ/dP085Za0HIjKWyTtf3qVn?=
 =?us-ascii?Q?joOGKBQDjummO/tlD9X4R5sHfJkh4APf/I0Gt5VRC5eXLV2plzpOK+d59KQ8?=
 =?us-ascii?Q?o/lx7dxwr69xM7n3LjwinMSh1PNdECvbDUgEjjoY6C1gWuUYy+pwDcmfkio9?=
 =?us-ascii?Q?jNMn6Wkirm7ZBXkgERj0B13n6sD7TWGa0CULnU+AFi6PH6UCcXSu4Q9SKLgU?=
 =?us-ascii?Q?67fzkw3LHiuTUe+EN+tCN3jn4AySbbdishLh7Xwp/v7KVJqcdovJIZFAVxsr?=
 =?us-ascii?Q?Ual3ZVCFCAp45q2ECoIbonB+qerwU4OkX/2jFFtZ6++llM9AXPn9TOFDR462?=
 =?us-ascii?Q?gY998pZphaxRF2lQ11SpL6YjCQ9CjNQRRDLbgno+ykrfeDqFTj9pcwmQ+FD+?=
 =?us-ascii?Q?is+LeDeY6TKS7CJAgqKofYXN7eyfKGDXFAFIvQBswpnxVbJ+eZ4N4Rdqut7U?=
 =?us-ascii?Q?eiGlE9ro2lI4gUsss/g4XOalLCWeoEQ54BAPZhqHCAPAFGp/uPdN6213+IXU?=
 =?us-ascii?Q?/71bKuVB+fNAGe5SRwV8Z0GlYv9hwpRmlNnnr9liHSL21expj+XoIKGP5Rjm?=
 =?us-ascii?Q?EVL6dqqEJPbSlcbbsfO5GO9xo1DCj638VJoRU6yqy2aIihYo2l/GDIjzVMxT?=
 =?us-ascii?Q?JMRvK1MpiBfjMjmCi+j0VSAYVDB4I1IrTPLe77imiklq+7Sh6zKwWCAYedhN?=
 =?us-ascii?Q?b+h0Gc2cP/xJH8DqvR+iJR7gayDEMoGIhNFtuK55d76m1EFF56IivZAmjZLT?=
 =?us-ascii?Q?+quivTyn8pO3yMj53NcJj6CtTPbA3Dc+87NPq+UD3vYYNQIg0UxLVPwsoROk?=
 =?us-ascii?Q?q3Z8OYr05m5vewS0Hy5U+Fimto1D1WIsxI2w6UchRig4mEOcskujp3ML3ntK?=
 =?us-ascii?Q?3WkFyPju3N5zw/pLa7Zz4+NhRV2bsM5hlrh/Oc+sXODqADRiSPUHp0ciKtTr?=
 =?us-ascii?Q?UK9sn+tbOQ1jnJLZzct++C+qCwDXij0ne1h1IneXdZU5P4HpgHAArE04Rbzd?=
 =?us-ascii?Q?IXtZ9clOoxJullRkOXOIUdbh3nauqGoxcS/3YWOp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 202ae713-5b82-4862-fdf0-08dc870c8d73
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 16:11:56.5083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yVGQ/ozySpA4EN+QbYeYyC6/aAqLHkuyPLQu00JIEiO2N0Na6hRdPQoOvLyWNcwWlHAJNo1oK27XSx1xxSwjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

On Fri, Jun 07, 2024 at 06:14:21PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-06-2024 21:08, Patchwork wrote:
> > *Patch Details*
> > *Series:*	drm/xe: Cleanup force wake registers bit definitions
> > *URL:*	https://patchwork.freedesktop.org/series/134543/
> > <https://patchwork.freedesktop.org/series/134543/>
> > *State:*	failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/index.html
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/index.html>
> > 
> > 
> >   CI Bug Log - changes from
> >   xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9_full ->
> >   xe-pw-134543v1_full
> > 
> > 
> >     Summary
> > 
> > *WARNING*
> > 
> > Minor unknown changes coming with xe-pw-134543v1_full need to be verified
> > manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-134543v1_full, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > 
> >     Participating hosts (3 -> 3)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in
> > xe-pw-134543v1_full:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@kms_vblank@ts-continuation-dpms-suspend:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html> +2 other tests dmesg-warn
> >   *
> > 
> >     igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
> > 
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html>
> > 
> > 
> >         Suppressed
> > 
> > The following results come from untrusted machines, tests, or statuses.
> > They do not affect the overall result.
> > 
> >   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
> >       o {shard-lnl}: NOTRUN -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html> +1 other test dmesg-warn
> 
> Failures are not related to patch.

agreed and pushed the patch to drm-xe-next

> 
> > 
> > 
> >     Known issues
> > 
> > Here are the changes found in xe-pw-134543v1_full that come from known
> > issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >   *
> > 
> >     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>)
> >   *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
> >   *
> > 
> >     igt@kms_async_flips@crc:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@kms_async_flips@crc.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@kms_async_flips@crc.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-fail
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
> >   *
> > 
> >     igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
> >   *
> > 
> >     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +2 other tests dmesg-warn
> >   *
> > 
> >     igt@kms_cursor_legacy@forked-move@pipe-b:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-b.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +1 other test dmesg-warn
> >   *
> > 
> >     igt@kms_flip@flip-vs-suspend@b-dp4:
> > 
> >       o shard-dg2-set2: NOTRUN -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
> >   *
> > 
> >     igt@kms_hdr@invalid-hdr:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-463/igt@kms_hdr@invalid-hdr.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
> >   *
> > 
> >     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
> >   *
> > 
> >     igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
> >   *
> > 
> >     igt@kms_psr@fbc-psr2-primary-page-flip:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_psr@fbc-psr2-primary-page-flip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
> >   *
> > 
> >     igt@kms_tiled_display@basic-test-pattern:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
> >   *
> > 
> >     igt@kms_universal_plane@cursor-fb-leak:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> / Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> / Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
> >   *
> > 
> >     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
> >   *
> > 
> >     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1 other test fail
> >   *
> > 
> >     igt@xe_evict@evict-beng-cm-threads-large:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
> >   *
> > 
> >     igt@xe_evict@evict-beng-threads-large:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
> >   *
> > 
> >     igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1 other test skip
> >   *
> > 
> >     igt@xe_gt_freq@freq_fixed_exec:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-464/igt@xe_gt_freq@freq_fixed_exec.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-436/igt@xe_gt_freq@freq_fixed_exec.html> (Intel XE#1414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414>)
> >   *
> > 
> >     igt@xe_pm@s2idle-basic-exec:
> > 
> >       o shard-adlp: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924>)
> > 
> > 
> >         Possible fixes
> > 
> >   *
> > 
> >     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html>
> >   *
> > 
> >     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html> +8 other tests pass
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html>
> >   *
> > 
> >     igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html>
> >   *
> > 
> >     igt@kms_flip@flip-vs-suspend@a-dp4:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-dp4.html>
> >   *
> > 
> >     igt@xe_dma_buf_sync@export-dma-buf-once:
> > 
> >       o {shard-lnl}: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-lnl-5/igt@xe_dma_buf_sync@export-dma-buf-once.html>
> >   *
> > 
> >     igt@xe_evict@evict-beng-mixed-threads-large:
> > 
> >       o shard-dg2-set2: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html>
> >   *
> > 
> >     igt@xe_evict@evict-threads-large:
> > 
> >       o shard-dg2-set2: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-435/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html>
> >   *
> > 
> >     igt@xe_gt_freq@freq_fixed_exec:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html> (Intel XE#1414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html>
> >   *
> > 
> >     igt@xe_gt_freq@freq_fixed_idle:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-435/igt@xe_gt_freq@freq_fixed_idle.html>
> >   *
> > 
> >     igt@xe_gt_freq@freq_low_max:
> > 
> >       o {shard-lnl}: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-lnl-5/igt@xe_gt_freq@freq_low_max.html> (Intel XE#1045 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-lnl-3/igt@xe_gt_freq@freq_low_max.html>
> >   *
> > 
> >     igt@xe_live_ktest@xe_bo:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-8/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@xe_live_ktest@xe_bo.html>
> >   *
> > 
> >     igt@xe_pm@s4-vm-bind-prefetch:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html> +1 other test pass
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html> (Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +23 other tests skip
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> > 
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-addfb:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4 other tests skip
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other tests skip
> >   *
> > 
> >     igt@kms_big_joiner@invalid-modeset:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
> >   *
> > 
> >     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests skip
> >   *
> > 
> >     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
> >   *
> > 
> >     igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html> (Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
> >   *
> > 
> >     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
> >   *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41 other tests skip
> >   *
> > 
> >     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +15 other tests skip
> >   *
> > 
> >     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +55 other tests skip
> >   *
> > 
> >     igt@kms_cdclk@mode-transition@pipe-c-dp-4:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3 other tests skip
> >   *
> > 
> >     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
> >   *
> > 
> >     igt@kms_chamelium_color@ctm-limited-range:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2 other tests skip
> >   *
> > 
> >     igt@kms_chamelium_frames@dp-crc-fast:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-fast.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8 other tests skip
> >   *
> > 
> >     igt@kms_chamelium_frames@hdmi-crc-fast:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-fast.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5 other tests skip
> >   *
> > 
> >     igt@kms_content_protection@lic-type-1:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_content_protection@lic-type-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_content_protection@lic-type-1.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +12 other tests skip
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-dpms:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cursor_crc@cursor-dpms.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +2 other tests dmesg-warn
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-onscreen-512x170:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-sliding-max-size:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +11 other tests skip
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
> > 
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html> (Intel XE#2028 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>)
> >   *
> > 
> >     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +6 other tests dmesg-warn
> >   *
> > 
> >     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
> >   *
> > 
> >     igt@kms_feature_discovery@chamelium:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_feature_discovery@chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html> (Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
> >   *
> > 
> >     igt@kms_flip@flip-vs-suspend-interruptible:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
> >   *
> > 
> >     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +1 other test dmesg-warn
> >   *
> > 
> >     igt@kms_force_connector_basic@prune-stale-modes:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-suspend:
> > 
> >       o shard-adlp: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#1191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#2034 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +20 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +20 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-1p-rte:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-rte.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-rte.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +20 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +21 other tests skip
> >   *
> > 
> >     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
> >   *
> > 
> >     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1 other test skip
> >   *
> > 
> >     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2 other tests skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +2 other tests skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +5 other tests skip
> >   *
> > 
> >     igt@kms_pm_backlight@bad-brightness:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
> >   *
> > 
> >     igt@kms_pm_dc@deep-pkgc:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
> >   *
> > 
> >     igt@kms_psr2_su@page_flip-p010:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
> >   *
> > 
> >     igt@kms_psr@fbc-psr2-suspend:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +12 other tests skip
> >   *
> > 
> >     igt@kms_psr@psr2-basic:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_psr@psr2-basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_psr@psr2-basic.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +14 other tests skip
> >   *
> > 
> >     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#1149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#1149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
> >   *
> > 
> >     igt@kms_rotation_crc@primary-rotation-270:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other test skip
> >   *
> > 
> >     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
> >   *
> > 
> >     igt@kms_tv_load_detect@load-detect:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
> >   *
> > 
> >     igt@kms_writeback@writeback-invalid-parameters:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
> >   *
> > 
> >     igt@kms_writeback@writeback-pixel-formats:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
> >   *
> > 
> >     igt@sriov_basic@bind-unbind-vf:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@sriov_basic@bind-unbind-vf.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
> >   *
> > 
> >     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
> >   *
> > 
> >     igt@xe_exec_fault_mode@once-basic:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_exec_fault_mode@once-basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_exec_fault_mode@once-basic.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19 other tests skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19 other tests skip
> >   *
> > 
> >     igt@xe_media_fill@media-fill:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_media_fill@media-fill.html> (Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@xe_media_fill@media-fill.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
> >   *
> > 
> >     igt@xe_mmap@small-bar:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_mmap@small-bar.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
> >   *
> > 
> >     igt@xe_pat@pat-index-xelpg:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
> >   *
> > 
> >     igt@xe_pm@d3cold-basic-exec:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
> >   *
> > 
> >     igt@xe_pm@s3-vm-bind-unbind-all:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1941 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1941 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>)
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-4/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
> >   *
> > 
> >     igt@xe_pm@s4-multiple-execs:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
> >   *
> > 
> >     igt@xe_pm_residency@gt-c6-freeze:
> > 
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1349 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349>)
> >   *
> > 
> >     igt@xe_query@multigpu-query-gt-list:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
> >   *
> > 
> >     igt@xe_query@multigpu-query-uc-fw-version-huc:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3 other tests skip
> >   *
> > 
> >     igt@xe_wedged@basic-wedged:
> > 
> >       o shard-dg2-set2: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_wedged@basic-wedged.html> (Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_wedged@basic-wedged.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
> > 
> > {name}: This element is suppressed. This means it is ignored when computing
> > the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> > 
> >     Build changes
> > 
> >   * Linux: xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9 ->
> >     xe-pw-134543v1
> > 
> > IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9:
> > ec3e566521b91eb773769fa1df899a28063a10e9
> > xe-pw-134543v1: 134543v1
> > 
