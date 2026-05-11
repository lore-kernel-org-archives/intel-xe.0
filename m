Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7933ECD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 20:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A6810E89E;
	Mon, 11 May 2026 20:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEidzbi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D5710E8D3
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 20:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778531645; x=1810067645;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qRr8IOwoDg3IIOYQc0fcQ3a38zSO8z/xD1H7KExB/l4=;
 b=bEidzbi5891f8dk5KpmbNGVYwK/8KBrIQI+Jt6HAWc7tnHq6H1XjoD69
 zTc1K4rPYEP0hkTHI+XX67RUI0DcpdHMicY+Wmh/i4A55Vr/Dg53luSMA
 HiuithmXKNyWWPQEjJ/bCIanl7ORifvbVmSflFjfZj6z0Lm7EPBc4S5IY
 j0qkqeKBm0nIgMrbQ4Ss04Wehq3bYsktoA6r2sT8kMLp121FNSD4GUssF
 0dGvj5dLaEBaxS6nj4oykSK7hD3A+dvHQLgBn1cPouCseLh6kjAtD+NrY
 7zoP0oNxrzgY/KlZxWmsrBz4bs9KlgBMCp/f97Z5yLTcemhwLl4H1GkEC g==;
X-CSE-ConnectionGUID: OXlk0QW7TGelaNcK64ZlIA==
X-CSE-MsgGUID: Jdu2KpCvRW2LATofz9JgZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="96997889"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="96997889"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 13:34:05 -0700
X-CSE-ConnectionGUID: OJxFFjU3RImniP0u5EiC+Q==
X-CSE-MsgGUID: F/UhiQxITYqvEpeRoCMD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="237787545"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 13:34:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 13:34:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 13:34:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 13:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZDXhRaUEq27uSbXPY6upk3sdQDk3gOoVNCYEmTDb39AOMGdGL4CjNBtM0Hv/QCDkJwse/LZGXxzw8IBr8BvQ92mk/6Ao1+YdJ4qXoujN/1vqxDtc1fvMVF5WiFAd/pmpREivDeIGppmYcZSADWqLdF2O5nXyrSb17n9wRjHj4ScW7h6/kR9VGVDMDWTcAEAlVAcdp4q4nm/pIhpf4n6GfOOumG7ymNaBi3XniR1ErJSh5QIUHPkUmCiHHkr62Yr2PU+RrwcfRs5wXHnMZHRmAQZChMK+Ecl+/XGiHT4FSD96sIhbO/r5ghAvySgQ04VdkcoDNX8CXIY7AjUAD/G6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir5W175zdxR11UHuadYBKDco02z6FjWlhbXUWPq2bO8=;
 b=Yf30jtEpfzeHcDSDCxeHL8kd0qMK+yXCJxoyW3iBTJARlBqdKjpnCJTeKfzzT2Et96wT1WUkF9XRDrWyiyVoEY0Q6SDg8U+J1iJi92q5Y5UIv1graEoEXgXydPvUB5tpmzrjPZbO9cBPnQSae8o9p/xOP9oBhc8rvWMsNRKnJ+TLuQuWETnx7Es51JrXNxO79NnjyAYv7POAtQ+crwpr52wJjO6TUGxOAIB9yZvNmvp/38kj3AgTS0gRm+pOnoE1Kfl0O4G1cSKy8bEu6kxUCm+VMwGdAE8ziqtrKEGsOKD2euWl/sERvbUAX40q1IKcEIlraQI4qwJ7fXTngM6npw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 20:34:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 20:33:59 +0000
