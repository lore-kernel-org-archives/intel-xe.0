Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC30EA4E07
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 14:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF88910E516;
	Mon,  2 Mar 2026 14:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8uzzmHd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D15E10E516
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772462245; x=1803998245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wDuNoNFL2BuXKoRf49vLBzgfvBNxte9P8TyRC/DNIxs=;
 b=C8uzzmHdgtp9mOisPNfbY/giUv0EqjnuYy5MVoXAjVMy2i+UAJvw+hnL
 SownffpRKuRpZFYx/7wYxLGFFd4d1kLtdsJE+Ruw++XF6UMQMBl6wla2p
 A92iRPxw3D+haq7jpjV86Si2uFqH18VxFr5GPQ+AD3/hYAeN4OVkbhqcj
 4BF6q6Bm5R27xAkIUvPVSqM+KVXaq3VNJ6GRpJGoKf3jKrSDN9at1yF7N
 ssDmy9jAcg+GI/2rysPwm863xvOJBryRJX2oc28Gcb5rcHejcbCN4QOVX
 8PPQwoETL3MhoRNHA22F1/3ulupfCjojYvH5M44rNK6uPnZMlRvPtEMvd Q==;
X-CSE-ConnectionGUID: +CagUkhwRouE1U5Gt8ac+g==
X-CSE-MsgGUID: QzhU8XQlQuyR0lK/7AZo1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="96085776"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="96085776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:37:25 -0800
X-CSE-ConnectionGUID: fy6XthnTS2qZQzEXOweHQA==
X-CSE-MsgGUID: Y4L0aM8aTh6eSINCufiycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222301675"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.81])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:37:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] checkpatch: teach checkpatch about the Assisted-by: tag
 for AI-assisted patches
Date: Mon,  2 Mar 2026 15:36:59 +0100
Message-ID: <20260302143659.41882-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Documentation/process/coding-assistants.rst mandates the use of an
uses an "Agent:Model" notation rather than a name-and-email-address
pair, for example:

  Assisted-by: GitHub Copilot:claude-sonnet-4.6

checkpatch.pl currently emits false-positive errors and warnings for
this tag:

  WARNING: Non-standard signature: Assisted-by:
  ERROR: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'

Teach checkpatch about the tag:

- Add Assisted-by: to the $signature_tags regex so it is no longer
  flagged as a non-standard signature.
- Add Assisted-by: to the standard_signature_tags list in
  find_standard_signature() so that near-miss typos (e.g.
  'Assited-by:') suggest the correct spelling.
- Skip the email-address validation for Assisted-by: tags and instead
  validate that the value contains at least one colon separating the
  agent name from the model identifier.  Emit a BAD_SIGN_OFF warning
  if the notation does not conform.

Cc: Andy Whitcroft <apw@canonical.com>
Cc: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel@vger.kernel.org
Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 scripts/checkpatch.pl | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff7..dd3327e8fa55 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -641,6 +641,7 @@ our $signature_tags = qr{(?xi:
 	Reviewed-by:|
 	Reported-by:|
 	Suggested-by:|
+	Assisted-by:|
 	To:|
 	Cc:
 )};
@@ -737,7 +738,7 @@ sub find_standard_signature {
 	my ($sign_off) = @_;
 	my @standard_signature_tags = (
 		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:', 'Tested-by:',
-		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'
+		'Reviewed-by:', 'Reported-by:', 'Suggested-by:', 'Assisted-by:'
 	);
 	foreach my $signature (@standard_signature_tags) {
 		return $signature if (get_edit_distance($sign_off, $signature) <= 2);
@@ -3107,7 +3108,15 @@ sub process {
 
 			my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
 			my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
-			if ($suggested_email eq "") {
+			# Assisted-by: uses "Agent:Model" notation without an email
+			# address, as mandated by Documentation/process/coding-assistants.rst.
+			# Skip email validation for this tag.
+			if ($sign_off =~ /^Assisted-by:$/i) {
+				if ($email !~ /\S+:\S+/) {
+					WARN("BAD_SIGN_OFF",
+					     "Assisted-by: should use 'Agent:Model' notation (e.g. 'GitHub Copilot:claude-sonnet-4.6')\n" . $herecurr);
+				}
+			} elsif ($suggested_email eq "") {
 				ERROR("BAD_SIGN_OFF",
 				      "Unrecognized email address: '$email'\n" . $herecurr);
 			} else {
-- 
2.53.0

