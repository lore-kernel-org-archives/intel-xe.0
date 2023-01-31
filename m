Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF4FC38142
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 15:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8FB10E032;
	Tue, 31 Jan 2023 15:31:29 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C49610E032
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 15:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675179087; x=1706715087;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ciubh3/FhxVNJaYF8imIxWugNkyybFIcoxYVfKpqF1s=;
 b=D5BBj8zpY1u04U2fNjpnDh2JMQsno+b4arJUPmZKOhVwa0iWTfvkX+eL
 YvDUjHnCmKikXp9s+W6u/CILTDx9ge9iKC15DTPNXgB/sYkcvKdd3B4CN
 n2gxSYAD9HY3LJfwiN/D4TEnxuOp/rChnKltPQmL3UzIkPMdJCK369mVW
 22OrXImJ2GA2LjMggFs0Hgu0eW8yFnBFlQkcR4tl4xO4t8XLpLKBk7rGL
 JekJtqTlfax8jblF6DEyEdpKYxe8Qi8kHJp2rauquQzJ+aOv5NhM8Viaj
 mMQVLH55cB2pbVwXRZ6MU+EgSMkEz5AcPXVi3shEM9LaVz6bF7lgyRyWQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="390232804"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="390232804"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:31:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="773018826"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="773018826"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2023 07:31:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 07:31:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 07:31:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 07:31:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTgS/yO3udk5IW1uHH9C6G5D2pup0m/zAqEpvXALOXy6B96Cze2OOzK+fGYNRHPJSz2dZhpq6A/nLmn3nxYv8sQTqOUU/7DRVRwIRSLOB+owd0Lsq8YCVKwqPj/x4u7676MNGdt5pNbCMMY/EmTgwtSxDFlq/qtXVq08NZYIeeV6lvvwfCqNoQ9+2e+mLNhHYrOwIPFv2D3DF50jrit5PQDIvGQblajICE05JTDXMgXlUrbSF2V8Ort+fagp5//sDLEOvTFRL/067eRcIruaIMKUFf8Scx56eqLXCOGbIDh3fmQFFcIBkTPwulKXolIWCuPc0sna0hXLiLi9CwusUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh1dOQQ1XfvbxWeLwFE9l+pBMpFQRAzTeCjjcSkifpU=;
 b=Pye8tHKXShXuKQHoyrRYjWGifw9eIdEtuERS35vG3y3vYTLlIO2Ux1WG9djvbJgnz3FWNHeOpsLMpAjlbdqrznv3/bifLCl6D0jeVvRkLBmdZ/ufMMG470/L/ckCmLP+bBt8RZ2/tnSbUB8Do7V0wog9UXQOaR/U1Mk2XFbUovo6pNlZDN6xGTln1/86Sym7Aju8RHbquIC1Ymc/yug45hRBEj+MKF6QDAb/sQoXXTFl6meAAf7IqF1J6HjzEJgbcIcfYp9vMgVYhqGxWl2/LD8rV7nqdLaq5NlpxU4ti/R547UX4lWUxstjsQ4kS56JWjCsGKHJuy81IJJu48mUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 15:31:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%6]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 15:31:19 +0000
