Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BC1EDEBF0
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 20:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC6610E8C1;
	Tue,  3 Mar 2026 20:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jK5q2WeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF5E10E8BB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772570181; x=1804106181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RZ87FtKih2sSHST4EtRzSRH9i5zY9a4vtjnFeKR9D1g=;
 b=jK5q2WeSA93SYf85fdXGPB9lQNAWjcH7KTL6DXFxkzGujMUpaqjz6Ofo
 PLumiNgJ6j0YtowFyKs7UZkgovlPA/tmumYJskj+N7UEDC4u+aIkpoxYp
 jpKT9mUplzDub2Xb2jTzLrLy8meOTKbKhfkFxxKacW2XL2ELE7r939O2k
 A1MxMdrq3qCvAOKCURx/8USgW+vWC/aF1fQySxkZOtc0fb/LlzhZ4xkjB
 CHcyh1s1W93K4vPxDi5wnNi+XUS1rxjJciAEoR57dgJzEzAdpl7DyILqc
 lx+RixVK6QyhTgpF+0zJ3F9b5wqaD+CpQGdcBPj9zThQgrVBMLpIbKzRn w==;
X-CSE-ConnectionGUID: yl0NjkbOTEKr9ZACAMoGvA==
X-CSE-MsgGUID: sV0MLVvaTvCbcWNNSrFMYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73539069"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73539069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:36:20 -0800
X-CSE-ConnectionGUID: 3NmEFEflRHyZ4RYUszxvOQ==
X-CSE-MsgGUID: 1WOWn119SkuVN/1n83QwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="248601352"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:36:20 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 12:36:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 12:36:19 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 12:36:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Znp9GbOe28Ru8k98arf2a9HcKu9Xsg790x+QOi6Oe0CK2jR423F7mwT1lAnuDNd3xmAqN7f7lNI4acSmr0phnM8wSgpvocgkYVAM+3LSlLrXJW0uxTnSM+jKfXI1A3VZzEQaczTVF/QLtnmG2Pl4O/xMZRM+suz8T4ZglVTpvZ9oxXGpF68zMcmhFFkT6eRpC7lxE639cu9V7/16KVjPAkpe6Gv5fUVCuAkdtKqw1lfOjZDECaIrYejJmigCpt34HULIR2E3C9Ik+EN564uWui3fPLiI+yHfx74jcRQIhw7ed5Eh7sp78cRbY3xZH/SuTtnKcXXmrOwLj0qbwVg2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56dAvnqRkBla11Wv94MSiIBU4pG8DVA7vcWowHI1FsQ=;
 b=iFBBSdP/j6fQOC3sKsIQNJtxrpAtdk/3VOaVjLRuLUEsTSLXvk594QjwvBKT2c+gwzUbCiHsrCXKSjMlooT+MmPipJtNhKzFuzjKWvY2xBfLKKxDqlKa/xGJ2zlcNd05Wln7jeDuHoms1N+6h/RsogAJAe85aunGaJw0Mf2fLSNrDCf7bnr0xQJVgtBnGUHmNq3pklPwqGev1Aph8TR5oosMpJx6b/ieXHWeWEckY2g0rCSm1GoyQ2uad+pxWo9t7OAAG5fTC0j817lGI8VFBGeB2+4hdFp9XBAl/CzieMjuRiaQKCs7bd1u7FArFIlGd+auUPvdcOPaOuxiavKOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 20:36:16 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 20:36:16 +0000
Date: Tue, 3 Mar 2026 12:36:13 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andy Whitcroft <apw@canonical.com>, "Joe
 Perches" <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, "Lukas
 Bulwahn" <lukas.bulwahn@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] checkpatch: teach checkpatch about the Assisted-by:
 tag for AI-assisted patches