Date: Mon, 11 May 2026 16:33:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
Message-ID: <agI9Mejxoj5VBRtR@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
 <c4e5c9ed6e931ef2d5ba5b87b7be549c8615f7c0@intel.com>
 <871pfirwy7.fsf@intel.com>
 <619ba2cfdac33128f92c4f83b8573770146cead8@intel.com>
 <87qzniqgau.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87qzniqgau.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a81169a-2c4b-4517-8104-08deaf9ca16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qGm3nCRXYU/wgEvdJqKvVSaSARIY/se+BwZg5eMoXRPeu6j8d7aaYoE1ADKnDCFcCoHfvVFDunpOVQ3PcrrHJDIezOfMokvxlDMtZ3FgXTTgmP7tYL2Rhl5jy6MxwkFaV8C+S4zq6I/3LS6qHW6BmjOFZZ9fb4YZAQdT4opO0RRc0Fg6kVIfnLXKyYFQILcIArVWQlVGakdiIa+XKD5ExZVH+/J/LnqEPQEHoDiaeh45GL2//qaB67I3LRkxgK7LqMVt0Bd2EtkAkdyDfI3QfR9bJfGIee6iTvAeQACmtT1fvDckUycjNlUhy/AA1pv8pVkmYefHmOnUJ+yLLqnM3ZR9SXgM0nFq/tVTwQ+yh+0aTNjMy8NqsXqEhH/PZ0Iz/1Hctty5JKaC7+PGEPChptE8+QVCOEIyDh2CM9ko5Vn9JOrg8dX1eSERxiu/ljubYb6xB8BMhrohBsNnHB1aS9SNgLNM6Vxv3ACuPBWJcyC15jszw/sdakOhowQEdB+2MIwwz7jnC0T3Dq6bVPLm5ciKyYd6UWSlKxKwScKdVjg1bNsQGx4o9y8c43naS3vRs/44li1b2LZHjCIYEoVxU2VuHOYQie4UQ62lbRZXO8MYp4Byos8btrIXA94QlJHoOYdnjo0bW6iX7mEX8s92aQsz+crbVS1QxBi1v+5lpEul2nN+iE/TiWgrvS0ByHQr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uo5/Oqi4N2F9vJlGQTVEd3GxNRrA0axa5TstQ5T7JEDWozeD7o2M5zao763f?=
 =?us-ascii?Q?DRCb5rDy+ol/TY6Tj2P6ayoRSKtASdp16I75w8hCSseDIK0CZ88LWj9Y5zx6?=
 =?us-ascii?Q?B1UAaTOgGykZn1Mro2hiJxxGniK+ufdGITAUtsElarUH3qo5A3+lzYwmAdR8?=
 =?us-ascii?Q?GLwFZkNFvJZ6XsvpN3bcwbEecl8aeM4HbNfFUf/qV+GJd/v0rwJ0kXKCnui2?=
 =?us-ascii?Q?DP7mfRkjYaIWZeSnQihvkLe/RokU5aUqtXA8qhO5GEV8axPpYgavdJ9IoYMC?=
 =?us-ascii?Q?8UpBUjN72GxeXn1c6WuP5Fk3XSmh/t9bmI4Kukcht0dpmRYZBIAftdDCxOTW?=
 =?us-ascii?Q?2CmjhBj7DjMvUxz2GR36RoG7m2VBGNRZjoNrHB9zFuiO2+yjd3VlQgWmgWEo?=
 =?us-ascii?Q?lX86TUQtpnLtZWV38zg6BdZKxQiaqUqqBAB+yBbNfrLI0PLlSnFOu1PWdqfI?=
 =?us-ascii?Q?yGAnYIGpZNE1V70CIzwPXrLeSNpph8xbzOgoOlK9sNwVo8skM15uCsmWCyXN?=
 =?us-ascii?Q?4IuV8V2mYS3pkTaOIVtUYIQ5XO5J3GlgZcqzQMFJ5QrDyIQAVM+ed0eQL2Kg?=
 =?us-ascii?Q?141qeTYRBKhfw3kyGqw3KC4QfcWWJvRnimpldJxXD8QIbdcyrjmVQAc7u53R?=
 =?us-ascii?Q?UhnoVbnnOtoVCYf2YXo4Z6NJpXIon5Uob1ddiAzWZafVUAWoRJEvhtAe7q8/?=
 =?us-ascii?Q?mDuYakV8DK/vRczgRbxeuUshfyxOzfTXJaOoO8PICB+CV/VC2pBUZrMmrfa6?=
 =?us-ascii?Q?hMHPAlZvYPryzlCc6XHgEP0Hn5Rr3LeKMzeSJP05L0Efem/VXO7491Fcrawn?=
 =?us-ascii?Q?ChNpeoidlFsF5/xF8Rmy16WvjI9RSADDAmo+fM/ryVr6UcQ/4u3N0Wme/T96?=
 =?us-ascii?Q?XscXMAjTmsmBBs+AOm/xz+3u7X9StgPhXgcDyOpWNQdfo/5hZ1TGRcpD91w8?=
 =?us-ascii?Q?+Bp6DtSY76psfdcqzNEQVxCYBmlMj8I2Kqm1TKIcUGG4ffVtHXKDXlIe1WYA?=
 =?us-ascii?Q?0DGh93f8hqW5SN8gU9xU72Vp0MD0kgdl9ZIHBAMQmzLpI9oHl/Qhur8OFxGy?=
 =?us-ascii?Q?G5L+kd9ey78Nfzf1olvrmWcq/G7trlRhJmclXLe1Xs2Q5GoLCyjJeBgDCfC2?=
 =?us-ascii?Q?TfVSAbhhpMUDn0Sksb48Ru8zFbrIXk3ldSfFq/GSFzpTZN9Y/AA/JmdOxWX9?=
 =?us-ascii?Q?J65+/PPXeXfGTxpVnppxWEGOnoXl/gW8qbgOnLAVFEJGrXyyNmkPCj36X3qB?=
 =?us-ascii?Q?sgAOEmm9rMjb5L0HebnkVejHlq/6BWDjAlEzD+VqbSLNYX3ljoxGisNwM0rR?=
 =?us-ascii?Q?02esANvN9eg5L0G9izZd0m7LIGfd/Cn1iAUUdXiang2AgJr7BIIyQTfHwWd+?=
 =?us-ascii?Q?Gkf6COFJxcyrjQ7cNq5HdZUy+cY9xSdYj5sLNc4iBeWLSi3G6V0+cb69At8B?=
 =?us-ascii?Q?JPMthX7+j8CRAi5pjt0+/IoDy3neOUJgYaaYd8KvULNteHYX4xSSwupW0ilc?=
 =?us-ascii?Q?UZoxJZKKPey8fUAmxF/8KAPAKuQZkmu8TJOgvsm3GtZBwIJzE+wVJSERt93P?=
 =?us-ascii?Q?r7lSsWKWGikzIu8nVNKTt5RUdIi9PZVPcLXU1eTV4CmBF9BxNwGYrHf065Qc?=
 =?us-ascii?Q?X1SsI74Qdom+PPKcoAzRR1nusTt3Oln91FIn1KKy5ht3rcAXWX/lJKOu+YgZ?=
 =?us-ascii?Q?6HD9NHEf4kv2i6Fjf05VeL0I8NgkYuVwvMlzL5FnSspfk2koszdxdNuAiZcV?=
 =?us-ascii?Q?6U1UBtFB0A=3D=3D?=