Date: Tue, 31 Jan 2023 07:31:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230131153115.j6heuv6ea7um7iwj@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20230130161723.42602-1-jose.souza@intel.com>
 <87o7qf2mll.fsf@intel.com>
 <116ea3da679ea8a34379fb83e8edc6842ae73419.camel@intel.com>
 <87fsbq3inb.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsbq3inb.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2e0f4f-5b51-46a1-4418-08db03a03340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xvw5LFzPDguYW4zjHS80lq1c0Y3LVShrY5r8mEDH+a6NlJWJBTLP/L7K3U5t1XRlxknOJgZiAY6leb32Z6VJDB6CrxmKAqUl3R5xWVazxPOYcp8nQjiM4Es9HYJX5zfdSQ5J2kHVhj+qwFOSZL9z3lCyhrXOE0JfAhVsjlBx5Qhpi3q2+2QkOAMhwg2BTt7EU9CKXVXfskipZgoT3p2BRaeNmKcUeXIXLsH4qTRRLBf5v7rFNHHfImjX5259yaZUbRYO7PprR+JEulqhfInT4Fo7P4sco8/hsETmkuIETt0A4DM9Ch0zmPu5WQWGlxw0nNYW9RMTLnPDkqnzrD0OOLZ/C7wHbXkTE/7FgXHsxZOBzB45RfXlS+/iQtYQexQrLb0E9eUpojWjFk6uYYXnikBCc42D7hXvqfZlw1xvMjX3Yg8ExrSE+VOcbqqICDN/hponeFilim4LzoNSkJ78K4dYNkG7qGLW+dTXdZoCJyMQ8wNtEhZQETVQBjS0hFOiLmX9wnFOIBUfvtjBmUo0tcaRfRaPm3OO/bdyiFqfgTZ3iLTKxetMYXrxex1OMWt2Jx0dMBEmzTJfx0XzHSwnCTYjFI1zUeHCv31WETI3W8HL2GOUV+ov+vosqeJvLS8SFw/owXNwA1Ny+g8vANDMaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(86362001)(6666004)(54906003)(1076003)(316002)(478600001)(6506007)(26005)(6512007)(9686003)(186003)(38100700002)(8936002)(5660300002)(4326008)(66556008)(6916009)(66946007)(66476007)(82960400001)(8676002)(41300700001)(33716001)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5pZAYqELusOoRhCxQYf26D9PnAczU7kOWhMVjgQUejjhue2wtWd3sVF5uG?=
 =?iso-8859-1?Q?mXKZki9s3GTlVr6JncqClQekoyZNeXtYDk1dfBfwQlkjsNYvy2Ngz9uLBK?=
 =?iso-8859-1?Q?eG2WtzCuS5D4ryHsEXl2QKi8vPRhGiqScqSbrf2r1zNNiKtWD1cEJnwG6U?=
 =?iso-8859-1?Q?nPLLfLEaSqtwp+vh9nkYcroJ28WyQMx28yKYopK4xJOTXySYki0WVbwuY3?=
 =?iso-8859-1?Q?vpN6loGk/AdgW69QKTEzrSzzaW4eVY4mocPNdHxJKhq+yQPQnwzA7LvRAX?=
 =?iso-8859-1?Q?x685F+JOiR2SfDsRtoJEOnJfRXLkDwmayWvwLE/bGoRoZ0qxMkkm6Oln9I?=
 =?iso-8859-1?Q?Z3fp+6dzI2km5r7Jls/SSpn/eeP/uGSRTqznLMPfJRUXf5K/P/81S31v7O?=
 =?iso-8859-1?Q?AJvps5QUMq/fKEBV6iYWTvvBH1JhsS8gMLekXK1/1PhU0IuyHSh91vLLJe?=
 =?iso-8859-1?Q?DxZ+zTrt7lJLGOy7PpbeZPj8vB+Frl5jUshZLWOA5nMdnr6xRAxOOAo1Bw?=
 =?iso-8859-1?Q?H0o+jEm4RJhITeKmYRjBNhP3m2kixvoJyCnpZQN+KxAKNTS7es43Mi//Br?=
 =?iso-8859-1?Q?iYX7cPKgkz8NkVlAakiEuhwM5CSGo8SiTgkycf5DbGgy/AYuCArmDK9WBV?=
 =?iso-8859-1?Q?O1fkOSePfMh9TR33yuRXxth+/VwfSRveLcpT9mXJLdLlWo4cCswKhvX2Ow?=
 =?iso-8859-1?Q?/lm7hx4AczVHNirbQSqayWL8zfFykJvqPZHQZ8OaISDa/y7fkQtV3HicAb?=
 =?iso-8859-1?Q?If7C0SOX7US0ojAxZVHzZmmeucQwvKaTUqVtUq5L5L5WL3G1QRnEniL9pQ?=
 =?iso-8859-1?Q?w2/NERPUwVnXs7LT8dOZ47eTFKNmbFpHdaQtwKSkUG4fhWzeljM4fRNwiH?=
 =?iso-8859-1?Q?JKJJbjOw65FYUp4tlC83M28ZixPAbTTBlgp9d9xlY1k8sta5eM0m1eAN16?=
 =?iso-8859-1?Q?tLLB+t0hYN0eHI1WqIegoEOVu2voQio/GIJkRzyJgcHNTs3QE61Roi1gVx?=
 =?iso-8859-1?Q?xGuDO+6gbPpKinTlQ7r1L3a3XtCEAUm+KLbJyg/W8DFWz8ISA+F3h8613O?=
 =?iso-8859-1?Q?H+ucunQX81VSmxR/cb0Fe0gn66HfSxZff0f7IHQLVWcoqFtgnp1JE9w8nc?=
 =?iso-8859-1?Q?CR5nBQolT3qf0ZVcW1kBXQz3w6Vs0T0dBFkeXYBZ0GTOnyDZrVvxB7V7Gr?=
 =?iso-8859-1?Q?eSDGRnoNfJr7ufYrKBQb6do0hkdEpoHsyinSSGCdm9kqrmrFXoqg7Y9SR2?=
 =?iso-8859-1?Q?WPIKVYrylWuS79S6GEcaVVM+8MmViK2vJquXj+odxMZ3ayIQ9DYKYz58nm?=
 =?iso-8859-1?Q?48FLYh8aK2nxkuScxXEPV0nENDqfbS/UanXPGpuvTC7oKypgdjibd1FcT3?=
 =?iso-8859-1?Q?vyCj7SnNVb0kJsUUYuWnIJmNSWDVq7628ZdR2+Ufpbo8fNXHIDguVMr7ZT?=
 =?iso-8859-1?Q?ThRCtjpUYVu5EpI/uw1vVauL1mM5Q6KVOoeZ3QR/N8wl2GnlXOYXvJcWin?=
 =?iso-8859-1?Q?I4YW84R6HpxSnCCS3i9NNPV6MOudLAtRsirwlBYNyAllIcYfeEIv5OAL5w?=
 =?iso-8859-1?Q?44CAMs7m1GSnHpWyUB0M2+4XIxJgwdgHHXYHO8PGEs/+hQ7mIlCGEKa3QR?=
 =?iso-8859-1?Q?eGkOOgtIxfzUq9nkat/L6Ha4PitjwBNycsvoB7zuo/vxy+tSOQmuPT2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2e0f4f-5b51-46a1-4418-08db03a03340
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:31:19.4600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9ZLsABOT2Cn/JjoxGVOgdx9ABeVc74kPocJnZacwQqZrqbPEjhetb6D4RZ8MaxOGhoZjstvxSVyAdNLUzToWHmWqobWfQkSP9LsSCmA+xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6560
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 04:04:08PM +0200, Jani Nikula wrote:
>On Tue, 31 Jan 2023, "Souza, Jose" <jose.souza@intel.com> wrote:
>> On Tue, 2023-01-31 at 09:24 +0200, Jani Nikula wrote:
>>> On Mon, 30 Jan 2023, José Roberto de Souza <jose.souza@intel.com> wrote:
>>> > +static const struct xe_rtp_entry lrc_additional_programming[] = {
>>> > +	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
>>>
>>> Please add newline after {, and indent with tabs not spaces.
>>
>> All the xe_rtp_entry arrays have this style pattern, just following
>> what is already in the file.
>
>Yuck. :p

and I'm the guilty one. It is a table and when adding a lot of entries
the ", {" alone in the line for each entry consumes a lot of vertical
waste space, so I decided to merge them. I considered merging the "}"
too which would balance it, but looked nice to have at least a separator
between each entry.

As we add more entries we may decide another format for the table.
For this series I think the pending decision is more on the UABI side:
do we want to support this for older platforms knowing that future ones
will have this setting changed?

+Rodrigo, +Matt

Lucas De Marchi

>
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