Message-ID: <aadGPRx0Pbl2Uh53@nvishwa1-desk>
References: <20260302143659.41882-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302143659.41882-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA1PR11MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e43ec76-670b-468f-47c6-08de796484be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: KGD0fCfz3FICRcGDaQknA85yKQaNv9mHPHVwCIrfEJRfeYXQ5h1snhrgbcL+WR6RDhRSoe5zVBgedSq30da9iKk47NmGzaoVM4SZTAzT/400TJT7kBD8EcQqz7y73c15W4Iffcfqz4LicFIQxJiR6wUNL1QlawXeBoHbAp2sSMRot9PH04MjFTmRRlZ8XFln40aHULv6FoJLPPlEbmw9eczr6/U/s90l3OGJwqxCCCpuw5rSTrEeAtLC9aDDFThm/8ycEYcc8jVyJcICFYRmZrHizXmA8Bcf+bB4FXgg1VieWy6cioHNFtNvildFrgUqkUjW9WDWyiGHCKteVWgTPIwgXf63FI6umSxD97TzGFykZH2CJPVxP4fOIcvdio9Qq96hk8iMo3Fghz6PAGOiWqk8su7JLp6vF7TqUWIVcvg6bRjdnbhdUeYMvjNrno/u34T4DNFSadiSY5ORwnAfcakUCNpUGKEF2yqj8fLJhccCTF0eiLTYZH/Ds6GOOPHPLTwsIq91kFoAfQemCU0igM2kvt9zsw3ywI2h9gA9BVexscU9apIZ9JUhv3Pi1+sOcFcN3HQ/ejdGUbFfA+zFKNAnrxy5cRmWCUksuxeOOxyM++/ExAklqqDL9Z5cCf8+/Mi5W677awTlZLtpjZIHAaYcCdOv5l81/SYGv4x66jhzExh0EF60/4PKrQJLW5E4RQA/u7uNTYVqnyA+RUcvQMUL/2FXYUCuYxXM+RolHno=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2h5ptWN80flVgimK0VpxkLlSbOel24p66Lwl3M6XunanLNAjc+0m8t9SmZ?=
 =?iso-8859-1?Q?fSUMe3Jah27ioS1+N8N5KkdlXmTlypE8u3x/q0eVBBvcmsCNhjPHxdDeH7?=
 =?iso-8859-1?Q?6ng8ptAZx1iCh+PfRn/nIi9WKgj/zLK+G4fbsvCqf1JPgrleUi8Jus7wb8?=
 =?iso-8859-1?Q?rv2MwFL7gGs9t1p/MbjXdsLtM2wp2RuEFcBotqjhJevRODlFT7RqBKCKvq?=
 =?iso-8859-1?Q?UvQ85b1wFuvtfEbrpqTgmwRSYd21RsKVp9lbpsES4mE45jTS9zM5MIEqyr?=
 =?iso-8859-1?Q?V5QhaQvTN7JfKoaCkQIoyLJPV2LMghjpEdC2XDD9c5CVDIEheeq8ZxHfZa?=
 =?iso-8859-1?Q?pDMaJBwnSdmhNMdH3udFu7EBBVB08a9Y4IuO4TdulorBJ0esKB/x+SW4Qn?=
 =?iso-8859-1?Q?z7ZABwf9Z4YZh+jI0g0jNmWkDZLDxsgAY6ckaoxSKt0qVUvwVGrpBR7LTO?=
 =?iso-8859-1?Q?TyAIRL53hA6LyLDxEsqJLcz94i+8u/Rxw4ktOZ9c7adl/hjw990GKR5qM+?=
 =?iso-8859-1?Q?3SnF3PPS8xoc1HDybEyK8YPg/XAPW+DAcivFVq384C8Mmb28D3+2Y7wsTL?=
 =?iso-8859-1?Q?ZqyLBzuM7lUOQxm6Y8ki3zVU40vVQfuTFOMTX5UoShW4qd27YUhL2pPkKq?=
 =?iso-8859-1?Q?pHaIVqp6MuuBa7mjbe7PtsJ1ESt9xEPwE/YY74Q2ua5ZZxU/auEssc5emD?=
 =?iso-8859-1?Q?vhUF/COK6Ud0/ezLNzYg5VM85wNP3NPhpMu4vdCZ1ijrLqHjs/jh4O6mhX?=
 =?iso-8859-1?Q?oRdGI++NmwHiQ0G7bNLAuuNh2HbN0JmP4TT/j7Mkz30Nud8DgBDpeO1YOi?=
 =?iso-8859-1?Q?SZR3OIUr3/WeGHBD3mO/nuvJjPjiW3iDiL2GIJk9XXcQ6/4TFyFqug4CC/?=
 =?iso-8859-1?Q?efdKOiLXl6ghFZekkq5fIopojacp4bPLzZfCe9VPowOD0+qgJp5IdhT0l+?=
 =?iso-8859-1?Q?4sX2qCRDFtv5ZIKxbT/3yq8QlMhALv98BzY/lZfaV4sOfCJDxud0LFp/B8?=
 =?iso-8859-1?Q?k9yuZKiX+pq+fN+JBe9a6CQXLNlylRmLb3l2zvN939FyMydpWQG/Qep8QA?=
 =?iso-8859-1?Q?8Ta6DfgfiYhaClz1vMWL57dhXHe2O5YR5ukwQ69Yu15PQ4rwcby61QweXu?=
 =?iso-8859-1?Q?dpyraUlwwPsndIoqsZWTViMCskibOTo3oMjakY8u6hsm7JAkBNgrJQvcpK?=
 =?iso-8859-1?Q?8R9hNZQo0dkwQ+25UcXmxiW6y6hJtGSVLEka/kY62zLNqa+RuTeYqcvv4h?=
 =?iso-8859-1?Q?wHmWxjanjKf/tXBQDBqvr6WiZoRPVaSnqUfqvZq9xDuYC0ugJIALxy9Ne9?=
 =?iso-8859-1?Q?Z6iu94IWoDHxt5zTfUe3uaWGaE642qEVQ5tZ64oZBCpGIHuCzA9zt6WubI?=
 =?iso-8859-1?Q?LkkFxRg2yltztoHwti61CTc9akPy/uedL1KsCSZODbxKqdPp/GEvN1j+O4?=
 =?iso-8859-1?Q?Mw7G/CALu2Wh9yROxy4dhMKBnmcSVVSkctYj4+QmK0ZGx1udem6YklNrGR?=
 =?iso-8859-1?Q?Z6+A7sKcnihZ5WmF18lfsKFVQQBxlrvgEm4QJft1vlOFL+O6ysY+9YJ+9g?=
 =?iso-8859-1?Q?pOPrm4128k8QlzyQrMN0flLGWPmhh1aULS4Ogi66km7qzh1bxC7Xgf2t4z?=
 =?iso-8859-1?Q?37IuVkRc/QFJjxFw38icjC1IVF2g6kT2sjS0As5sgt3zApWXkxA1Ch4nDS?=
 =?iso-8859-1?Q?Lfu6WYP3it/PRXC1XL56luK4m8DPgpn5phw/TZ8+P8Y3eI7QJYPQGxEVI4?=
 =?iso-8859-1?Q?apbajC6xtRBzMmgafSS89gKUEXKdebMwpn9ZxqrdGfLZnZpstPT8DqGREG?=
 =?iso-8859-1?Q?je/41X6pQaFkywktvHmLMNEJak7ceBBmMV0mr8AHt9o03+1SDpT5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e43ec76-670b-468f-47c6-08de796484be
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:36:16.6201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7MCC/dx9gYPkMZfGzp2fodqutBAn8CITI1+3+PcFmsZQMd1qmKO2jd7IFUWTfratCJ/yEwO4XQcDtlUo8dFg/Cr619eLcGNskyRXiO0iyWw66idRRS2F/ftvVGhzBrP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
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