X-Exchange-RoutingPolicyChecked: mJguSseJN5SnYs8l6snO0vODTxUTofJjdCxsW7eXpNdlxB7JdpR7OukEOMOX0+Ul5Q1rMsFjGmd2ikhnAs40/yZ6yDxl2YK0UK27Wg1GLlPMaSTF1s8MBx95NBgQvrDuMMnJBggaydTLGqGzCGavexU+VZieCQ8wkkwFeeBdZvWHpyGS5SG/VkgLzu/FyT/u+l/5yAU4XtyB79N9v1BScDrXJHMekZN8dmrc8HlE9bzZP0r4tgpvrk4en2nI9/SRhtwCvxJhyhqWcDIfRTpL8jcAplCFpQ+B3iaEk4ElnC6BWIVenqa8gGv+3/yChkQs3Hj8k+gf90kwzm7EB6Vpcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a81169a-2c4b-4517-8104-08deaf9ca16b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 20:33:59.4724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fn9VokHOZDZXjK/ghdcT7qfbDr8t8EMRpSPIKip85vqjLAi7yqdKiIh7XBHNfftjOKAXgeshPPwBM+qiMO1/LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
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

On Mon, May 11, 2026 at 09:30:49AM -0300, Gustavo Sousa wrote:
> Jani Nikula <jani.nikula@linux.intel.com> writes:
> 
> > On Mon, 11 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> >> Jani Nikula <jani.nikula@linux.intel.com> writes:
> >>
> >>> On Fri, 08 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> >>>> +/**
> >>>> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
> >>>> + * @test: the &kunit test
> >>>> + *
> >>>> + * Return: True for a live test and false otherwise.
> >>>> + */
> >>>
> >>> Pardon me for being blunt, but I think this is the worst kind of
> >>> kernel-doc comment.
> >>
> >> I appreciate the bluntness! :-)
> >>
> >>>
> >>> It doesn't provide any additional information to what the function name
> >>> and signature already convey (which is to say excellent job on naming
> >>> the function), but it fails to explain what "live test" means.
> >>
> >> I kind of just added this kernel-doc to fill a hole for "consistency",
> >> but, yeah, it does not provide any new info.
> >>
> >>>
> >>> The extra bits of useful information people might need after seeing the
> >>> function xe_kunit_helper_is_live_test() in code are: What is a live
> >>> test, and what is it if it's not live? Dead?
> >>
> >> Zombie? ;-)
> >>
> >> Joking apart, I personally tend to use "regular" to refer to non-live
> >> tests. I do agree we are missing some documentation on the subject.  I'm
> >> not sure though this function should be the place to do it.  I think we
> >> would be better off with a "DOC:" section for that (and also explain
> >> other bits in there).  I think it would be sensible to rename
> >> xe_kunit_helpers.c to simply xe_kunit.c and add such a section.
> >>
> >> With that in place, this function would be kind of self-explanatory,
> >> right? Is this a case we just drop the kernel-doc?
> >>
> >> Or should we try to be consistent on "every public function should have
> >> a kernel-doc"?  Is that even a rule or am I imagining things? :-)
> >
> > I believe xe maintainership leans more towards requiring kernel-doc
> > comments than we do with i915 or display. I think the hard requirement
> > leads to a lot of unnecessary boilerplate, more geared towards filling
> > the requirement than being informative and helpful.
> >
> > Personally, I value overview DOC: comments much more than kernel-doc
> > comments. If I were to add any hard requirement for documentation, it
> > would be for DOC: comments for each .c file.
> >
> > Bottom line, for xe, ask for xe maintainer opinion.
> 
> Cc:Xe maintainers, in case they want to chime in.