On Mon, Mar 02, 2026 at 03:36:59PM +0100, Thomas Hellström wrote:
>Documentation/process/coding-assistants.rst mandates the use of an
>uses an "Agent:Model" notation rather than a name-and-email-address
>pair, for example:
>
>  Assisted-by: GitHub Copilot:claude-sonnet-4.6

Do we need the Agent to be specified along with the model given the
agents tend to me more custom built (or private) and model tend to be
more generic? Not sure if my assumption is entirely true though.

Niranjana

>
>checkpatch.pl currently emits false-positive errors and warnings for
>this tag:
>
>  WARNING: Non-standard signature: Assisted-by:
>  ERROR: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
>
>Teach checkpatch about the tag:
>
>- Add Assisted-by: to the $signature_tags regex so it is no longer
>  flagged as a non-standard signature.
>- Add Assisted-by: to the standard_signature_tags list in
>  find_standard_signature() so that near-miss typos (e.g.
>  'Assited-by:') suggest the correct spelling.
>- Skip the email-address validation for Assisted-by: tags and instead
>  validate that the value contains at least one colon separating the
>  agent name from the model identifier.  Emit a BAD_SIGN_OFF warning
>  if the notation does not conform.
>
>Cc: Andy Whitcroft <apw@canonical.com>
>Cc: Joe Perches <joe@perches.com>
>Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
>Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>Cc: linux-kernel@vger.kernel.org
>Assisted-by: GitHub Copilot:claude-sonnet-4.6
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> scripts/checkpatch.pl | 13 +++++++++++--
> 1 file changed, 11 insertions(+), 2 deletions(-)
>
>diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>index e56374662ff7..dd3327e8fa55 100755
>--- a/scripts/checkpatch.pl
>+++ b/scripts/checkpatch.pl
>@@ -641,6 +641,7 @@ our $signature_tags = qr{(?xi:
> 	Reviewed-by:|
> 	Reported-by:|
> 	Suggested-by:|
>+	Assisted-by:|
> 	To:|
> 	Cc:
> )};
>@@ -737,7 +738,7 @@ sub find_standard_signature {
> 	my ($sign_off) = @_;
> 	my @standard_signature_tags = (
> 		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:', 'Tested-by:',
>-		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'
>+		'Reviewed-by:', 'Reported-by:', 'Suggested-by:', 'Assisted-by:'
> 	);
> 	foreach my $signature (@standard_signature_tags) {
> 		return $signature if (get_edit_distance($sign_off, $signature) <= 2);
>@@ -3107,7 +3108,15 @@ sub process {
>
> 			my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
> 			my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
>-			if ($suggested_email eq "") {
>+			# Assisted-by: uses "Agent:Model" notation without an email
>+			# address, as mandated by Documentation/process/coding-assistants.rst.
>+			# Skip email validation for this tag.
>+			if ($sign_off =~ /^Assisted-by:$/i) {
>+				if ($email !~ /\S+:\S+/) {
>+					WARN("BAD_SIGN_OFF",
>+					     "Assisted-by: should use 'Agent:Model' notation (e.g. 'GitHub Copilot:claude-sonnet-4.6')\n" . $herecurr);
>+				}
>+			} elsif ($suggested_email eq "") {
> 				ERROR("BAD_SIGN_OFF",
> 				      "Unrecognized email address: '$email'\n" . $herecurr);
> 			} else {
>-- 
>2.53.0
>