I'm definitely the one to be blamed by requesting docs to every
'public' function in Xe. :)

In my view this forces developer to see the .c,.h pair as a 'component'
with specific entry points and a reason to exist, rather than some
architecture like i915 where .c/.h pairs were only created when some file
was 'too big'. With the component in mind it is easier to identify when
something is abusing the interface and accessing specific internal
types directly rather than having a function entry point to handle it.

But well, the 'Doc: ' is actually part fundamental in this component.
We should definitely have a 'Doc: ' as well that justifies and give
reasoning to the component.

That said, in this patch here specifically I agree with Jani. We are
missing the 'Doc: with the reasoning for the component, and the
'public' function documentation could be bringing more useful information
like Jani pointed out, instead of just stating twice the return value.

Thanks,
Rodrigo.

> 
> --
> Gustavo Sousa
> 
> >
> >
> > BR,
> > Jani.
> >
> >>
> >> --
> >> Gustavo Sousa
> >>
> >>>
> >>>
> >>> BR,
> >>> Jani.
> >>>
> >>>> +bool xe_kunit_helper_is_live_test(struct kunit *test)
> >>>> +{
> >>>> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
> >>>> +	return false;
> >>>> +}
> >>>
> >>> -- 
> >>> Jani Nikula, Intel
> >
> > -- 
> > Jani Nikula, Intel
